<?xml version="1.0"?>
<!-- 06/01/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 02/16/2016 - Changes made for defect 45741 - Jeremy Nichols -->
<!-- 06/07/2016 - Changes made for defect 45742 - Jeremy Nichols -->
<!-- 06/13/2016 - Changes made for UWR 182174 - Jeremy Nichols -->
<!-- 08/09/2016 - Changes made for defect 46356 - Jeremy Nichols -->
<!-- 08/09/2016 - Changes made for defect 46357 - Jeremy Nichols -->
<!-- 08/09/2016 - Changes made for defect 46358 - Jeremy Nichols -->

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
        <meta name="Description" content="IRS8849Schedule1"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8849Schedule1Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        
        <xsl:call-template name="GlobalStylesForm"/>
        <xsl:call-template name="InitJS"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS8849Schedule1">
          <xsl:call-template name="DocumentHeader"/>
          
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 23mm;">
            <div class="styFNBox" style="height: 23mm; padding-bottom:0mm;width:31mm;font-size: 7pt">
              <br/>
              <span class="styMainTitle">Schedule 1</span>
              <br/>
              <span class="styMainTitle" style="font-size:10pt; font-weight:bold">(Form 8849)</span>
              <span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              </span>
              <br/>
              <span class="styAgency" style="font-size: 7.5pt; font-weight:bold">(Rev. April 2016)</span>
              <br/>
              <span class="styAgency" style="font-size: 7.5pt; font-weight:bold">Department of the Treasury</span>
              <br/>
              <span class="styAgency" style="font-size: 7.5pt;font-weight:bold">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm; height: 23mm">
              <div class="styMainTitle" style="height:10mm; font-weight: bold;font-size:6mm; padding-top: 1mm">Nontaxable Use of Fuels</div><br/>
              <div class="styFST" style="height:5mm;font-size:8pt;font-weight:normal; padding-top: 1mm">
                <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/> Attach to Form 8849.
              </div><br/>
              <div class="styFST" style="height:5mm;font-size:8pt;font-weight:normal; padding-top: 1mm">
                <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/> See instructions.
              </div>
            </div>
            <div class="styTYBox" style="width:31mm; height: 23mm">
              <div style="padding-top:8mm;  ">OMB No. 1545-1420</div>
            </div>
          </div>
          <!--  End title of Form  -->
          
          <!--  Name / Employer identification number / Total Refund  -->
          <table cellspacing="0" style="height:auto;width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
          
            <tr>
              <td class="styNameBox" style="width:100mm; ;font-weight:normal; ">
                Name as shown on Form 8849<br/>
                <xsl:choose>
                
                  <xsl:when test="normalize-space($FormData/NameOfEmployer) != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine1Txt"/>
                    </xsl:call-template>
                    <xsl:if test="normalize-space($FormData/NameOfEmployer/BusinessNameLine2Txt)!=''">
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/NameOfEmployer/BusinessNameLine2Txt"/>
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
              </td>
              <td valign="top" style="width:30mm;padding-left:2mm; ;font-weight:normal;border-right:1px solid black;">
                <span class="BoldText" style="width:33mm;vertical-align:top;">EIN or SSN</span>
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
              <td valign="top" style="width:57mm;padding-left:2mm; ;font-weight:normal;">
                <span class="BoldText">Total refund (see instructions)</span><br/>
                <div style="text-align:right; padding-top:2mm;font-weight:normal;">
                  <span style="">$</span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalRefundAmt"/>
                  </xsl:call-template>
                </div>
              </td>
            </tr>
            
          </table>
          <!--  End - Name / Employer identification number / Total Refund  -->
          
          <!--  Begin Sentence -->
          <div style="width:187mm;display:block;">
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style=" ;font-family:verdana;">
                <tbody style=" ;font-family:verdana;">
                
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
                        <xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodBeginDt"/>
                      </xsl:call-template>
                      <span style="padding-left:30mm;font-size:8pt;margin-left:3mm;font-weight:bold; padding-top: 1mm">
                        <b>To  </b>
                        <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/>
                      </span>
                      <xsl:call-template name="PopulateMonthDayYear">
                        <xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodEndDt"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  
                </tbody>
              </thead>
            </table>
          </div>
          <!--  End Sentence -->
          
          <!-- Begin Table 1  -->
          <div style="width:187mm;display:block;">
            <table cellspacing="0">
              <thead style=" ;font-family:verdana;">
              
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom-width:0px; border-color: black" scope="col">
                    <span class="styTableCellPad">1</span>
                  </th>
                  <th class="styTableCellHeader" style="width:80mm; font-weight:normal; text-align:left; border-bottom-width:0px; border-color: black" scope="col">
                    <b>Nontaxable Use of Gasoline</b>
                  </th>
                  <th class="styTableCellHeader" style="width:11mm; font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; padding-left:1mm;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:35mm; text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
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
              <tbody style=" ;font-family:verdana;">
              
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
                            <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rt"/>
                          </xsl:call-template>
                        </td>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                      <td style="text-align: center;  border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;">$</span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rt"/>
                        </xsl:call-template>
                      </td>
                      <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GallonsQty"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;">$</span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amt"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
						  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
							<span style="width:1px"/>
						  </td>
                        <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rt"/>
                          </xsl:call-template>
                        </td>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
					  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
						<span style="width:1px"/>
					  </td>
                      <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rt"/>
                        </xsl:call-template>
                      </td>
                      <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GallonsQty"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amt"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 1, section b -->
                <!--  End Table 1  -->
                </tbody>
			</table>
		  </div>
           
          <div style="width:187mm;display:block;">
            <table cellspacing="0">
                <!-- Begin Table 2 -->
                <tr>
                  <th class="styTableCellHeader" style="height:4mm;width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">2</span>
                  </th>
                  <th colspan="7" style="height:4mm;width:183mm; font-weight:bold; text-align:left; border-top:1px black solid;  border-bottom:0px;" scope="col">Nontaxable Use of Aviation Gasoline</th>
                </tr>
                
                <!-- Begin Table 2, section a  -->
                <tr>
                  <td valign="top" style="width:4mm;border-top:1px black solid;">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>a</b>
                    </span>
                  </td>
                  <td style="width:80mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    Use in commercial aviation<br/> (other than foreign trade)
                  </td>
                  <td style="width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="width:12mm;padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/CommercialAviation/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="width:35mm;padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="color:black;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/CommercialAviation/GallonsQty"/>
                    </xsl:call-template></span>
                  </td>
                  <td style="width:35mm;padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/CommercialAviation/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:10mm;padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/CommercialAviation/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 2, section a  -->
                
                <!-- Begin Table 2, section b  -->
                <xsl:choose>
                
                  <xsl:when test="$FormData/NontaxableUseOfAviationGas/OtherNontaxableUseAviation">
                    <xsl:for-each select="$FormData/NontaxableUseOfAviationGas/OtherNontaxableUseAviation">
                    
                      <tr>
                        <td style="width:4mm;">
                          <span style="padding-left:4mm; padding-right:2mm">
                            <b>b</b>
                          </span>
                        </td>
                        <td style="width:80mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          Other nontaxable use (see <b>Caution</b> above line 1)
                        </td>
                        <td style="width:11mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:12mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rt"/>
                          </xsl:call-template>
                        </td>
                        <td colspan="2" style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:10mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                      
                    </xsl:for-each>
                  </xsl:when>
                  
                  <xsl:otherwise>
                  
                    <tr>
                      <td style="width:4mm;">
                        <span style="padding-left:4mm; padding-right:2mm">
                          <b>b</b>
                        </span>
                      </td>
                      <td style="width:80mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          Other nontaxable use (see <b>Caution</b> above line 1)
                        </td>
                      <td style="width:11mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                        </xsl:call-template>
                      </td>
                      <td style="width:12mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rt"/>
                        </xsl:call-template>
                      </td>
                      <td colspan="2" style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GallonsQty"/>
                        </xsl:call-template>
                      </td>
                      <td style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;"/>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amt"/>
                        </xsl:call-template>
                      </td>
                      <td style="width:10mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                    
                  </xsl:otherwise>
                </xsl:choose>
                <!-- End Table 2, section b  -->
                
                <!-- Begin Table 2, section c  -->
                <tr>
                  <td valign="top" style="width:4mm;">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>c</b>
                    </span>
                  </td>
                  <td style="width:80mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Exported</td>
                  <td style="width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="width:12mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:10mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/NontaxableAviationGasExported/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 2, section c -->
                
                <!-- Begin Table 2, section d  -->
                <tr>
                  <td style="width:4mm;">
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>d</b>
                    </span>
                  </td>
                  <td style="width:80mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">LUST tax on aviation fuels used in foreign trade</td>
                  <td style="width:11mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="width:12mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:35mm;padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:10mm;padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAviationGas/LUSTTaxAviationUseForeignTrade/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 2, section d -->
			</table>
		  </div>
			
          <div style="width:187mm;display:block;">
            <table class="styTable" cellspacing="0">
                <!-- Begin Table 3  -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">3</span>
                  </th>
                  <th colspan="7" style="width:183mm; font-weight:bold; text-align:left; border-top:1px black solid;  border-bottom:0px;" scope="col">
                    <b>Nontaxable Use of Undyed Diesel Fuel</b>
                  </th>
                </tr>
                
                <tr>
                  <td style="width:4mm;border-top:1px black solid">
                    <span style="padding-left:4mm; padding-right:2mm"/>
                  </td>
                  <td colspan="6" style="width:173mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    Claimant certifies that the diesel fuel did not contain visible evidence of dye.  
                    <br/><b>Exception.</b> If any of the diesel fuel included in this claim <b>did</b> contain visible evidence of dye, attach a detailed explanation and check here
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
                    </xsl:call-template>
                    
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>           
                    </span>
                    <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/>
                  </td>
                  <td style="width:10mm;text-align: center; padding-top: 2mm; border-top:1px black solid; border-bottom:0px black solid; border-left-width: 0px; border-right-width: 0px">
                  
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1Exception</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
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
                  <th class="styTableCellHeader" style="width:80mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <span class="styTableCellPad" style="width:74mm;"/>
                  </th>
                  <th class="styTableCellHeader" style="width:11mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm;padding-right:2mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:35mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;padding-left:.5mm;text-align:center;font-weight:normal; border-top: 1px solid black; border-right:1px solid black; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b></i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                    <b>(e) CRN</b>
                  </th>
                </tr>
                
                <!-- Begin Table 3, section a  -->
                <xsl:choose>
                
                  <xsl:when test="$FormData/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel">
                    <xsl:for-each select="$FormData/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel">
                    
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
                        
                        <td style="width:80mm;text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use</td>
                        <td style="width:11mm;text-align: center;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:12mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rt"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:33mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <xsl:choose>
                        
                          <xsl:when test="position()=count($FormData/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel) and position() &gt; 1">
                            <td rowspan="2" style="width: 2mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <xsl:choose>
                            
                              <xsl:when test="position()= 1">
                                <xsl:choose>
                                
                                  <xsl:when test="count($FormData/NontaxableUseUndyedDieselFuel/AllwblNontxUseUndyedDslFuel) = 1">
                                    <td rowspan="2" style="width: 2mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                      <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                                    </td>
                                  </xsl:when>
                                  
                                  <xsl:otherwise>
                                    <td style="width: 2mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                      <span style="width:1px"/>
                                    </td>
                                  </xsl:otherwise>
                                </xsl:choose>
                                
                              </xsl:when>
                              <xsl:otherwise>
                                <td style="width: 2mm; text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                  <span style="width:1px"/>
                                </td>
                              </xsl:otherwise>
                            </xsl:choose>
                            
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:choose>
                        
                          <xsl:when test="position()= 1">
                            <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;"/>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="padding-left:4mm; padding-right:2mm"/>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
						<td style="width:10mm;text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                        <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;">$</span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Rt"/>
                      </xsl:call-template>
                    </td>
                    <td style=" text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GallonsQty"/>
                      </xsl:call-template>
                    </td>
                    <td rowspan="2" style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                    </td>
                    <xsl:choose>
                      <xsl:when test="position()= 1">
                        <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="padding-left:4mm; padding-right:2mm"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseFarmingPurposes/CreditReferenceNum"/>
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
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontaxUndyedDslFuelUseInTrains/CreditReferenceNum"/>
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
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/NontxFuelUseIntrctyAndLclBuses/CreditReferenceNum"/>
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
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/ExportedFuel/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/ExportedFuel/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="width:35mm;text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/ExportedFuel/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseUndyedDieselFuel/ExportedFuel/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 3, section e -->
                <!-- End Table 3 -->
			</table>
		  </div>
		  
          <div style="width:187mm;">
            <table class="styTable" cellspacing="0">
                <!-- Begin Table 4  -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">4</span>
                  </th>
                  <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                    <b>Nontaxable Use of Undyed Kerosene (Other Than Kerosene Used in Aviation)</b>
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
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/UndyedKeroseneUseExceptionInd"/>
                    </xsl:call-template>
                    
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>
                    </span>
                    <img src="{$ImagePath}/8849Sch1_Bullet.gif" alt="MediumBullet"/>
                  </td>
                  <td style="width:10mm;text-align: center; padding-top: 2mm; border-top:1px black solid; border-bottom:0px black solid; border-left-width: 0px; border-right-width: 0px">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/UndyedKeroseneUseExceptionInd"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1KeroseneException</xsl:with-param>
                      </xsl:call-template>
                    </input>
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/UndyedKeroseneUseExceptionInd"/>
                        <xsl:with-param name="BackupName">IRS4498Schedule1KeroseneException</xsl:with-param>
                      </xsl:call-template>
                    </label>
                  </td>
                </tr>
                <tr>
                  <td style="border-top:0px black solid">
                    <span style="padding-left:4mm; padding-right:2mm"/>
                  </td>
                  <td colspan="7" style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <b>Caution. </b>
                    <i> Claims cannot be made on line 4 for kerosene sales from a blocked pump. Only registered ultimate vendors may make those claims using Schedule 2.</i>
                  </td>
                </tr>
                <!-- End Exception text -->
                
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 0px solid black" scope="col">
                    <span class="styTableCellPad" style="width:1px"/>
                  </th>
                  <th class="styTableCellHeader" style="width:80mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <span class="styTableCellPad" style="width:69mm"/>
                  </th>
                  <th class="styTableCellHeader" style="width:11mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(a) Type of use</b>
                  </th>
                  <th class="styTableCellHeader" style="width:12mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(b) Rate</b>
                  </th>
                  <th colspan="2" class="styTableCellHeader" style="width:35mm; font-weight:normal; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;padding-left:.5mm;border-top:1px black solid;border-right:1px black solid;text-align:center;font-weight:normal; border-bottom-width:0px; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                    </i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                    <b>(e) <br/>CRN</b>
                  </th>
                </tr>
                
                <!-- Begin Table 4, section a  -->
                <xsl:choose>
                
                  <xsl:when test="$FormData/NontxUseUndyedKeroseneNotAvn/NontaxUndyedKrsnNotAvnTxd244">
                    <xsl:for-each select="$FormData/NontxUseUndyedKeroseneNotAvn/NontaxUndyedKrsnNotAvnTxd244">
                    
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
                            <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Rt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <xsl:choose>
                          <xsl:when test="position()=count($FormData/NontxUseUndyedKeroseneNotAvn/NontaxUndyedKrsnNotAvnTxd244) and position() &gt; 1">
                            <td rowspan="2" style="width: 2mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <xsl:choose>
                              <xsl:when test="position()= 1">
                                <xsl:choose>
                                  <xsl:when test="count($FormData/NontxUseUndyedKeroseneNotAvn/NontaxUndyedKrsnNotAvnTxd244) = 1">
                                    <td rowspan="2" style="width: 2mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                      <img src="{$ImagePath}/8849Sch1_Bracket.gif" alt="Bracket"/>
                                    </td>
                                  </xsl:when>
                                  
                                  <xsl:otherwise>
                                    <td style="width: 2mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                      <span style="width:1px"/>
                                    </td>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:when>
                              <xsl:otherwise>
                                <td style="width: 1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                  <span style="width:1px"/>
                                </td>
                              </xsl:otherwise>

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
								<xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                          <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                        </xsl:call-template>
                      </td>
                      <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                        <span style="float:left;">$</span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rt"/>
                        </xsl:call-template>
                      </td>
                      <td style="width: 35mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GallonsQty"/>
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
                          <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseFarmingPurposes/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseFarmingPurposes/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseFarmingPurposes/CreditReferenceNum"/>
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
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseIntrctyAndLclBuses/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseIntrctyAndLclBuses/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseIntrctyAndLclBuses/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxFuelUseIntrctyAndLclBuses/CreditReferenceNum"/>
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
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/ExportedFuel/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/ExportedFuel/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/ExportedFuel/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/NontxUseUndyedKeroseneNotAvn/ExportedFuel/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  End Table 4, section d -->
                
				<xsl:for-each select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxUndyedKrsnNotAvnTxd044">
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
                      <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  End Table 4, section e -->
                </xsl:for-each>
                
				<xsl:for-each select="$FormData/NontxUseUndyedKeroseneNotAvn/NontxUndyedKrsnNotAvnTxd219">
                <!-- Begin Table 4, section f -->
                <tr>
                  <td>
                    <span style="padding-left:4mm; padding-right:2mm">
                      <b>f</b>
                    </span>
                  </td>
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">Nontaxable use taxed at $.219</td>
                  <td style="text-align: right; padding-right:4mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                    <span style="width:1px"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid;padding-right:2mm; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  End Table 4, section f -->
                </xsl:for-each>
                
			</table>
		  </div>
		  
          <div style="width:187mm;display:block;">
            <table class="styTable" cellspacing="0">
                <!-- Begin Table 5  -->
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid;border-bottom:0px; " scope="col">
                    <span class="styTableCellPad">5</span>
                  </th>
                  <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                    <b>Kerosene Used in Aviation</b> (see <b>Caution</b> above line 1)</th>
                </tr>
                <tr>
                  <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black" scope="col">
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
                    <b>(c) Gallons</b>
                  </th>
                  <th class="styTableCellHeader" style="width:35mm; font-size:6.25pt;padding-left:.5mm;border-top-width:1px;text-align:center;font-weight:normal; border-bottom-width:0px; border-top: 1px solid black; border-right:1px solid black; border-color: black" scope="col">
                    <b>(d) Amount of refund</b>
                    <br/>
                    <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                    </i>
                  </th>
                  <th class="styTableCellHeader" style="width:10mm; font-weight:normal; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                    <b>(e) <br/>CRN</b>
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
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; ">Kerosene used in commercial aviation <br/> (other than foreign trade) taxed at $.244</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background:lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:4mm; text-align: right;padding-right:2mm; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/CreditReferenceNum"/>
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
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;  ">Kerosene used in commercial aviation <br/> (other than foreign trade) taxed at $.219</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; background: lightgrey">
                    <span style="width:1px"/>
                  </td>
                  <td style="padding-top:4mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/CreditReferenceNum"/>
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
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; ">Nontaxable use (other than use by state or <br/> local government) taxed at $.244</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/NontaxableUseOfFuelTypeCd"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right;padding-right:2mm; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244/CreditReferenceNum"/>
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
                  <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px; ">Nontaxable use (other than by state or local <br/> government) taxed at $.219</td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/NontaxableUseOfFuelTypeCd"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; padding-right:2mm;border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="padding-top:4mm; text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219/CreditReferenceNum"/>
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
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                    <span style="float:left;"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Amt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- End Table 5, section e -->
                <!-- End Table 5 -->
                
                <!-- Begin Footer -->
                <tr>
                  <td colspan="8" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
                    <div style="float: left; clear: none;">
                      <span class="styBoldText" style=" ">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.</span>
                      <span style="padding-left:4mm;width:27mm;  ">Cat. No. 27449T </span>
                      <span class="styBoldText">
                        <span style="width:2px"/> Schedule 1 (Form 8849) </span>(Rev. 4-2016)
                    </div>
                  </td>
                </tr>
            </table>
          </div>
          <div class="pageEnd"/>
          <!-- End Footer -->
          
          <!-- Begin page 2 Header -->
          <div style="width:187mm;">
            <div style="width:187mm;border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
              Schedule 1 (Form 8849) (Rev. 4-2016)<span style="width:129mm;"/>Page <span class="styBoldText" style="display:inline;font-size: 7pt">2</span>
            </div>
            <!-- End page 2 Header -->
            
            <!--  Begin Table 6   -->
            <div style="width:187mm; ;display:block;">
              <table class="styTable" cellspacing="0">
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
                    <th class="styTableCellHeader" style="width:11mm; font-weight:normal; border-bottom:1px solid black; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(a) Type of use</b>
                    </th>
                    <th class="styTableCellHeader" style="width:12mm; vertical-align:top;padding-top:2mm;font-weight:normal; border-bottom:1px solid black; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(b) Rate</b>
                    </th>
                    <th colspan="2" class="styTableCellHeader" style="width:35mm; vertical-align:top;padding-top:2mm;font-weight:normal; border-bottom:1px solid black; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(c) Gallons, or gasoline or diesel gallon equivalents</b>
                    </th>
                    <th class="styTableCellHeader" style="padding-left:1mm;width:35mm; font-weight:normal; border-bottom:1px solid black; border-right:1px solid black; border-top: 1px solid black" scope="col">
                      <b>(d) Amount of refund</b>
                      <br/>
                      <i>Multiply col. <b>(b)</b> by col. <b>(c)</b>
                      </i>
                    </th>
                    <th class="styTableCellHeader" style="width:10mm;vertical-align:top;padding-top:2mm; font-weight:normal; border-bottom:1px solid black; border-right:0px solid black; border-top: 1px solid black;" scope="col">
                      <b>(e) <br/>CRN</b>
                    </th>
                  </tr>
                  
                  <!-- Begin Table 6, section a -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas">  
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas">
                      
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
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            Liquefied petroleum gas (LPG)
                          </td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;">$</span>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                          <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedPetroleumGas/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                      
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section a -->

                  <!-- Begin Table 6, section b -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit">  
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit">
                      
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>b</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">"P Series" fuels</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxPSeriesFuelCredit/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                        
                      </xsl:otherwise>
                    </xsl:choose>
                  <!-- End Table 6, section b -->
                  
                  <!-- Begin Table 6, section c -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG"> 
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG">
                      
                        <tr>
                          <td valign="top">
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>c</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Compressed natural gas (CNG)</td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Compressed natural gas (CNG)</td>
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxCNG/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <td colspan="2" style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="padding-top:1mm; text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                      
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section c -->
                  
                  <!-- Begin Table 6, section d -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen"> 
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen">
                      
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>d</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquefied hydrogen</td>
                          
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedHydrogen/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                        
                      </xsl:otherwise>
                    </xsl:choose>
                  <!-- End Table 6, section d -->
                  
                  <!-- Begin Table 6, section e -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal">
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal">
                      
                        <tr>
                          <td valign="top">
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>e</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            Fischer-Tropsch process liquid fuel from coal (including peat)
                          </td>
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          Fischer-Tropsch process liquid fuel from coal (including peat)
                        </td>
                        
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromCoal/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                      
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section e -->
                  
                  <!-- Begin Table 6, section f -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass">
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass">
                      
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>f</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">Liquid fuel derived from biomass</td>
                          
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          Liquid fuel derived from biomass
                        </td>
                        
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquidFuelFromBiomass/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                      
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section f -->
                  
                  <!-- Begin Table 6, section g -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG">
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG">
                      
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm">
                              <b>g</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            Liquefied natural gas (LNG)
                          </td>
                          
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          Liquefied natural gas (LNG)
                        </td>
                        
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLNG/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                      
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section g -->
                  
                  <!-- Begin Table 6, section h -->
                  <xsl:choose>
                    <xsl:when test="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass">
                      <xsl:for-each select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass">
                      
                        <tr>
                          <td>
                            <span style="padding-left:4mm; padding-right:2mm;border-top-width: 0px; border-bottom-width: 1px;">
                              <b>h</b>
                            </span>
                          </td>
                          <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            Liquefied gas derived from biomass
                          </td>
                          
                          <xsl:choose>
                            <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;"/>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                            </xsl:call-template>
                          </td>
                        </tr>
                        
                      </xsl:for-each>
                    </xsl:when>
                    
                    <xsl:otherwise>
                    
                      <tr>
                        <td>
                          <span style="padding-left:4mm; padding-right:2mm;border-top-width: 0px; border-bottom-width: 1px;">
                            <b>h</b>
                          </span>
                        </td>
                        <td style="text-align: left; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          Liquefied gas derived from biomass
                        </td>
                        
                        <xsl:choose>
                          <xsl:when test="normalize-space($FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontaxableUseOfAlternativeFuel/NontxLiquefiedGasFromBiomass/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;"/>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- End Table 6, section h -->
                  <!-- End Table 6 -->
			  </table>
		    </div>
		    
          <div style="width:187mm;display:block;">
            <table class="styTable" cellspacing="0">
                  <!--  Begin Table 7   -->
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                      <span class="styTableCellPad">7</span>
                    </th>
                    <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:0px black solid;" scope="col">
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
                    <th class="styTableCellHeader" style="width:80mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
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
                    <xsl:when test="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel">
                      <xsl:for-each select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel">
                      
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
                            <xsl:when test="normalize-space($FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/OtherFuelUseDetail) != ''">
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/OtherFuelUseDetail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:when>
                            
                            <xsl:otherwise>
                              <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                                </xsl:call-template>
                                <span style="padding-left:2mm;">
                                  <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                  </xsl:call-template>
                                </span>
                              </td>
                              <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                                <span style="float:left;">$</span>
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/FuelUseTypeCd5Detail/Rt"/>
                                </xsl:call-template>
                              </td>
                            </xsl:otherwise>
                          </xsl:choose>
                          
                          <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="GallonsQty"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                            <span style="float:left;">$</span>
                            <xsl:call-template name="PopulateAmount">
                              <xsl:with-param name="TargetNode" select="Amt"/>
                            </xsl:call-template>
                          </td>
                          <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                          <xsl:when test="normalize-space($FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/OtherFuelUseDetail) != ''">
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/OtherFuelUseDetail/NontaxableUseOfFuelTypeCd"/>
                              </xsl:call-template>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/OtherFuelUseDetail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:when>
                          
                          <xsl:otherwise>
                            <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/FuelUseTypeCd5Detail/FuelTaxLocalBusCd"/>
                              </xsl:call-template>
                              <span style="padding-left:2mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/FuelUseTypeCd5Detail/NontaxableUseOfFuelTypeCd"/>
                                </xsl:call-template>
                              </span>
                            </td>
                            <td style="text-align: right; border-style: solid; padding-right:2mm;border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                              <span style="float:left;">$</span>
                              <xsl:call-template name="PopulateText">
                                <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/NontxUseDslWaterFuel/FuelUseTypeCd5Detail/Rt"/>
                              </xsl:call-template>
                            </td>
                          </xsl:otherwise>
                        </xsl:choose>
                        
                        <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                          <span style="float:left;">$</span>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="Amt"/>
                          </xsl:call-template>
                        </td>
                        <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
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
                        <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/ExportedFuel/Rt"/>
                      </xsl:call-template>
                    </td>
                    <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/ExportedFuel/GallonsQty"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/ExportedFuel/Amt"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/NontxDieselWaterFuelEmulsion/ExportedFuel/CreditReferenceNum"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <!-- End Table 7, section b -->
                  <!-- End Table 7 -->
                </table>
              </div>  
              
          <div style="width:187mm;display:block;">
            <table class="styTable" cellspacing="0">
                  <!--  Begin Table 8  -->
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px;border-top:1px black solid; border-bottom:0px; " scope="col">
                      <span class="styTableCellPad">8</span>
                    </th>
                    <th colspan="7" style="width:183mm; font-weight:normal; text-align:left; border-top:1px black solid;" scope="col">
                      <b>Exported Dyed Fuels and Gasoline Blendstocks</b>
                    </th>
                  </tr>
                  
                  <tr>
                    <th class="styTableCellHeader" style="width:4mm;border-right-width:0px; border-bottom:0px; border-right:0px solid black; border-top: 1px solid black" scope="col">
                      <span class="styTableCellPad" style="width:1px"/>
                    </th>
                    <th class="styTableCellHeader" style="width:80mm; font-weight:normal; text-align:left; border-bottom:0px; border-right:1px solid black; border-top: 1px solid black" scope="col">
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
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedDieselFuel/Rt"/>
                      </xsl:call-template>
                    </td>
                    <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedDieselFuel/GallonsQty"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;">$</span>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedDieselFuel/Amt"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedDieselFuel/CreditReferenceNum"/>
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
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedKerosene/Rt"/>
                      </xsl:call-template>
                    </td>
                    <td colspan="2" style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedKerosene/GallonsQty"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: right; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px">
                      <span style="float:left;"/>
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedKerosene/Amt"/>
                      </xsl:call-template>
                    </td>
                    <td style="text-align: center; border-style: solid; border-color: black; border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/ExpDyedFuelsGasBlendstocks/ExportedDyedKerosene/CreditReferenceNum"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                  <!-- End Table 8, section b -->
                  <!-- End Table 8 -->
                  
                  <!-- Begin Page 2 Footer -->
                  <tr>
                    <td colspan="8" style="border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
                      <div style="float: right; clear: none;">
                        <span class="styBoldText">
                          <span style="width:4px"/> Schedule 1 (Form 8849) </span>(Rev. 4-2016)
                      </div>
                    </td>
                  </tr>
              </table>
            </div>
          </div>
          <div class="pageEnd"/>
            
            <!-- Begin Left Over Data Table -->
            <!-- Begin Additonal Data Title Bar and Button -->
            <div class="styLeftOverTitleLine" id="LeftoverData">
              <div class="styLeftOverTitle">
                Additional Data        
              </div>
              <div class="styLeftOverButtonContainer">
                <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage ();"/>
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
            
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>