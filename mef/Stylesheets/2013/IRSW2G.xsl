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
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
          <div class="styIRSW2GRowItem" style="width:187mm;height:125mm;padding:0px 0px 0px 0px;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;">
            <!-- BEGIN: Header  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GHeaderFrame">
              <span style="width:22mm;"/>
              <span style="font-size:9pt;font-family:OCRA,Arial;">3232</span>
              <span style="width:16mm;"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormW2GData/VoidInd"/>
                  <xsl:with-param name="BackupName">IRSW2GVoidInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width:2mm;"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormW2GData/VoidInd"/>
                  <xsl:with-param name="BackupName">IRSW2GVoidInd</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:9pt">VOID</span>
              </label>
              <span style="width:10mm;"/>
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
            <!-- END: Header    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
            <!-- BEGIN: Top Left  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GLeftTopFrame">
				
              <!-- 1st Col -->
              <div class="styIRSW2GRowItem" style="width:79mm;height:95mm;float:left;">
                <!-- Payers Name, street address, city, state, and ZIP code >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;height:40mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft" style="height:10mm;">
                    <span style="width:3px;float:left;"/>
                    <span style="font-size:6pt;font-family:Arial;">PAYER'S name, street address, city or town, province or state, country, ZIP or foreign postal code</span>
                    <span style="width:3px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormW2GData/PayerNameControl"/>
                    </xsl:call-template>
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
                    </xsl:if><br/>
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
                        </xsl:if><br/>
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
                        </xsl:if><br/>
                      </xsl:otherwise>
                    </xsl:choose>
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
                 
                <!-- Federal identification number/Telephone number >>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;border:0px solid black;border-top-width:1px;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Federal identification number
                    <span style="width:13mm;"/>Telephone number</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <div class="styIRSW2GDataLTxtField" style="padding-left:0px;padding-right:10mm;width:50%;text-align:center;float:left;height:6mm;">
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
                    <div class="styIRSW2GDataLTxtField" style="padding-left:0px;padding-right:10mm;width:49.9%;text-align:center;float:left;">
                      <xsl:call-template name="PopulatePhoneNumber">
                        <xsl:with-param name="TargetNode" select="$FormW2GData/PayersTelephoneNumber"/>
                      </xsl:call-template>
                    </div>
                  </div>
                </div>
                
                <!-- WINNER'S name >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;border:0px solid black;border-top-width:1px;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">WINNER'S name</span>
                  </div>
                  <div class="styIRSW2GDataLTxtField">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsName"/>
                    </xsl:call-template>
                  </div>
                </div>
                
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
                
                <!-- City or town, province or state, country, and ZIP or foreign postal code >>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:79mm;float:left;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">City or town, province or state, country, and ZIP or foreign postal code</span>
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
                
                <div class="styIRSW2GRowItem" style="width:79mm;height:14mm;float:left;background-color:lightgrey;border:0px black solid;border-top-width:1px;"/>
				
              </div>
              
			  <!-- ##@1st Row -->
			  <div class="styIRSW2GRowItem">
				  <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>1</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Gross winnings</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
					<div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinGrossWinningAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>2</b>
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
              <!-- ##@2nd Col -->
              <div class="styIRSW2GRowItem">
               
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
                <!-- (4) Federal income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>4</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Federal income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/FederalIncomeTaxWithheldAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@3rd Row -->
              <div class="styIRSW2GRowItem">
                
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
                <!-- (6) Race >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
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
                
                <!-- (7) Winnings from identical wagers >>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>7</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Winnings from identical wagers</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinFromIdentWagersAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (8) Cashier >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
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
                
                <!-- (9) Winner's taxpayer identification no.>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>9</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Winner's taxpayer identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:6mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientsIdNumber"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (10) Window >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>10</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Window</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="height:6mm;">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinWindowNum"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <!-- ##@6th Row -->
              <div class="styIRSW2GRowItem">
                
                <!-- (11) First I.D.>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>11</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">First I.D.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:6mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientFirstAddtionalIDNum"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (12) Second I.D. >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>12</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Second I.D.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:6mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSecondAddtionalIDNum"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              <xsl:choose>
              <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &lt;= 1 and count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &lt;= 1">
              <!-- ##@7th Row -->
              <div class="styIRSW2GRowItem">             
                <!-- (13) State/Payer's state identification no. >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>13</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State/Payer's state identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:6mm;">
                    <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/StateAbbreviationCd"/>
                    </xsl:call-template>
                    <span style="width:6px;"/>
                    <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/PayersStateIdNumber"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (14) State winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>14</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">State winnings </span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:6mm;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/GamblingWinningAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              
              <!-- ##@8th Row -->
              <div class="styIRSW2GRowItem">
                
                <!-- (15) State income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>15</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:6mm;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/StateTaxWithheldAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (16) Local winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>16</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Local winnings</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:6mm;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp/GamblingWinningAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              
              <!-- ##@9th Row -->
              <div class="styIRSW2GRowItem">
                
                <!-- (17) Local income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;height: 13.2mm;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>17</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Local income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:9.2mm;border-bottom-width:0px;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp/LocalIncomeTaxAmt"/>
                    </xsl:call-template>
                  </div>
                </div>
                <!-- (18) Name of locality >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;height: 13.2mm;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>18</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Name of locality</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:left;height:9.2mm;border-bottom-width:0px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp/NameOfLocality"/>
                    </xsl:call-template>
                  </div>
                </div>
              </div>
              </xsl:when>
              <xsl:otherwise>
              <!-- ##@7th Row -->
              <div class="styIRSW2GRowItem">             
                <!-- (13) State/Payer's state identification no. >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>13</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State/Payer's state identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:6mm;">
                    
                  </div>
                </div>
                <!-- (14) State winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>14</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">State winnings </span>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Lines 13-18 Data Table</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp"/>
                    </xsl:call-template>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:6mm;">
                    <div style="text-align:left;float:left;">$</div>                    
                  </div>
                </div>
              </div>
              
              <!-- ##@8th Row -->
              <div class="styIRSW2GRowItem">
                
                <!-- (15) State income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>15</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:6mm;">
                    <div style="text-align:left;float:left;">$</div>
                  </div>
                </div>
                <!-- (16) Local winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>16</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Local winnings</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:6mm;">
                    <div style="text-align:left;float:left;">$</div>
                  </div>
                </div>
              </div>
              
              <!-- ##@9th Row -->
              <div class="styIRSW2GRowItem">
                <!-- (17) Local income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;height:13.2mm">
                  <div class="styIRSW2GDataMRTitle">
                    <b>17</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Local income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:9.2mm;border-bottom-width:0px;">
                   <div style="text-align:left;float:left;">$</div>
                  </div>
                </div>
                <!-- (18) Name of locality >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:right;height:13.2mm;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>18</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Name of locality</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:9.2mm;border-bottom-width:0px;">
                    
                  </div>
                </div>
              </div>
              </xsl:otherwise>
              </xsl:choose>
            </div>
            <!-- END: Top Left  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <!-- BEGIN: Top Right ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GRightTopFrame" style="width:31.8mm;height:38.8mm;border-bottom-width:0px;">
              <div style="width:100%;text-align:right;float:right;">
                <div class="styOMB" style="height:2mm;font-size:7pt;border-bottom-width:0px;">OMB No. 1545-0238</div>
                <div class="styTY">20<span class="styTYColor">13</span>
                </div>
                <span style="font-family:Arial;font-size:10pt;">
                  <b>Form W-2G</b>
                </span>
                <br/>
                <br/>
                <span style="font-family:Arial;font-size:8pt;">
                  <b>Certain<br/>Gambling<br/>Winnings</b>
                </span>
              </div>
            </div>
            
            <div class="styIRSW2GRightBottomFrame" style="width:31.5mm;height:32mm;text-align:right;border-top-width:1px;border-bottom-width:0px;">
              <br/>
              <br/>
              <span style="font-family:Arial;font-size:6.5pt;">
                    For Privacy Act and<br/>
                    Paperwork Reduction Act<br/>
                    Notice, see the <b>2013</b>
                  <br/>
                  <b>
                    General Instructions for<br/>
                    Certain Information<br/>
                    Returns.</b>
              </span>
            </div>
            
             
            <div class="styIRSW2GRightBottomFrame" style="width:31.5mm;height:24mm;border-top-width:1px;">
              <div style="width:100%;text-align:right;float:right;">
                <div style="font-family:Arial;font-size:7.7pt;padding-top:4mm;float:right;">
					<b>
                      <xsl:call-template name="LinkToLeftoverDataTableInline">
                        <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
                        <xsl:with-param name="TargetNode" select="$FormW2GData/StandardOrNonStandardCd"/>
                      </xsl:call-template><span style="width:4px;"/>
                      <span style="font-size:6.5pt;">File with Form 1096</span><br/><br/>
					 Copy A<br/>For Internal Revenue<br/>Service Center</b>
                </div>
              </div>
            </div>
            
            <!-- END: Top Right \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
            <!-- BEGIN: Bottom Left /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styIRSW2GLeftBottomFrame">
              <div style="width:100%;text-align:left;padding-left:4mm;padding-top:3px;">
                <span style="font-family:Arial;font-size:6pt;">
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
           
            <!-- BEGIN: Footer  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styGenericDiv">
              <span style="font-family:Arial;font-size:7pt;">
                <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top-width:0px;">
                  <div style="float:left;padding-top:0px;"> 
                      Form <span class="styBoldText" style="font-size:8pt;">W-2G</span>
                  </div>
                  <div style="float:left;">
                    <span style="width:25mm;"/>  
                    Cat. No. 10138V<span style="width:20mm;"/>IRS.gov/w2g
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
            <div class="styLeftOverTitle" style="float:left;">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer" style="float:right;">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormW2GData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/PayerNameControl"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/StandardOrNonStandardCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 or count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &gt; 1">
            <tr>
			  <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Lines 13-18 - Data Table:</td>  
			  <td class="styLeftOverTableRowAmount" style="width:87mm;"/>                     
			</tr>
			</xsl:if>
          </table>
           
          <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 or count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &gt; 1">
          <div class="styTable" style="margin-top:0mm;margin-bottom:2mm;">
          <table  class="styTableContainer" cellspacing="0" cellpadding="0" style="font-size:8pt;width:187mm;border-width: 1px 1px 1px 1px;">
				<tbody>
					<tr style="font-size: 7pt;">
						<th scope="col">13<span style="width:10px"/>State </th>
						<th scope="col" style="border-right:1px solid black">/Payer's state identification no.</th>
						<th scope="col" style="border-right:1px solid black">14 State winnings</th>
						<th scope="col" style="border-right:2px solid black">15 State income tax <br/> withheld</th>
						<th scope="col" style="border-right:1px solid black">16 Local winnings</th>
						<th scope="col" style="border-right:1px solid black">17 Local income tax<br/> withheld</th>
						<th scope="col" style="">18 Name of locality</th>
					</tr>

					<xsl:for-each select="$FormW2GData/W2GStateLocalTaxGrp">
					<tr style="font-size: 6pt;">
						<td class="styIRSW2GCell" align="center">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="StateAbbreviationCd"></xsl:with-param>
							</xsl:call-template>
						</td>

						<td class="styIRSW2GCell" align="center">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PayersStateIdNumber"></xsl:with-param>
							</xsl:call-template>
						</td>
						<td class="styIRSW2GCell" align="right">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GamblingWinningAmt"></xsl:with-param>
							</xsl:call-template>
						</td>
						<td class="styIRSW2GCell" align="right" style="border-right:2px solid black" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"></xsl:with-param>
							</xsl:call-template>
						</td>
						<xsl:for-each select="W2GLocalTaxGrp">
							<xsl:if test="position()=1">
								<td class="styIRSW2GCell" align="right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GamblingWinningAmt"></xsl:with-param>
									</xsl:call-template>
								</td>
								<td class="styIRSW2GCell" align="right">
									<xsl:call-template name="PopulateAmount" >
										<xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"></xsl:with-param>
									</xsl:call-template>
								</td>
								<td class="styIRSW2GCell" style="border-right-width:0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="NameOfLocality"></xsl:with-param>
									</xsl:call-template>
								</td>
							</xsl:if>
							<xsl:if test="position()!=1">
								<tr style="font-size:6pt;">
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="border-right:2px solid black;background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell"  align="right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GamblingWinningAmt"></xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styIRSW2GCell"  align="right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"></xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styIRSW2GCell" style="border-right-width:0">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="NameOfLocality"></xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</tr>
					</xsl:for-each>
				</tbody>
			</table>
			</div>
			</xsl:if>
		  <div class="styGenericDiv" style="height:5mm;"/>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
