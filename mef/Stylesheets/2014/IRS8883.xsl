<?xml version="1.0" encoding="UTF-8"?>
<!--Did changes per PDF Review Package 1 11/14/2013 by Robert Jones-->
<!--Changed Line 11 Element per Kisams #IMO1421050 by Robert Jones-->
<!--Changed  per Kisams #IMO1836173 by Robert Jones darkened gridlines-->
<!--Changed  per IBM Defect 57293 by Robert Jones darkened gridlines-->
<!--Changed  per IBM Defect 57293 by Robert Jones darkened gridlines submitted again because what IBM tested still not showing darkened lines but does for me-->
<!--Changed  per IBM Defect 41962 by Robert Jones Part VI Line 10 not showing all data-->
<!--Changed per UWR 123023 IE11 upgrade changes by Robert Jones-->
<!--Changed per IBM Defect 43220 additional data to its own page. Page numbers not starting on its own pages. changes by Robert Jones-->
<!--Changed per IBM Defect 43219 additional data to its own page. Page numbers not starting on its own pages. changes by Robert Jones-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8883Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8883Data" select="$RtnDoc/IRS8883"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8883Data)"/>
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
        <meta name="Description" content="IRS Form 8883"/>      
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <style type="text/css">
          <!-- HINTS: -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8883Style"/>  
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>  
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8883">
          <xsl:call-template name="DocumentHeader"/>  
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:auto;">
            <!-- Title Left Box -->
            <div class="styFNBox" style="width:35mm;height:auto;">
              <div style="height:auto;">
                Form<span class="styFormNumber">  8883</span><br/>
                (December 2008)
              </div>
              <div style="height:auto;font-size:7pt;font-family:arial;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>        
            </div><!--Close Title left box -->    
            <!--Title Center Box -->
            <div class="styFTBox" style="width:121mm;height:auto;">
              <div class="styMainTitle">Asset Allocation Statement</div>
              <div class="styMainTitle" style="font-size:11pt;">Under Section 338 </div>
              <div class="styFBT" style="padding-top:2mm;">
                 <img src="{$ImagePath}/8883_Bullet.gif" alt="bullet image"/> 
                    Attach to your income tax return.
                 <span style="width:8px;"/>
                 <img src="{$ImagePath}/8883_Bullet.gif" alt="bullet image"/> 
                  See separate instructions.
              </div>
            </div>
            <!--Title Right Box -->
            <div class="styTYBox" style="width:30mm;height:18mm;padding-top:7mm;">        
              OMB No. 1545-1806        
            </div>      
          </div><!-- End Form Number and Name -->
          <!-- BEGIN Part I Title -->
          <div class="styBB" style="width:187mm;height:auto;padding-top:1.5mm;">
            <div class="styPartName">Part I </div>
            <div class="styPartDesc">Filer's Identifying Information</div>
          </div>
          <!-- END Part I  Title  -->
          <div class="styBB" style="width:187mm;">
            <!--L1a -->
            <div class="styLNLeftNumBox" style="height:auto;padding-top:0mm;">1a</div>
            <div class="styNameBox" style="width:112mm;height:auto;font-size:7pt;">Name as shown on return
              <br/>
              <div style="font-family:verdana;font-size:6pt;">
                 <xsl:call-template name="PopulateReturnHeaderFiler">
                   <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                 </xsl:call-template>
                 <br/>
                 <xsl:call-template name="PopulateReturnHeaderFiler">
                   <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                 </xsl:call-template>
                 <br/>
                 <xsl:call-template name="PopulateReturnHeaderFiler">
                   <xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
                 </xsl:call-template>
              </div>        
            </div><!--Close div below L1a-->
            <!-- L1b -->
            <div style="width:65mm;height:8mm;float:left;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">1b</div>          
                 Identifying number as shown on return
                 <br/><br/>
                 <span style="width:32px;"/>          
                 <xsl:choose>
                   <xsl:when test="$Form8883Data/EIN">          
                      <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/EIN"/>
                      </xsl:call-template>
                   </xsl:when>
                   <xsl:when test="$Form8883Data/SSN">          
                      <xsl:call-template name="PopulateSSN">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/SSN"/>
                      </xsl:call-template>
                   </xsl:when>
                   <xsl:otherwise>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/EINMissingReasonCd"/>
                      </xsl:call-template>                  
                   </xsl:otherwise>
                 </xsl:choose>            
               </div>
            </div>
            <!--L1c-->
            <div class="styBB" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">1c</div>        
              <div class="styNameBox" style="width:60mm;font-size:7pt;height:9.5mm;">          
                 Check applicable box (see instructions):            
                 <br/>  
                 <span style="height:5mm;padding-top:2mm;">
                   <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OldTargetInd"/>
                        <xsl:with-param name="BackupName">IRS8883OldTarget</xsl:with-param>
                      </xsl:call-template>
                   </input>
                   <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OldTargetInd"/>
                        <xsl:with-param name="BackupName">IRS8883OldTarget</xsl:with-param>
                      </xsl:call-template>
                        Old target
                   </label>
                   <span style="width:46px"/>          
                   <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/NewTargetInd"/>
                        <xsl:with-param name="BackupName">IRS8883NewTarget</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/NewTargetInd"/>
                        <xsl:with-param name="BackupName">IRS8883NewTarget</xsl:with-param>
                      </xsl:call-template>
                        New target
                    </label>
                  </span>
               </div><!--Close div before text "Check applicable box" -->
               <!--L1d -->
               <div style="width:115mm;float:right;">
                 <div class="styLNLeftNumBox" style="height:4mm;padding-top:0mm;">1d</div>                    
                 <span style="width:70mm; vertical-align:top;">Was a valid and timely Form 8023 filed?
                   <!--Dotted Line-->
                   <span class="styBoldText">
                      <span style="width:16px"/>.
                      <span style="width:16px"/>.                              
                    </span>    
                 </span>
                 <span style="width:35mm;">
                 <!-- Yes Check Box -->
                   <div class="styLNDesc" style="width:15mm;height:4mm;text-align:right;">
                      <span>
                         <xsl:call-template name="PopulateSpan">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/ValidAndTimelyForm8023FiledInd"/>
                         </xsl:call-template>         
                         <input type="checkbox" class="styCkbox" name="Checkbox"> 
                           <xsl:call-template name="PopulateYesCheckbox">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/ValidAndTimelyForm8023FiledInd"/>
                           </xsl:call-template>
                         </input>
                      </span> 
                      <span style="width:8px"/>
                      <label>
                        <xsl:call-template name="PopulateLabelYes">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/ValidAndTimelyForm8023FiledInd"/>
                         </xsl:call-template> 
                           Yes 
                      </label>          
                    </div>
                    <!-- No Check Box -->
                    <div class="styLNDesc" style="width:15mm;height:4mm;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/ValidAndTimelyForm8023FiledInd"/>
                        </xsl:call-template>         
                        <input type="checkbox" class="styCkbox" name="Checkbox"> 
                           <xsl:call-template name="PopulateNoCheckbox">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/ValidAndTimelyForm8023FiledInd"/>
                           </xsl:call-template>
                        </input>
                      </span>
                      <span style="width:8px"/>
                      <label>
                        <xsl:call-template name="PopulateLabelNo">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/ValidAndTimelyForm8023FiledInd"/>
                        </xsl:call-template> 
                           No 
                      </label>        
                    </div>
                 </span><!--Close span above Yes check box -->
                 <!--L1d "If " line-->
                 <div class="styLNDesc" style=" width:110mm;">
                   <div class="styLNLeftNumBox" style="height:4mm;"/>
                     If yes, enter the date filed            
                    <span style="width:8px;"/>
                    <img src="{$ImagePath}/8883_Bullet.gif" alt="bullet image"/>
                    <span style="width:4px;"> </span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8883Data/FiledDt"/>
                    </xsl:call-template>
                 </div><!--Close L1d "If" line -->                                
               </div><!--Close L1d-->        
            </div><!--Close L1c-->        
            <!-- End Form Number and Name section -->
            <!-- BEGIN Part II Title -->
            <div class="styBB" style="width:187mm;height:7.0mm;padding-top:1.5mm;">
              <div class="styPartName">Part II </div>
              <div class="styPartDesc">Other Party's Identifying Information </div>
            </div>
            <!-- END Part II  Title -->
            <!-- L2a -->  
            <div class="styBB" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:auto;padding-top:0;">2a</div>
              <div class="styNameBox" style="width:112mm;height:auto;font-size:7pt;">
                 Name of other party to the transaction
                
                 <div style="font-family:verdana;font-size:6pt;">                   
                   <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyName/BusinessNameLine1Txt"/>
                   </xsl:call-template>
                   <xsl:if test="$Form8883Data/OtherPartyName/BusinessNameLine2Txt !=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyName/BusinessNameLine2Txt"/>
                      </xsl:call-template>
                    </xsl:if>
                 </div>         
              </div><!--Close div below L2a-->
              <!-- L2b -->
              <div style="width:63mm;height:auto;float:left;">
                 <div class="styLNLeftNumBox" style="height:auto;padding-top:0;">2b</div>
                    Other party's identifying number 
                    <br/>
                    <span style="width:40mm;padding-left:9mm;">
                      <xsl:choose>
                         <xsl:when test="$Form8883Data/OtherPartyEIN">          
                           <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyEIN"/>
                           </xsl:call-template>
                         </xsl:when>
                         <xsl:when test="$Form8883Data/OtherPartySSN">          
                           <xsl:call-template name="PopulateSSN">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartySSN"/>
                           </xsl:call-template>
                         </xsl:when>
                         <xsl:otherwise>
                           <xsl:call-template name="PopulateText">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyMissingEINReasonCd"/>
                           </xsl:call-template>                  
                         </xsl:otherwise>
                      </xsl:choose>                     
                    </span>
              </div><!-- L2b -->
            </div><!--Close div above L1a -->
            <!-- Begin Street Address Line -->
            <div class="styBB" style="width:187mm;">        
              <div class="styNumberBox" style="height:8.5mm;font-size:7pt;padding-left:8mm;">
                 Address (number, street, and room or suite no.)
                 <br/>
                 <!--US Address -->
                 <xsl:if test="$Form8883Data/OtherPartyUSAddress">
                   <xsl:if test="$Form8883Data/OtherPartyUSAddress/AddressLine1Txt!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyUSAddress/AddressLine1Txt"/>
                      </xsl:call-template>
                   </xsl:if>
                   <xsl:if test="$Form8883Data/OtherPartyUSAddress/AddressLine2Txt!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyUSAddress/AddressLine2Txt"/>
                      </xsl:call-template>
                   </xsl:if>
                 </xsl:if>
                 <!-- Begin Foreign Address --> 
                 <xsl:if test="$Form8883Data/OtherPartyForeignAddress">
                   <xsl:if test="$Form8883Data/OtherPartyForeignAddress/AddressLine1Txt!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyForeignAddress/AddressLine1Txt"/>
                      </xsl:call-template>
                   </xsl:if>
                   <xsl:if test="$Form8883Data/OtherPartyForeignAddress/AddressLine2Txt!=''">
                      <br/>
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyForeignAddress/AddressLine2Txt"/>
                        </xsl:call-template>
                   </xsl:if>
                 </xsl:if>
                 <!-- End Foreign Address-->
              </div>
            </div>
            <!-- End Street  Address Line -->
            <!-- Begin City, State and Zip Code Line -->
            <div class="styBB" style="width:187mm;">        
              <div class="styNumberBox" style="height:8mm;font-size:7pt;padding-left:8mm;">
                City or town, state, and ZIP code
                 <br/>
                 <!--US City, State and Zipcd Line -->
                 <xsl:if test="$Form8883Data/OtherPartyUSAddress">
                   <xsl:if test="$Form8883Data/OtherPartyUSAddress/CityNm!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyUSAddress/CityNm"/>
                      </xsl:call-template>,
                   </xsl:if>
                   <xsl:if test="$Form8883Data/OtherPartyUSAddress/StateAbbreviationCd!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyUSAddress/StateAbbreviationCd"/>
                      </xsl:call-template>
                   </xsl:if>
                   <xsl:if test="$Form8883Data/OtherPartyUSAddress/ZIPCd!=''">
                      <span style="width:1mm;"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyUSAddress/ZIPCd"/>
                      </xsl:call-template>
                   </xsl:if>
                 </xsl:if>
                 <!--Foreign City, State and Zipcd Line -->
                 <xsl:if test="$Form8883Data/OtherPartyForeignAddress">
                   <xsl:if test="$Form8883Data/OtherPartyForeignAddress/CityNm!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyForeignAddress/CityNm"/>
                      </xsl:call-template>,
                   </xsl:if>
                   <xsl:if test="$Form8883Data/OtherPartyForeignAddress/ProvinceOrStateNm!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyForeignAddress/ProvinceOrStateNm"/>
                      </xsl:call-template>,
                   </xsl:if>
                   <xsl:if test="$Form8883Data/OtherPartyForeignAddress/ForeignPostalCd!=''">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyForeignAddress/ForeignPostalCd"/>
                      </xsl:call-template>,
                   </xsl:if>          
                 </xsl:if> 
                 <xsl:if test="$Form8883Data/OtherPartyForeignAddress/CountryCd!=''">
                   <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8883Data/OtherPartyForeignAddress/CountryCd"/>
                   </xsl:call-template>
                 </xsl:if>
              </div>
            </div>
            <!-- End City, State and Zip Code line -->
            <!-- BEGIN Part III Title -->
            <div class="styBB" style="width:187mm;height:7.0mm;padding-top:1.5mm;">
              <div class="styPartName">Part III </div>
              <div class="styPartDesc">Target Corporation's Identifying Information </div>
            </div>
            <!-- END Part III  Title -->
            <!--L3a -->       
            <div class="styBB" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:15mm;">3a</div>
              <div class="styNameBox" style="width:90mm;font-size:7pt;border-right-width: 0px;height:15mm;;">
                 Name and address of target corporation
                 <br/>
                 <!--Name Line -->
                 <div style="font-family:verdana;">
                   <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationName/BusinessNameLine1Txt"/>
                   </xsl:call-template>
                   <xsl:if test="$Form8883Data/OtherPartyName/BusinessNameLine2Txt !=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationName/BusinessNameLine2Txt"/>
                      </xsl:call-template>
                   </xsl:if>
                   <br/>
                   <!--US street address Line -->
                   <xsl:if test="$Form8883Data/TargetCorporationUSAddress">
                      <xsl:if test="$Form8883Data/TargetCorporationUSAddress/AddressLine1Txt!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationUSAddress/AddressLine1Txt"/>
                        </xsl:call-template>
                        <br/>
                      </xsl:if>
                      <xsl:if test="$Form8883Data/TargetCorporationUSAddress/AddressLine2Txt!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationUSAddress/AddressLine2Txt"/>
                        </xsl:call-template>
                      </xsl:if>
                   </xsl:if>
                   <!--Foreign street Address Line -->
                   <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress">
                      <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress/AddressLine1Txt!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationFrgnAddress/AddressLine1Txt"/>
                         </xsl:call-template>
                         <br/>
                      </xsl:if>
                      <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress/AddressLine2Txt!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationFrgnAddress/AddressLine2Txt"/>
                        </xsl:call-template>
                      </xsl:if>
                   </xsl:if>
                 </div>
                 <!--US City, State and Zipcd Line -->                       
                 <div style="padding-top:0mm;"/>
                   <xsl:if test="$Form8883Data/TargetCorporationUSAddress">
                      <xsl:if test="$Form8883Data/TargetCorporationUSAddress/CityNm!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationUSAddress/CityNm"/>
                        </xsl:call-template>,
                      </xsl:if>
                      <xsl:if test="$Form8883Data/TargetCorporationUSAddress/StateAbbreviationCd!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationUSAddress/StateAbbreviationCd"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="$Form8883Data/TargetCorporationUSAddress/ZIPCd!=''">
                        <span style="width:1mm;"/>
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationUSAddress/ZIPCd"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                    <!--Foreign City, State and Zipcd Line -->
                    <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress">
                      <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress/CityNm!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationFrgnAddress/CityNm"/>
                        </xsl:call-template>,
                      </xsl:if>
                      <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress/ProvinceOrStateNm!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationFrgnAddress/ProvinceOrStateNm"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress/ForeignPostalCd!=''">
                        <span style="width:1mm;"/>
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationFrgnAddress/ForeignPostalCd"/>
                        </xsl:call-template>,
                      </xsl:if>  
                      <xsl:if test="$Form8883Data/TargetCorporationFrgnAddress/CountryCd!=''">
                        <xsl:call-template name="PopulateText">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationFrgnAddress/CountryCd"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>  
                 </div>
                 <!--L3b-->
                 <div style="width:88mm;">
                   <div class="styLNLeftNumBox" style="border-left:solid 1px black;height:15mm;">3b</div>
                   <div class="styLNDesc" style="width:79mm;height:15mm;">
                      Employer identification number 
                      <br/><br/>
                      <span style="padding-left:9mm;">                    
                        <xsl:call-template name="PopulateEIN">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/TargetCorporationEIN"/>
                        </xsl:call-template>
                        <xsl:if test="$Form8883Data/MissingEINReasonCd !=' '">            
                           <span style="font-weight:normal;">  
                             <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form8883Data/MissingEINReasonCd"/>
                             </xsl:call-template>
                           </span> 
                        </xsl:if>
                      </span>
                   </div>
                   <!--L3c-->
                   <div class="styLNLeftNumBox" style="border-left:solid 1px black;height:12mm;border-top:solid black 1px">3c</div>
                   <div class="styLNDesc" style="width:79mm;height:12mm;border-top:solid black 1px">
                      State or country of incorporation 
                      <br/><br/>  
                      <span style="padding-left:9mm;">          
                        <xsl:choose>
                           <xsl:when test="not($Form8883Data/IncorporationStateCd) or $Form8883Data/IncorporationStateCd=''">          
                             <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form8883Data/IncorporationCountryCd"/>
                             </xsl:call-template>
                           </xsl:when>
                           <xsl:otherwise>
                             <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$Form8883Data/IncorporationStateCd"/>
                             </xsl:call-template>                  
                           </xsl:otherwise>
                        </xsl:choose>  
                      </span>        
                   </div>
                 </div><!--Close L3b-->
               </div><!--Close L3a-->  
              <!-- BEGIN Part IV Title -->
              <div class="styBB" style="width:187mm;height:7.0mm;padding-top:1.5mm;">
                 <div class="styPartName">Part IV </div>
                 <div class="styPartDesc">General Information </div>
              </div>
              <!-- END Part IV  Title -->
              <!--L4a-->
              <div class="styBB" style="width:187mm;">
                 <div class="styLNLeftNumBox" style="height:auto;padding-top:0;">4a</div>
                 <div class="styNameBox" style="width:91.25mm;height:auto;font-size:7pt;">
                   Acquisition date 
                   <br/><br/><br/>                        
                   <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form8883Data/AcquisitionDt"/>
                   </xsl:call-template>          
                 </div>
                 <!--Blank Line -->
                 <div style="width:87mm;height:auto;float:right;">
                 <!--L4b-->             
                 <div style="width:87mm;height:auto;">
                   <div class="styLNLeftNumBox" style="width:7.5mm;height:auto;padding-left:0px;padding-top:0;">4b</div>
                     What percentage of target corporation stock was purchased:              
                 </div>
                 <div style="width:87mm;height:auto;">      
                   <div class="styLNLeftNumBox" style="height:auto;"/>
                   <div class="styLNDesc" style="width:60mm;">
                      <span class="styItalicText">(i)</span> <span style="width:4px;"/> During the 12-month acquisition period?
                   </div>
                    <div class="styUnderlineAmount" style="width:16mm;float:right;border-bottom-width: 1px;">  
                      <xsl:if test="not($Form8883Data/StockPurchaseDuring12MonthPct) or $Form8883Data/StockPurchaseDuring12MonthPct=''"> 
                        <span style="width:4px; float:right;">%</span>
                      </xsl:if>  
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/StockPurchaseDuring12MonthPct"/>
                      </xsl:call-template>
                    </div>          
                 </div>
                 <div style="width:87mm;height:auto;">    
                   <div class="styLNLeftNumBox" style="height:auto;"/>
                   <div class="styLNDesc" style="width:60mm;height:auto;">
                      <span class="styItalicText">(ii)</span> <span style="width:4px;"/> On the acquisition date?            
                      <span style="letter-spacing:4mm; font-weight:bold;">  
                          ....  
                      </span>  
                    </div>
                    <div class="styUnderlineAmount" style="width:16mm;float:right;border-bottom-width: 0px;"> 
                      <xsl:if test="not($Form8883Data/StockPurchaseOnAcquisDtPct) or $Form8883Data/StockPurchaseOnAcquisDtPct=''"> 
                        <span style="width:4px; float:right;">%</span>
                      </xsl:if>               
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/StockPurchaseOnAcquisDtPct"/>
                      </xsl:call-template>  
                    </div>        
                  </div>
               </div><!--Close blank line before L4b-->              
              </div><!--Close L4a-->  
              <!--L5a-->    
              <div class="styBB" style="width:187mm;">
                 <div class="styNameBox" style=" width:42.75mm;font-size:7pt;height:auto;">
                   <div class="styLNLeftNumBox" style="height:auto;padding-top:0;">5a</div>
                      Stock price 
                      <br/><br/>
                        $  
                      <span style="width:34mm;text-align:right;">                      
                        <xsl:call-template name="PopulateAmount">
                           <xsl:with-param name="TargetNode" select="$Form8883Data/StockPriceAmt"/>
                        </xsl:call-template>  
                      </span>        
                 </div>
                 <!--L5b -->
                 <div class="styNameBox" style=" width:56.35mm;font-size:7pt;height:auto;">
                   <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0;">5b</div>
                   Acquisition costs/Selling costs
                   <br/><br/>
                     $  
                   <span style="width:34mm;text-align:right;">                      
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/AcquisitionCostsOrSellCostsAmt"/>
                      </xsl:call-template>  
                   </span>        
                 </div>
                 <!--L5c-->
                 <div class="styNameBox" style=" width:45mm;font-size:7pt;height:auto;">
                   <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0;">5c</div>
                   Target liabilities 
                   <br/><br/>
                     $  
                   <span style="width:34mm;text-align:right;">                      
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/TargetLiabilitiesAmt"/>
                      </xsl:call-template>  
                   </span>        
                 </div>
                 <!--L5d-->
                 <div class="styNameBox" style=" width:41.5mm;font-size:7pt;height:auto;border-right-width: 0px;">
                   <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0;">5d</div>
                   AGUB/ADSP 
                   <br/><br/>
                     $ 
                   <span style="width:34mm;text-align:right;">                                  
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/AGUBOrADSPAmt"/>
                      </xsl:call-template>          
                   </span>  
                 </div>        
              </div><!--Close L5a-->
              <!--YESand NO Line -->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftNumBox" style="height:4.5mm;"/>
                   <div class="styLNDesc" style="width:158mm;height:4.5mm;"/>
                 </div>
                 <div style="float:right">
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width: 0px;">Yes</div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width: 0px;">No</div>
                 </div>
              </div>
              <!--L6-->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftNumBox" style="height:4.5mm;">6</div>          
                      Was the filer listed in Part I, above, a member of an affiliated group of corporations before the acquisition date?          
                   </div>
                 <div style="float:right">      
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/FlrMemAffltGrpBfrAcquisDtInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/FlrMemAffltGrpBfrAcquisDtInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
              </div>
              <!--L7-->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>          
                      Was the target corporation a member of an affiliated group before the acquisition date?        
                 </div>
                 <div style="float:right">  
                   <!--Dotted Line-->
                   <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                      .........  
                   </span>        
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/TrgtMemAffltGrpBfrAcquisDtInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/TrgtMemAffltGrpBfrAcquisDtInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
              </div>
              <!--L8-->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftNumBox" style="height:4.5mm;">8</div>          
                     Is the target corporation or any target affiliate:        
                 </div>
                 <div style="float:right">  
                   <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
                   <div class="styShadingCell" style="height:4.5mm;width:10mm;"/>
                 </div>                  
              </div>
              <!--L8a-->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">a</div>                    
                   <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form8883Data/CFCAnyTimeDuringPrev5YrsInd"/>
                      <xsl:with-param name="BackupName">IRS8883IsCFCAnyTimeDuringPrev5Yrs</xsl:with-param>
                    </xsl:call-template>
                       A controlled foreign corporation? If "No," check here if it was a CFC at any time during the preceding 5 years                          
                    <span style="width:10px"/>
                    <img src="{$ImagePath}/8883_Bullet.gif" alt="Bullet"/>  
                   </label>
                   <span style="width:2px"/>          
                   <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/CFCAnyTimeDuringPrev5YrsInd"/>
                        <xsl:with-param name="BackupName">IRS8883IsCFCAnyTimeDuringPrev5Yrs</xsl:with-param>
                      </xsl:call-template>
                    </input>          
                 </div>
                 <div style="float:right">              
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/FrgnCorpControlledFrgnCorpInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/FrgnCorpControlledFrgnCorpInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
              </div>
              <!--L8b Row 1-->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">b</div>          
                       A foreign corporation with income, gain, or loss effectively connected with the conduct of a trade or business within        
                 </div>
                 <div style="float:right">                
                   <div class="styIRS8883LNYesNoBox" style="border-bottom-width:0px;height:4.5mm;"/>
                   <div class="styIRS8883LNYesNoBox" style="border-bottom-width:0px;height:4.5mm; "/>
                 </div>
              </div>
              <!--L8b Row 2-->
              <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftNumBox" style="height:4.5mm;"/>          
                     the United States (including U.S. real property interests)?          
                 </div>
                 <div style="float:right">  
                   <!--Dotted Line-->
                   <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                     .................  
                   </span>        
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/FrgnCorpWithIncmGainOrLossInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/FrgnCorpWithIncmGainOrLossInd"/>
                      </xsl:call-template>
                    </div>
                 </div>
               </div>
               <!--L8c-->     
               <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">c</div>          
                     A qualifying foreign target under Regulations section 1.338-2(e)(1)(iii)?          
                 </div>
                 <div style="float:right">  
                   <!--Dotted Line-->
                   <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                     ............  
                   </span>        
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/QualifyingForeignTargetInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/QualifyingForeignTargetInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
               </div>
               <!--L8d-->
               <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">d</div>          
                     A corporation electing under section 1504(d) or section 953(d)?        
                 </div>
                 <div style="float:right">  
                   <!--Dotted Line-->
                   <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                     ..............  
                   </span>        
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/Sect1504dOrSect953dElectionInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/Sect1504dOrSect953dElectionInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
               </div>
               <!--L8e -->
               <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">e</div>     
                     A domestic international sales corporation (DISC)?        
                 </div>
                 <div style="float:right">  
                   <!--Dotted Line-->
                   <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                     ..................  
                   </span>        
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/DISCInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/DISCInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
               </div>
               <!--L8f-->
               <div style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">f</div>          
                     A passive foreign investment company (PFIC)?        
                 </div>
                 <div style="float:right">  
                    <!--Dotted Line-->
                    <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                      ....................  
                    </span>        
                    <div class="styIRS8883LNYesNoBox" style="height:4.5mm;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/PassiveForeignInvestmestCoInd"/>
                      </xsl:call-template>
                    </div>
                    <div class="styIRS8883LNYesNoBox" style="height:4.5mm; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/PassiveForeignInvestmestCoInd"/>
                      </xsl:call-template>
                    </div>
                 </div>
               </div>
               <!--L8g-->
               <div class="styBB" style="width:187mm;">
                 <div style="float:left">
                   <div class="styLNLeftLtrBox" style="height:4.5mm;">g</div>          
                     If the answer to item 8f is "Yes", is the PFIC a pedigreed qualified electing fund?        
                 </div>
                 <div style="float:right">  
                   <!--Dotted Line-->
                   <span style="letter-spacing:4mm; font-weight:bold; float:left">  
                     ..........  
                   </span>        
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;border-bottom-width: 0px;">
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/PFICPedigreedQualifiedFundInd"/>
                      </xsl:call-template>
                   </div>
                   <div class="styIRS8883LNYesNoBox" style="height:4.5mm;border-bottom-width: 0px; ">
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="$Form8883Data/PFICPedigreedQualifiedFundInd"/>
                      </xsl:call-template>
                   </div>
                 </div>
               </div>
               <!-- Page Break-->
               <!-- Footer-->
               <div class="pageEnd" style="width:187mm;">  
                 <div style="float:left;">
                   <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>   
                   <span style="width:70px;"/>                        
                     Cat. No. 33707Y 
                 </div>
                 <div style="float:right;">
                   <span style="width:75px;"/>  
                     Form <span class="styBoldText" style="font-size:8pt;">8883</span> (Rev. 12-2008)
                 </div>    
               </div>
                <p style="page-break-before: always"/> 
               <!--Begin Page 2 -->
               <!-- Header -->
               
               <div class="styBB" style="width:187mm;">  
                 <div style="float:left;">Form 8883 (Rev. 12-2008) <span style="width:130mm;"/></div>
                 <div style="float:right;">Page <div style="font-weight:bold;font-size:8pt;">2</div></div>  
               </div>      
               <!-- BEGIN Part V Title -->
               <div class="styBB" style="width:187mm;height:7.0mm;padding-top:1.5mm;">
                 <div class="styPartName">Part V </div>
                 <div class="styPartDesc">Original Statement of Assets Transferred</div>
               </div>
               <!-- END Part V  Title -->    
               <div class="styBB" style="width:187mm;">        
                 <table class="styTable" cellspacing="0" style="font-size:7pt;">
                   <thead class="styTableThead">
                      <tr>
                        <th class="styTableCellHeader" style="border-style: solid; border-color: black;width:31mm;text-align:left;font-weight:normal;" scope="col"> <span class="styBoldText" style="width:24px;">9</span>  Assets </th>
                        <th class="styTableCellHeader" style="border-style: solid; border-color: black;width:80mm;font-weight:normal;" scope="col">Aggregate fair market value (actual amount for Class I)</th>
                        <th class="styTableCellHeader" style="border-style: solid; border-color: black;width:75mm;border-right-width: 0px;font-weight:normal;" scope="col">Allocation of AGUB or ADSP</th>            
                      </tr>
                    </thead>
                    <tfoot/>
                    <tbody>
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                          Class I              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class1FairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class1AllocnOfAGUBOrADSPAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>  
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                          Class II              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class2FairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class2AllocnOfAGUBOrADSPAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>  
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                           Class III              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class3FairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class3AllocnOfAGUBOrADSPAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>  
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                           Class IV              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class4FairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class4AllocnOfAGUBOrADSPAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>  
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                          Class V              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class5FairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class5AllocnOfAGUBOrADSPAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>  
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                          Class VI and VII              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Class6And7FairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/Cl6And7AllocnOfAGUBOrADSPAmt"/>
                           </xsl:call-template>  
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>  
                      <tr>
                        <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                           Total              
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:80mm;padding-top:5mm;text-align:right;">                
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>                
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/TotalFairMarketValueAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>
                        <td class="styTableCellText" style="border-style: solid; border-color: black;width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                           <span style="width:4px; float:left;">$</span>
                           <span style="width:2px;"/>
                           <xsl:call-template name="PopulateAmount">
                             <xsl:with-param name="TargetNode" select="$Form8883Data/TotalAllocationOfAGUBOrADSPAmt"/>
                           </xsl:call-template>    
                           <span style="width:4px;"/>        
                        </td>                          
                      </tr>                  
                    </tbody>
                 </table>
               </div>
               <!-- BEGIN Part VI Title -->
               <div class="styBB" style="width:187mm;height:auto;padding-top:1.5mm;">
                 <div class="styPartName">Part VI </div>
                 <div class="styPartDesc" style="height:auto;">Supplemental Statement of Assets Transferred -                   <span class="styNormalText" style="height:auto;">
                       Complete if amending an original statement or previously filed supplemental statement because of an increase or decrease in AGUB or ADSP.
                    </span>
                 </div>
               </div>
               <!-- END Part VI  Title -->  
               <!--L10-->
               <!-- Put this in for IBM defect  because the two elements do not separate from each other (render without a space in between)-->
               <div class="styBB" style="width:187mm;">
                 <div class="styLNLeftNumBox" style="height:auto;">10</div>
                 <div class="styLNDesc" style="width:178mm;height:auto;">
                    Enter the tax year and tax return form number with which the original Form 8023 or Form 8883 and any supplemental statements were filed.  
                    <br/>
                    
                    <table class="styTable" style="font-size: 7pt; border-color:black;" cellspacing="0">
							<xsl:if test="($Print != $Separated) or count($Form8883Data/TYWhichOrigForm8023Or8883Filed) &lt;= 20">
									<xsl:for-each select="$Form8883Data/TYWhichOrigForm8023Or8883Filed">
										<tr>
										<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 10mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxYr"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 20mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxReturnFormNumberDsc"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
							
						</table>
                     <!-- Put this in for IBM defect  because the two elements do not separate from each other (render without a space in between)-->
              <!--   <xsl:for-each select="$Form8883Data/TYWhichOrigForm8023Or8883Filed">  
                           
                      <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="."/>
		            </xsl:call-template>
                        <xsl:if test="not(position() = last())">
                        <span style="width:1mm;"/>; 
                      </xsl:if> 
	             </xsl:for-each> -->
	             <!-- Put this in to see if the two elements separate from each other but they still render without a space in between -->
	           <!--  <xsl:if test="($Print = $Separated) and (count($Form8883Data/TYWhichOrigForm8023Or8883Filed) &gt;15)">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$Form8883Data/TYWhichOrigForm8023Or8883Filed"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($Form8883Data/TYWhichOrigForm8023Or8883Filed) &lt;15))">
								<xsl:for-each select="$Form8883Data/TYWhichOrigForm8023Or8883Filed">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<xsl:if test="position()!=last()">
										<span style="width: 2px;">, </span>
									</xsl:if>
								</xsl:for-each>
							</xsl:if>-->
	            
                 </div>
               </div>
               
               <!--L11-->  
               <div class="styBB" style="width:187mm;">        
                 <table class="styTable" cellspacing="0" style="font-size:7pt;height:auto;">
                   <thead class="styTableThead">
                      <tr>
                        <th class="styTableCellHeader" style="height:auto;border-style: solid; border-color: black;width:31mm;text-align:left;" scope="col">                                        
                            <span class="styBoldText" style="width:24px;">11</span><span style="font-size:6pt;font-weight:normal;">  Assets </span>
                        </th>
                        <th class="styTableCellHeader" style="height:auto;border-style: solid; border-color: black;width:60mm;font-size:6pt;font-weight:normal;" scope="col">Allocation of sales price as previously reported</th>
                        <th class="styTableCellHeader" style="height:auto;border-style: solid; border-color: black;width:37mm;font-size:6pt;font-weight:normal;" scope="col">Increase or (decrease)</th>  
                        <th class="styTableCellHeader" style="height:auto;border-style: solid; border-color: black;width:58mm;border-right-width: 0px;font-size:6pt;font-weight:normal;" scope="col">Redetermined allocation of AGUB or ADSP</th>      
                      </tr>
                  </thead>
                  <tfoot/>
                  <tbody>
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Class I              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class1PrevPriceAllocationAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class1IncreaseDecreaseAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Cl1RedetermAllocnAGUBOrADSPAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>                          
                    </tr>  
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Class II              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class2PrevPriceAllocationAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class2IncreaseDecreaseAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Cl2RedetermAllocnAGUBOrADSPAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>                        
                    </tr>  
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Class III              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class3PrevPriceAllocationAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class3IncreaseDecreaseAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Cl3RedetermAllocnAGUBOrADSPAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>                          
                    </tr>  
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Class IV              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class4PrevPriceAllocationAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class4IncreaseDecreaseAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Cl4RedetermAllocnAGUBOrADSPAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>                        
                    </tr>  
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Class V              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class5PrevPriceAllocationAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class5IncreaseDecreaseAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Cl5RedetermAllocnAGUBOrADSPAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>                          
                    </tr>  
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Class VI and VII              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class6And7PrevPriceAllocnAmt"/>
                        </xsl:call-template>  
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Class6And7IncreaseDecreaseAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/Cl6And7RedtrmAllocnAGUBADSPAmt"/>
                        </xsl:call-template>  
                        <span style="width:4px;"/>        
                      </td>                          
                    </tr>  
                    <tr>
                      <td class="styTableCellText" scope="row" style="border-style: solid; border-color: black;width:31mm;padding-top:5mm;">
                        Total              
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;padding-top:5mm;text-align:right;">                
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>                
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/TotalOfPreviousPriceAllocnAmt"/>
                        </xsl:call-template>    
                        <span style="width:4px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:37mm;background-color:lightgrey;">                    
                        <span style="width:1px;"/>        
                      </td>
                      <td class="styTableCellText" style="border-style: solid; border-color: black;width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                        <span style="width:4px; float:left;">$</span>
                        <span style="width:2px;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$Form8883Data/TotRedetermAllocnAGUBOrADSPAmt"/>
                        </xsl:call-template>  
                        <span style="width:4px;"/>        
                      </td>                          
                    </tr>                  
                  </tbody>
                </table>
              </div>        
              <!--Blank Line -->
              <div style="width: 187mm;"> </div>
              <!--L12-->
              <div class="styBB" style="width:187mm;">
                <div class="styLNLeftNumBox" style="height:auto;">12</div>
                <div class="styLNDesc" style="width:178mm;height:auto;">
                  Reason(s) for increase or decrease. Attach additional sheets if more space is needed.  
                  <xsl:if test="count($Form8883Data/IncreaseOrDecreaseReasonsDsc) !=0 and ($Form8883Data/IncreaseOrDecreaseReasonsDsc !='')">
                    <br/><br/>          
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8883Data/IncreaseOrDecreaseReasonsDsc"/></xsl:call-template>  
                  </xsl:if>      
                </div>
                <!--Empty rows-->
                <!--  <xsl:if test="not($Form8883Data/ReasonsForIncreaseOrDecrease)  or $Form8883Data/ReasonsForIncreaseOrDecrease=''">  -->
                <div class="styGenericDiv">
                  <div class="styBB" style="height:auto;width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                  <div class="styBB" style="height:auto;width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                  <div class="styBB" style="height:auto;width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>            
                  <br/><br/>
                </div>  
              </div>      
              <!-- Footer -->
              <div style="width:187mm;">    
                <div class="stySmallText" style="width:150mm;text-align:center;padding-top:1mm;"><span style="width:156px"/></div>
                <div class="stySmallText" style="width:36mm;text-align:right;float;right;">Form <span class="styBoldText" style="font-size:8pt;">8883</span> (Rev. 12-2008)</div>
              </div>
              <!--Page End-->
              <div class="pageEnd"/>
              <!-- BEGIN Left Over Table -->  
              <!-- Additonal Data Title Bar and Button -->
              <div class="styLeftOverTitleLine" id="LeftoverData">
                <div class="styLeftOverTitle">
                  Additional Data        
                </div>
                <div class="styLeftOverButtonContainer">
                  <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
                </div>      
              </div>
              <!-- Additional Data Table -->
              <table class="styLeftOverTbl">
                <xsl:call-template name="PopulateCommonLeftover">
                  <xsl:with-param name="TargetNode" select="$Form8883Data"/>
                </xsl:call-template>
              </table>
              <!-- END Left Over Table -->  
            </form>
          </body>
        </html>
      </xsl:template>
</xsl:stylesheet>