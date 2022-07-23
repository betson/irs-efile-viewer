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
          <div class="styIRSW2GRowItem" style="width:187mm;height:90mm;padding:0px 0px 0px 0px;border-right-width:0px;border-left-width:0px;border-top-width:0px;border-bottom-width:0px;">
            <!-- BEGIN: Header  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <!-- new beginning -->
            <div style="width:187mm;">
              <span style="width:2mm;background-color:red"/>
              <span style="font-size:9pt;font-family:OCRA,Arial;">3232</span>
              <span style="width:16mm;background-color:lightblue"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormW2GData/VoidInd"/>
                  <xsl:with-param name="BackupName">IRSW2GVoidInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width:0mm;"/>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormW2GData/VoidInd"/>
                  <xsl:with-param name="BackupName">IRSW2GVoidInd</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:9pt">VOID</span>
              </label>
              <span style="width:5mm;"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormW2GData/CorrectedW2GInd"/>
                  <xsl:with-param name="BackupName">IRSW2GCorrectedW2GInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="width:0mm;"/>
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
          
            <div class="styIRSW2GLeftTopFrame" style="width:187mm;height:110mm;border-right-width:0px">
            
             <div style="width:187mm;">        
                 <div class="styIRSW2GRowItem" style="width:77.4mm;height:39mm;float:left;padding-top:0mm;">
                      <span style="font-size:6pt;font-family:Arial;float:left;padding-left:2mm;padding-top:2.5mm;">PAYER'S name, street address, city or town, province or state,</span>
                       <span style="font-size:6pt;font-family:Arial;float:left;padding-left:2mm;"> country, and ZIP or foreign postal code</span>
                 <span style="width:3px;height:4mm"/>                  
                 <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormW2GData/PayerNameControlTxt"/>
                 </xsl:call-template>
                 <br/><br/>
                  <div class="styIRSW2GDataLTxtField" style="padding-left:2mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/PayerName/BusinessNameLine1Txt"/>
                    </xsl:call-template>
                    <xsl:if test="$FormW2GData/PayerName/BusinessNameLine2Txt">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2GData/PayerName/BusinessNameLine2Txt"/>
                      </xsl:call-template>
                    </xsl:if><br/>
                 
                 <xsl:choose>
                      <xsl:when test="$FormW2GData/PayerUSAddress/AddressLine1Txt">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/PayerUSAddress/AddressLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/PayerUSAddress/AddressLine2Txt">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/PayerUSAddress/AddressLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if><br/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/PayerForeignAddress/AddressLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/PayerForeignAddress/AddressLine2Txt">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/PayerForeignAddress/AddressLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if><br/>
                      </xsl:otherwise>
                    </xsl:choose>
                      <xsl:call-template name="PopulateCityStateInfo">
						<xsl:with-param name="TargetNode" select="$FormW2GData/PayerUSAddress"/>
						<xsl:with-param name="ForeignAddressTargetNode" select="$FormW2GData/PayerForeignAddress"/>
					</xsl:call-template>
					<span style="width:7px;"/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormW2GData/PayerForeignAddress/CountryCd"/>
					</xsl:call-template>
                           </div>
                    
                    
                   
                    
                    
                    
                </div>
                
                <div class="styIRSW2GRowItem" style="width:74.4mm;height:40mm;float:left;">
                   <div class="styIRSW2GRowItem">
                       <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                           <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                               <b>1</b>
                               <span style="width:3px;"/>
                               <span style="font-size:6pt;font-family:Arial;">Reportable winnings</span>
                           </div>
                            <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
					            <div style="text-align:left;float:left;">$</div>
                                <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingReportableWinningAmt"/>
                                </xsl:call-template>
                            </div>
                            
                            <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                            <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                                  <b>3</b>
                                 <span style="width:3px;"/>
                              <span style="font-size:6pt;font-family:Arial;">Type of wager</span>
                           </div>
                            <div class="styIRSW2GDataMRTxtFields">
                              <!--<span style="width:7px;"/>-->
                              <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinWagerTypeCd"/>
                              </xsl:call-template>
                          </div>  
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
                           <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                             <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>7</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Winnings from identical wagers</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinFromIdntclWagersAmt"/>
                    </xsl:call-template>
                  </div>
                           </div>
                           
                          </div>
                                                
                         </div>
                       
                       </div>
                       <div class="styIRSW2GRowItem" style="width:37mm;">
                          <div class="styIRSW2GDataMRTitle" style="padding-left:8px;width:37.7mm;border-right-width:1px;">
                             <b>2</b>
                             <span style="width:3px;"/>
                             <span style="font-size:6pt;font-family:Arial;">Date won</span>
                        </div>
                        <div class="styIRSW2GDataMRTxtFields" style="text-align:center;border-right-width:1px;">
                          <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinningDt"/>
                         </xsl:call-template>
                      </div>
                      <div class="styIRSW2GRowItem" style="width:37mm;float:left;width:37.7mm;">
                      <div class="styIRSW2GDataMRTitle" style="padding-left:8px;width:37.7mm;border-right-width:1px;">
                        <b>4</b>
                        <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Federal income tax withheld</span>
                  </div>
                   <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;border-right-width:1px;">
                    <div style="text-align:left;float:left;">$</div>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/FederalIncomeTaxWithheldAmt"/>
                    </xsl:call-template>
                  </div>
                  
                   <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                     <div class="styIRSW2GDataMRTitle" style="padding-left:8px;width:37.7mm;border-right-width:1px;">
                    <b>6</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Race</span>
                  </div>
                   <div class="styIRSW2GDataMRTxtFields" style="border-right-width:1px;" >
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinningEventDesc"/>
                    </xsl:call-template>
                  </div>
                  <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                      <div class="styIRSW2GDataMRTitle" style="padding-left:8px;width:37.7mm;border-right-width:1px;">
                         <b>8</b>
                         <span style="width:3px;"/>
                        <span style="font-size:6pt;font-family:Arial;">Cashier</span>
                    </div>
                    <div class="styIRSW2GDataMRTxtFields" style=";border-right-width:1px;">
                       <span style="width:7px;"/>
                        <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinCashierId"/>
                        </xsl:call-template>
                  </div>
                </div>
                 
                  </div>
                  
                 </div>
                 
                  </div>
                   
                   </div>
                    
                  
                </div>
               
                   <div class="styIRSW2GRightTopFrame" style="float:left;width:33.8mm;height:34.6mm;border-bottom-width:1px;">
                       <div style="width:100%;text-align:right;float:right;">
                          <div class="styOMB" style="height:2mm;font-size:7pt;border-bottom-width:0px;">OMB No. 1545-0238</div>
                               <div class="styTY">20<span class="styTYColor">20</span></div>
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
               
                    
                 </div>
                          <div class="styIRSW2GRowItem" style="width:77.4mm;float:left;border:0px solid black;border-top-width:1px;">
                    <div style="width:39.2mm;float:left;border:0px solid black;border-top-width:0px;border-right-width:1px;height:11mm">
                       <span style="width:3px;"/>
                        <span style="font-size:6pt;font-family:Arial;">PAYER'S federal identification number</span>
                       <br/><br/>
                       <div  style="padding-left:10mm;text-align:center;float:left;">
                        
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
                    </div>
                   <span style="width:3px;"/>
                        <span style="font-size:6pt;font-family:Arial;">PAYER's telephone number</span>
                       <br/><br/>
                        <xsl:call-template name="PopulatePhoneNumber">
                        <xsl:with-param name="TargetNode" select="$FormW2GData/PayerTelephoneNum"/>
                      </xsl:call-template>
                       
                
                 <div class="styIRSW2GRowItem" style="height:18mm;width:77.4mm;float:left;border:0px solid black;border-top-width:1px;black;border-bottom-width:1px;">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">WINNER'S name</span>
                  </div><br/>
                  <div class="styIRSW2GDataLTxtField" style="height:2mm;padding-left:2.5mm;">
                               <xsl:choose>
                                      <xsl:when test="$FormW2GData/RecipientNm">
                                                <br/>
                                                 <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientNm"/>
                                            </xsl:call-template>
                                          </xsl:when>
                                          <xsl:otherwise>
																																											
																																										
                                         <xsl:if test="$RtnHdrData/Filer/NameLine1Txt">
                                                <br/>
                                                 <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientNm"/>
                                            </xsl:call-template>
                                          </xsl:if>
                                       </xsl:otherwise>
                                 </xsl:choose>
                           <!--      <xsl:call-template name="PopulateText">
                                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientNm"/>
                                            </xsl:call-template>-->
                  </div>
                 <div style="height:23mm;width:77.4mm;float:left;border:0px solid black;border-top-width:0px;black;border-bottom-width:1px;padding-top:3mm;">
                  <!--<div class="styIRSW2GDataTitleLeft">-->
                    <!--<span style="width:3px;"/>-->
                    <span style="font-size:6pt;font-family:Arial;padding-bottom:1mm;padding-top:9.5mm;padding-left:2mm">Street address (including apt. no.)</span>
                 <!-- </div>-->
                  <div class="styIRSW2GDataLTxtField" style="padding-left:2.5mm;">
                    <xsl:choose>
                      <xsl:when test="$FormW2GData/RecipientUSAddress">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientUSAddress/AddressLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/RecipientUSAddress/AddressLine2Txt">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientUSAddress/AddressLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientForeignAddress/AddressLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="$FormW2GData/RecipientForeignAddress/AddressLine2Txt">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientForeignAddress/AddressLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                  </div>
                </div>
                  <div class="styIRSW2GRowItem" style="width:74mm;float:left;height:12mm">
                  <div class="styIRSW2GDataTitleLeft">
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">City or town, province or state, country, and ZIP or foreign postal code</span>
                  </div>
                 
																			
                  <xsl:choose>
						<xsl:when test="$FormW2GData/RecipientUSAddress!=''">
						   
						    <div style="width:1.5mm;height:4mm;"/>
						    <xsl:call-template name="PopulateCityStateInfo">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientUSAddress"/>
                            </xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
						<span style="font-size:5.5pt">
						        
						         <div style="padding-left:1.5mm;">
     						    	 <xsl:call-template name="PopulateText">
                                     <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientForeignAddress/CityNm"/>
                                      </xsl:call-template>,
                                </div>
                                <br/>
                              <div style="padding-left:1.5mm;">
																													
                                 
							         <xsl:call-template name="PopulateText">
                                     <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientForeignAddress/ProvinceOrStateNm"/>
                                      </xsl:call-template>
                                       <div style="width:1mm;"/>
                                      <span style="width:1.5mm"/>
                                      <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientForeignAddress/ForeignPostalCd"/>
                                      </xsl:call-template>
                            </div>  <br/>
                                  <span style="padding-left:1.5mm"/>
                                <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientForeignAddress/CountryCd"/>
                                </xsl:call-template></span>
     						</xsl:otherwise>
				</xsl:choose>
                 
                </div>
                
                <div class="styIRSW2GRowItem" style="width:77.4mm;height:16.6mm;float:left;background-color:lightgrey;border:0px black solid;border-top-width:1px;"/>
				
              
                </div>
              
            </div>
     <!-- (9) Winner's taxpayer identification no.>>>>>>>>>>>>>>>>>>>>>>>>-->
        <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="padding-left:8px;">
                    <b>9</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Winner's taxpayer identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:7mm;">
                               <xsl:choose>
					           <xsl:when test="$FormW2GData/RecipientSSN"> 
                                         <xsl:call-template name="PopulateSSN">
                                                 <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSSN"/>
                                                 </xsl:call-template>
                               </xsl:when>
                                    <xsl:otherwise>
                                    <xsl:choose>
                                           <xsl:when test="$FormW2GData/RecipientEIN">
				                                 <xsl:call-template name="PopulateEIN">
                                                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientEIN"/>
                                                 </xsl:call-template>												
					                        </xsl:when>
					                         <xsl:otherwise>
					                                 <xsl:call-template name="PopulateReturnHeaderFiler">
                                          <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                          </xsl:call-template>
				                               </xsl:otherwise>
                                    </xsl:choose>	
                                    </xsl:otherwise>
				       </xsl:choose>
                       <!-- <xsl:choose>
					           <xsl:when test="$RtnHdrData/Filer/PrimarySSN"> 
                                         <xsl:call-template name="PopulateReturnHeaderFiler">
                                          <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                          </xsl:call-template>
                               </xsl:when>
                                    <xsl:otherwise>
                                    <xsl:choose>
                                           <xsl:when test="$FormW2GData/RecipientSSN">
				                                 <xsl:call-template name="PopulateSSN">
                                                 <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSSN"/>
                                                 </xsl:call-template>												
					                        </xsl:when>
					                         <xsl:otherwise>
					                                 <xsl:call-template name="PopulateEIN">
                                                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientEIN"/>
                                                      </xsl:call-template>
				                               </xsl:otherwise>
                                    </xsl:choose>	
                                    </xsl:otherwise>
				       </xsl:choose>-->
                             <!--<xsl:choose>
				    	<xsl:when test="$FormW2GData/RecipientSSN">
				    
							<xsl:call-template name="PopulateSSN">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSSN"/>
                            </xsl:call-template>												
					  </xsl:when>
					  <xsl:otherwise>
					  
					        <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientEIN"/>
                             </xsl:call-template>
				      </xsl:otherwise>
				</xsl:choose>-->
                    <!--<xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSSN"/>
                    </xsl:call-template>-->
                  </div>
                  <!-- (11) First I.D.>>>>>>>>>>>>>>>>>>>>>>>>-->
                  <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                      <div class="styIRSW2GDataMRTitle">
                         <b>11</b>
                        <span style="width:3px;"/>
                        <span style="font-size:6pt;font-family:Arial;">First I.D.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:14.1mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientFirstAdditionalIdNum"/>
                    </xsl:call-template>
                  </div>
                  
                  
               
					<div class="styIRSW2GRowItem">
					   <!-- (13) State/Payer's state identification no. >>>>>>>>>>>>>>>>>>>>>>>>-->
					       <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
					          <div class="styIRSW2GDataMRTitle">
                                <b>13</b>
                                <span style="width:3px;"/>
                               <span style="font-size:6pt;font-family:Arial Narrow;">State/Payer's state identification no.</span>
                  </div>
                    
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:7.5mm;">
                  
                    <xsl:choose>
					<xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 and ($Print != $Separated)">
									<!--<span style="width:3mm"/>-->
						<xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Lines 13-18 Data Table</xsl:with-param>
                          <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp"/>
                        </xsl:call-template>
                         
                        <!--<span style="width:2mm"/>
                        See Additional Data Table-->
					</xsl:when>
					<xsl:otherwise>

                        
					
					     <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &lt; 2 and ($Print != $Separated)">
					     
							<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/StateAbbreviationCd"/>
                        </xsl:call-template>
                    <span style="width:6px;"/>
                    <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/PayerStateIdNum"/>
                    </xsl:call-template>				
											
						</xsl:if>
					 	</xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="((count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 or count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &gt; 1) and 
                             ($Print = $Separated))">
				
				     <span style="width:4px"/>
                                <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                 <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp"/>
                                </xsl:call-template>																										
				 </xsl:if>
              
                  </div>
                  <!-- (15) State income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>-->
					   <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
					   <div class="styIRSW2GDataMRTitle">
					          <b>15</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State income tax withheld</span>
					   </div>
					   		<div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:8.2mm;">
					   		
                            <xsl:choose>
                      <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 and ($Print != $Separated)">
															
					                      <span style="width:2mm"/>
                        
					</xsl:when>
					<xsl:otherwise>
					     <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &lt; 2 and ($Print != $Separated)">
					             <div style="text-align:left;float:left;">$</div>
                                  <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/StateTaxWithheldAmt"/>
                              </xsl:call-template>
						</xsl:if>
					 	</xsl:otherwise>
                  </xsl:choose>

				       </div>		
                  	  <!-- (17) Local income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>-->
                  	  <div class="styIRSW2GRowItem" style="width:37mm;float:left;height:10.2mm;">
                  	      <div class="styIRSW2GDataMRTitle" style="height:5.2mm;">
                            <b>17</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Local income tax withheld</span>                    	    
                  	   	     </div>
                  	     <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:11.5mm;border-bottom-width:0px;">
                  	     
                                                  <xsl:choose>
                      <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 and ($Print != $Separated)">
															
					                      <span style="width:2mm"/>
                        
					</xsl:when>
					<xsl:otherwise>
					     <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &lt; 2 and ($Print != $Separated)">
					             <div style="text-align:left;float:left;">$</div>
                                  <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp/LocalIncomeTaxAmt"/>
                              </xsl:call-template>
						</xsl:if>
					 	</xsl:otherwise>
                  </xsl:choose>
                   </div>
                  
                   </div>
				   </div>
				  </div>
					
					</div>
                       					
					
				 <!--</xsl:when>-->
				<!--  <xsl:otherwise>
				    --><!-- (13) State/Payer's state identification no. >>>>>>>>>>>>>>>>>>>>>>>>--><!--
                 <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                    <div class="styIRSW2GDataMRTitle">
                    <b>13</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State/Payer's state identification no.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:7mm;">
                    
                  </div>
                  --><!-- (15) State income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>--><!--
                  <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle">
                    <b>15</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">State income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:7mm;">
                    <div style="text-align:left;float:left;">$</div>
                  </div>
                    --><!-- (17) Local income tax withheld >>>>>>>>>>>>>>>>>>>>>>>>--><!--
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;height:13.2mm">
                  <div class="styIRSW2GDataMRTitle">
                    <b>17</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial Narrow;">Local income tax withheld</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:15.7mm;border-bottom-width:0px;">
                   <div style="text-align:left;float:left;">$</div>
                  </div>
                </div>
                </div>
                </div>
				  </xsl:otherwise>-->
    			<!--	</xsl:choose>-->
                  </div>
                 
                  </div>
                  
                <!-- (10) Window >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                 <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                     <div class="styIRSW2GDataMRTitle" style="width:37.7mm;border-right-width:1px;">
                       <b>10</b>
                       <span style="width:3px;"/>
                       <span style="font-size:6pt;font-family:Arial;">Window</span>
                    </div>
                    <div class="styIRSW2GDataMRTxtFields" style="height:7mm;border-right-width:1px;">
                    <span style="width:7px;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/GamblingWinWindowNum"/>
                    </xsl:call-template>
                  </div>
                  <!-- (12) Second I.D. >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                  <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                    <div class="styIRSW2GDataMRTitle" style="width:37.7mm;border-right-width:1px;">
                    <b>12</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Second I.D.</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:center;height:14.1mm;border-right-width:1px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormW2GData/RecipientSecondAdditionalIdNum"/>
                    </xsl:call-template>
                  </div>
                 
                   <!--  <xsl:choose>
					 <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &lt;= 1 and count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &lt;= 1">-->
                 <!-- (14) State winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="width:37.7mm;border-right-width:1px;">
                    <b>14</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">State winnings </span>
                      </div> 
    
                    <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:7.5mm;border-right-width:1px;"> 
                      <xsl:choose>
                      <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 and ($Print != $Separated)">
															
					                      <span style="width:2mm"/>
                        
					</xsl:when>
					<xsl:otherwise>

                        
					
					     <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &lt; 2 and ($Print != $Separated)">
					             <div style="text-align:left;float:left;">$</div>
                                  <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/GamblingWinningAmt"/>
                              </xsl:call-template>
						</xsl:if>
					 	</xsl:otherwise>
                  </xsl:choose>
                 
                  </div>
                  <!-- (16) Local winnings >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                  <div class="styIRSW2GRowItem" style="width:37mm;float:left;">
                  <div class="styIRSW2GDataMRTitle" style="width:37.7mm;border-right-width:1px;">
                    <b>16</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Local winnings</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:right;padding-right:3px;height:8.1mm;border-right-width:1px;">
                  
                                                               <xsl:choose>
                      <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 and ($Print != $Separated)">
															
					                      <span style="width:2mm"/>
                       
					</xsl:when>
					<xsl:otherwise>
					     <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &lt; 2 and ($Print != $Separated)">
					             <div style="text-align:left;float:left;">$</div>
                                  <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp/GamblingWinningAmt"/>
                              </xsl:call-template>
						</xsl:if>
					 	</xsl:otherwise>
                  </xsl:choose>
                
				
                  
                  </div>
                 <!-- (18) Name of locality >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>-->
                <div class="styIRSW2GRowItem" style="width:37mm;float:left;height:3.2mm;">
                  <div class="styIRSW2GDataMRTitle" style="width:37.7mm;border-right-width:1px;">
                    <b>18</b>
                    <span style="width:3px;"/>
                    <span style="font-size:6pt;font-family:Arial;">Name of locality</span>
                  </div>
                  <div class="styIRSW2GDataMRTxtFields" style="text-align:left;height:12.8mm;border-bottom-width:0px;border-right-width:1px;">
                  
                                                      <xsl:choose>
                      <xsl:when test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 and ($Print != $Separated)">
															
					                      <span style="width:2mm"/>
                        
					</xsl:when>
					<xsl:otherwise>
					     <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &lt; 2 and ($Print != $Separated)">
					             
                                  <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp/LocalityNm"/>
                              </xsl:call-template>
						</xsl:if>
					 	</xsl:otherwise>
                  </xsl:choose>
                  
                  
  
				
                  </div>
                  </div>
                </div>
                </div>				
			
                  </div>
                  
                 </div>
                 <div class="styIRSW2GRightBottomFrame" style="width:31.5mm;height:22.5mm;border-top-width:0px;border-bottom-width:0px;">
                  <br/>
              <br/>
              <div class="styIRSW2GRightBottomFrame" style="font-family:Arial;font-size:6.5pt;padding-left:6mm;height:34.5mm; ">
                    <div style="width:30mm">
                          <div style="width:25mm;float:right;">
                          <div style="width:1.5mm"/>
                          For Privacy Act and                       
                          </div>					
					   <div style="width:25mm;float:right;">
                          Paperwork Reduction                      
                          </div>					
							<div style="width:25mm;float:right;">
							   <div style="width:18mm"/>
                           Act                      
                          </div>
                           <div style="width:25mm;float:right;">
                                <div style="width:.5mm;"/>
                          Notice, see the <b>2020</b>                      
                          </div>
                          <div style="width:25mm;float:right;">
                                <div style="width:13mm;"/>
                           <b>General</b>                      
                          </div>
                          <div style="width:25mm;float:right;">
                                <div style="width:4.6mm;"/>
                          <b> Instructions for</b>                      
                          </div>
                         <div style="width:25mm;float:right;">
                                <div style="width:.5mm;"/>
                          <b>Certain Information</b>                      
                          </div>
                          <div style="width:25mm;float:right;">
                                <div style="width:13mm;"/>
                          <b>Returns</b>                      
                          </div>										
					</div>
              
             
              </div>
               <div class="styIRSW2GRightBottomFrame" style="width:31.5mm;height:12mm;border-top-width:0px;border-bottom-width:0p;">
                    <div style="width:100%;text-align:right;float:right;">
                        <div style="font-family:Arial;font-size:7.7pt;padding-top:0mm;float:left;">
                        <b>	<div class="styBB" style="padding-top:4mm;width:31mm;height:10.5mm;border-bottom-width:0px;">
				    	<xsl:call-template name="LinkToLeftoverDataTableInline">
                          <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
                          <xsl:with-param name="TargetNode" select="$FormW2GData/StandardOrNonStandardCd"/>
                        </xsl:call-template>
					    <span style="font-size:6.5pt;border-top-width:2px; solid black;border-bottom-width:1px">File with Form 1096</span>
					</div></b>
                      <span style="width:4px;"/>
                                <b>  <div style="width:31mm;height:11mm;" >
                          <span  style="height:4mm"> Copy A</span><br/>
                             <span  style="height:3.5mm"> For Internal Revenue</span><br/>Service Center
                          </div></b>

                        </div>
                       </div>
               </div>
                  </div>
          
            
            </div>
            <div style="width:187mm;">
               <div style="width:187mm;height:20mm;border:0px solid black;border-top-width:0px;border-left-width:1px;border-bottom-width:1px;">
                  <div class="desc" style="width:180mm;padding-left:2mm;">
                     Under penalties of perjury, I declare that, to the best of my knowledge and belief, the name, address, and taxpayer identification number that I have
                     furnished correctly identify me as the recipient of this payment and any payments from identical wagers, and that no other person is entitled to 
                     any part of these payments.
                  </div> <br/><br/>
                  <div style="width:187mm;height:10mm;">
                      <div style="width:18mm;font-weight:bold;font-size:8pt;padding-left:2mm;">Signature </div> 
                      <img src="{$ImagePath}/w2g_Bullet_Md.gif" height="8mm" alt="med_arrow"/>
                      <div style="width:100mm"/>
                      <div style="width:10mm;font-weight:bold;font-size:8pt;padding-left:2mm;">Date</div>
                      <img src="{$ImagePath}/w2g_Bullet_Md.gif" height="8mm" alt="med_arrow"/>
                 </div>
                </div>            
            </div>
         
 <br/>
           <!-- BEGIN: Footer  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="styGenericDiv">
              <span style="font-family:Arial;font-size:7pt;">
                <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top-width:0px;">

                  <div style="float:left;padding-top:0px;"> 
                      Form <span class="styBoldText" style="font-size:8pt;">W-2G</span>
                  </div>
                  <div style="float:left;">
                    <span style="width:25mm;"/>  
                    Cat. No. 10138V<span style="width:20mm;"/>www.irs.gov/FormW2G
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
        <div class="pageEnd" style="width:187mm;float:left;height:45mm"/> 
<p style="page-break-before:always"/>
        
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
          <br/><br/><br/><br/><br/><br/>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormW2GData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Payer Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/PayerNameControlTxt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Standard Or Non Standard Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormW2GData/StandardOrNonStandardCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:if test="count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 or count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &gt; 1">
            <tr>
			  <td class="styLeftOverTableRowDesc" style="width:100mm;text-align:left;" scope="row">Lines 13-18 - Data Table:</td>  
			  <td class="styLeftOverTableRowAmount" style="width:87mm;"/>                     
			</tr>
			</xsl:if>
          </table>
           
           <xsl:if test="((count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 or count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &gt; 1) and 
          ($Print != $Separated))">
          <div class="styTable" style="margin-top:0mm;margin-bottom:2mm;">
          <table class="styTableContainer" cellspacing="0" cellpadding="0" style="font-size:8pt;width:187mm;border-width: 1px 1px 1px 1px;">
				<tbody>
					<tr style="font-size: 7pt;">
						<th scope="col" style="border-right:1px solid black">13<span style="width:10px"/>State </th>
						<th scope="col" style="border-right:1px solid black">Payer's state identification no.</th>
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
								<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
							</xsl:call-template>
						</td>

						<td class="styIRSW2GCell" align="center">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PayerStateIdNum"/>
							</xsl:call-template>
						</td>
						<td class="styIRSW2GCell" align="right">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GamblingWinningAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRSW2GCell" align="right" style="border-right:2px solid black">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
							</xsl:call-template>
						</td>
						<xsl:for-each select="W2GLocalTaxGrp">
							<xsl:if test="position()=1">
								<td class="styIRSW2GCell" align="right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GamblingWinningAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRSW2GCell" align="right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRSW2GCell" style="border-right-width:0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="LocalityNm"/>
									</xsl:call-template>
								</td>
							</xsl:if>
							<xsl:if test="position()!=1">
								<tr style="font-size:6pt;">
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="border-right:2px solid black;background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" align="right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GamblingWinningAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRSW2GCell" align="right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRSW2GCell" style="border-right-width:0">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LocalityNm"/>
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
			
			
			



			<!--Separated Code -->  
			
			
			
			 <xsl:if test="((count($FormW2GData/W2GStateLocalTaxGrp) &gt; 1 or count($FormW2GData/W2GStateLocalTaxGrp/W2GLocalTaxGrp) &gt; 1) and 
          ($Print = $Separated))">

          <div class="styTable" style="margin-top:0mm;margin-bottom:2mm;">
          <span class="styRepeatingDataTitle" style="width:80mm"> Form W2G, Lines 13-18,</span>
          <table class="styTableContainer" cellspacing="0" cellpadding="0" style="font-size:8pt;width:187mm;border-width: 1px 1px 1px 1px;">
				<tbody>
					<tr  class="styDepTblHdr">
						<th scope="col"  style="border-right:1px solid black">13<span style="width:10px"/>State </th>
						<th scope="col" style="border-right:1px solid black">Payer's state identification no.</th>
						<th scope="col" style="border-right:1px solid black">14 State winnings</th>
						<th scope="col" style="border-right:2px solid black">15 State income tax <br/> withheld</th>
						<th scope="col" style="border-right:1px solid black">16 Local winnings</th>
						<th scope="col" style="border-right:1px solid black">17 Local income tax<br/> withheld</th>
						<th scope="col" style="">18 Name of locality</th>
					</tr>

					<xsl:for-each select="$FormW2GData/W2GStateLocalTaxGrp">
					<tr style="border-color:black;">
					<!-- Define background colors to the rows -->
                          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styIRSW2GCell" align="center">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="StateAbbreviationCd"/>
							</xsl:call-template>
						</td>

						<td class="styIRSW2GCell" align="center">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PayerStateIdNum"/>
							</xsl:call-template>
						</td>
						<td class="styIRSW2GCell" align="right">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GamblingWinningAmt"/>
							</xsl:call-template>
						</td>
						<td class="styIRSW2GCell" align="right" style="border-right:2px solid black">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="StateTaxWithheldAmt"/>
							</xsl:call-template>
						</td>
						<xsl:for-each select="W2GLocalTaxGrp">
						
					
							<xsl:if test="position()=1">
							
								<td class="styIRSW2GCell" align="right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GamblingWinningAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRSW2GCell" align="right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRSW2GCell" style="border-right-width:0">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="LocalityNm"/>
									</xsl:call-template>
								</td>
							</xsl:if>
							<xsl:if test="position()!=1">
								<tr style="border-color:black;">   
									<!-- Define background colors to the rows -->
                          <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when><xsl:otherwise>styDepTblRow1</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" style="border-right:2px solid black;background-color:lightgrey;border-top-width:0px;"><br/></td>
									<td class="styIRSW2GCell" align="right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GamblingWinningAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRSW2GCell" align="right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="LocalIncomeTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="styIRSW2GCell" style="border-right-width:0">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="LocalityNm"/>
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
