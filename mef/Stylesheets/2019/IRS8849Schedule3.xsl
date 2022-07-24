<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/01/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/24/2015 - Changes made for UWR 154016 - Jeremy Nichols -->
<!-- 02/09/16 - Made changes per UWR #173983 - Jeremy Nichols -->
<!-- 02/17/16 - Made changes per defect 45744 - Jeremy Nichols -->
<!-- 02/29/16 - Made changes per defect 45823 - Jeremy Nichols -->
<!-- 02/29/16 - Made changes per defect 45824 - Jeremy Nichols -->
<!-- 06/15/2020 - Changes made for UWR 235750 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8849Schedule3Style.xsl"/>
	
 <xsl:output method="html" indent="yes"/>
 <xsl:strip-space elements="*"/>
  
 <!--Defines the stage of the data-->
 <xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule3"/>
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
      
      <!-- Define Character Set -->
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <meta name="Description" content="IRS Form 8849Schedule3"/>
      
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      
      <style type="text/css">
        <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="IRS8849Schedule3Style"/>
          <xsl:call-template name="AddOnStyle"/>
        </xsl:if>
      </style>
      
      <xsl:call-template name="GlobalStylesForm"/>
      <xsl:call-template name="InitJS"/>
      
      </head>
      <body class="styBodyClass">
        <form name="Form8849Schedule3">
        
          <!--BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!--END WARNING LINE -->
  
          <!--Begin Header -->
          <div class="styTBB" style="width:187mm;border-bottom-width:1px;">
          
            <!--Form Number -->
            <div class="styFNBox" style="width:31mm;height:18mm;border-right-width:1px;border-bottom:1px;">
               <span class="styFormNumber" style="font-size:10pt">Schedule 3</span><br/>
               <span class="styFormNumber" style="font-size:10pt">(Form 8849)</span><br/>
               <span class="styAgency" style="height:3mm;">(Rev. February 2020)</span>
               <div class="styAgency" style="height:3mm;">Department of the Treasury</div>
               <span class="styAgency" style="height:3mm;">Internal Revenue Service</span> 
            </div>
            
            <!--Form Name -->
            <div class="styFTBox" style="width:125mm;height:18mm;border-left-width:1px;">
              <div class="styMainTitle" style="height:11mm;border-right-width:1px;padding-top:1mm;">
                Certain Fuel Mixtures<br/>and the Alternative Fuel Credit
              </div>
              <div class="styFST" style="height:4mm;font-size:6pt;margin-left:2mm;text-align:center;padding-top:1mm;">
                <div style="text-align:center;font-weight:normal;">
                  <img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/> 
                  Attach to Form 8849. <span class="styBoldText">Do not </span> file with any other schedule.
                </div>
                <div style="text-align:center;font-weight:normal;padding-bottom:1mm;">
                  <img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/> 
                  For information about Schedule 3 (Form 8849) and its instructions, go to www.irs.gov/form8849.
                </div>
              </div>
            </div>
            
            <!--OMB/Tax Year -->				
            <div class="styTYBox" style="width:31mm;height:18mm;padding-top:8mm;text-align:center;border-left-width:1px;">
              OMB No. 1545-1420
            </div>
          </div>	
              
          <!--Begin Name/EIN -->	
          <div style="width:187mm;">
            <div class="styNameAddr" style="width:107mm;height:10mm;border-top-width:0px;border-left-width:0px;padding-left:1px;font-size:7pt;">
              Name as shown on Form 8849
              <br/>
              <div style="font-size:6pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
              </div>
            </div>
            <div class="styNameAddr" style="font-size:7pt;width:35mm;height:10mm;border-top-width:0px;border-left-width:1px;padding-left:1px;">
              <span style="width:8px"/>EIN or SSN <br/><br/>
              <span style="width:8px"/>
              
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
            
            <div class="styNameAddr" style="font-size:7pt;width:45mm;height:10mm;border-top-width:0px;border-left-width:1px;padding-left:1px;">
              <span style="width:8px"/>Total refund (see instructions)<br/> <br/>
              <span style="width:2px;clear:none"/>$
              <span style="width:40mm;text-align:right;clear:none">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalRefundAmt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--End Name/EIN -->		
          
          <!--Begin Schedule 2 -->		
          <!--Begin Header 1 -->
          <div style="width:187mm;padding-bottom:7mm;">
            <div class="styLNLeftNumBox" style="height:15mm;width:6mm;"/>
            <div class="styLNDesc" style="width:179mm;height:15mm;padding-top:1.5mm;">
              <span class="styBoldText" style="display:inline;">Caution: </span>
              <span class="styNormalText" style="display:inline;">
                For 2018 and 2019: See the instructions and Notice 2020-08 for information on how to make 2018 and 2019 claims. Combine claims for 
				2018 and 2019 on the same Schedule 3 (Form 8849). For 2020 and later year claims: The biodiesel mixture credit and renewable diesel mixture credit must first be taken as a
				credit against your taxable fuel liability (gasoline, diesel fuel, and kerosene) reported on Form 720. Similarly, the alternative fuel credit must first
				be taken on Form 720 as a credit against your alternative fuel or compressed natural gas (CNG) tax liability. If you have these tax liabilities and
				you did not make the claim on Form 720, Schedule C as a credit against those liabilities, you must first file Form 720-X, Amended Quarterly
				Federal Excise Tax Return, before Schedule 3 (Form 8849) can be used for the refund. You cannot claim any amounts on Form 8849 that you
				claimed (or will claim) on Form 720, Schedule C; Form 720-X; or Form 4136, Credit for Federal Tax Paid on Fuels.
              </span><br/>
            </div>
          </div>
         
          <!--Begin Header 2-->	
          <div style="border-bottom:1px black solid;width:187mm;">
            <div class="styLNLeftNumBox" style="height:8mm;width:6mm;"/>
            <div class="styLNDesc" style="width:179mm;height:auto;font-size:7.5pt;padding-top:4mm">
              <span class="styBoldText">Claimant's registration no.  <img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/></span>
              <span style="width:2px;clear:none"/>
              <span style="width:130mm;text-align:left;clear:none">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/ClaimantRegistrationNum"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;width:6mm;"/>
            <div class="styLNDesc" style="width:179mm;height:6.5mm;">
              <span class="styText">Enter your registration number, including the prefix. Line 3 claimants must enter their AL or AM registration number. </span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:6mm;"/>
            <div class="styLNDesc" style="width:179mm;font-size:7.5pt;">
              <span class="styBoldText">Period of claim: </span>
              <span class="styItalicText">Enter month, day, and year in</span>
            </div>
          </div>
          
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:6mm;"/>
            <div class="styLNDesc" style="width:177mm;">
              <span class="styItalicText">MMDDYYYY format.</span>
              <span style="width:192px;clear:none"/>
              <span class="styBoldText" style="font-size:7.5pt;">From  <img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/></span>
              <span style="width:2px;clear:none"/>
              <span style="width:35mm;text-align:left;clear:none">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodBeginDt"/>
                </xsl:call-template>
              </span>
              <span style="width:40px;clear:none"/>
              <span class="styBoldText" style="font-size:7.5pt;">To <img src="{$ImagePath}/8849Schedule3_Bullet_Md.gif" alt="MediumBullet"/></span>
              <span style="width:2px;clear:none"/>
              <span style="width:35mm;text-align:left;clear:none;display:inline;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodEndDt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
    
          <!--Line 1-->	
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;width:6mm;">1</div>
            <div class="styLNDesc" style="width:100mm;height:4mm;">
              <span class="styBoldText">Reserved</span>
            </div>
          </div>
          <div style="border-bottom:1px black solid;width:187mm;">
            <div class="styLNLeftNumBox" style="height:20mm;width:6mm;"/>
            <div class="styLNDesc" style="width:179mm;height:20mm;">
              <span class="styBoldText">Reserved</span>
            </div>
          </div>
          
          <!--Line 1 Table--> 
          <div style="width:187mm;">
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
              <tbody>
              
                <tr>
                  <th scope="col" style="width:6mm;"><span style="width:1px;"/></th>
                  <th scope="col" style="width:84mm;"><span style="width:83mm;"/></th>
                  <th scope="col" style="width:10mm;border-left:1px black solid;border-bottom:1px black solid;">(a)<br/> Rate</th>
                  <th scope="col" style="width:31mm;border-left:1px black solid;border-bottom:1px black solid;">(b)<br/> Gallons of alcohol</th>
                  <th scope="col" style="width:45mm;border-left:1px black solid;border-bottom:1px black solid;">(c) Amount of claim<br/>
                    <span style="font-weight:bold;">Multiply col.</span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;"> (a) </span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;">by col.</span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;"> (b).</span>
                  </th>
                  <th scope="col" style="width:10mm;border-left:1px black solid;border-bottom:1px black solid;">(d)<br/> CRN</th>
                </tr>
  
                <!--Line 1a--> 
                <tr>
                  <td style="width:6mm;text-align:center;font-weight:bold">a</td>
                  <td style="width:84mm;text-align:left;border-bottom:1px black solid;">
					  <b>Reserved</b>
				  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;padding-right:2mm;background-color:lightgrey;">
                    
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;background-color:lightgrey;">
                    
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;background-color:lightgrey;">
                    
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;background-color:lightgrey;">
                    
                  </td>
                </tr>
    
                <!--Line 1b-->
                <tr>
                  <td style="width: 6mm;text-align:center;vertical-align:top;font-weight:bold;border-bottom:1px black solid;">b</td>
                  <td style="width:84mm;text-align:left;border-bottom:1px black solid;">
                    <b>Reserved</b>
                  </td>
                  <td style="vertical-align:top;border-left:1px black solid;border-bottom:1px black solid;padding-right:0mm;background-color:lightgrey;">
                    
                  </td>
                  <td style="text-align:center;vertical-align:top;border-left:1px black solid;border-bottom:1px black solid;text-align:right;background-color:lightgrey;">
                    
                  </td>
                  <td style="vertical-align:top;border-left:1px black solid;border-bottom:1px black solid;text-align:right;background-color:lightgrey;">
                    
                  </td>
                  <td style="text-align:center;vertical-align:top;border-left:1px black solid;border-bottom:1px black solid;background-color:lightgrey;">
                    
                  </td>
                </tr>
                
              </tbody>
            </table>
        
            <!--Line 2-->
            <div class="styBB" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;width:6mm;">2</div>
              <div class="styLNDesc" style="width:179mm;height:4mm;">
                <span class="styBoldText">Biodiesel or Renewable Diesel Mixture Credit</span>
              </div>
            </div>
            
            <div style="border-bottom:1px black solid;width:187mm;">
              <div class="styLNLeftNumBox" style="height:30mm;width:6mm;"/>
              <div class="styLNDesc" style="width:179mm;height:30mm; padding-top:1.5mm; padding-bottom:1.5mm;text-align:justify">
                <b>Biodiesel mixtures. </b>Claimant produced a mixture by mixing biodiesel with diesel fuel. The biodiesel used to produce the mixture met ASTM D6751 and met EPA’s
				registration requirements for fuels and fuel additives. The mixture was sold by the claimant to any person for use as a fuel or was used as a fuel by the claimant. Claimant
				has attached the Certificate for Biodiesel and, if applicable, the Statement of Biodiesel Reseller. <b>Renewable diesel mixtures. </b>Claimant produced a mixture by mixing
				renewable diesel with liquid fuel (other than renewable diesel). The renewable diesel used to produce the renewable diesel mixture was derived from biomass, met EPA’s
				registration requirements for fuels and fuel additives, and met ASTM D975, D396, or other equivalent standard approved by the IRS. The mixture was sold by the claimant
				to any person for use as a fuel or was used as a fuel by the claimant. Claimant has attached the Certificate for Biodiesel and, if applicable, Statement of Biodiesel Reseller,
				both of which have been edited as discussed in the instructions for line 2. See the instructions for line 2 for information about renewable diesel used in aviation.         
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr"/>
                </xsl:call-template>    
              </div>
            </div>
      
            <!--Line 2 Table-->
            <table style="font-size:7pt;border-collapse:collapse;">
              <tbody>
              
                <tr>
                  <th scope="col" style="width:90mm;font-weight:normal;" colspan="2" align="left"/>
                  <th scope="col" style="width:10mm;border-left:1px black solid;border-bottom:1px black solid;">(a)<br/> Rate<br/><br/></th>
                  <th scope="col" style="width:31mm;border-left:1px black solid;border-bottom:1px black solid;">(b)<br/> Gallons of biodiesel <br/>or renewable diesel</th>
                  <th scope="col" style="width:45mm;border-left:1px black solid;border-bottom:1px black solid;">(c) Amount of claim<br/>
                    <span style="font-weight:bold;">Multiply col.</span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;"> (a) </span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;">by col.</span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;"> (b).</span><br/><br/>
                  </th>
                  <th scope="col" style="width:10mm;border-left:1px black solid;border-bottom:1px black solid;">(d)<br/> CRN<br/><br/></th>
                </tr>
      
                <!--Line 2a-->
                <tr>
                  <td style="width:6mm;text-align:center;font-weight:bold">a</td>
                  <td style="width:84mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">Biodiesel (other than agri-biodiesel) mixtures</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:.5mm;">$</span>
                    <span style="text-align:right;padding-left:.5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/BiodieselMixtures/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/BiodieselMixtures/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;">$</span>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/BiodieselMixtures/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/BiodieselMixtures/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--Line 2b-->
                <tr>
                  <td style="text-align:center;font-weight:bold;">b</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Agri-biodiesel mixtures</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;padding-left:2mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/AgriBiodieselMixtures/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/AgriBiodieselMixtures/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/AgriBiodieselMixtures/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/AgriBiodieselMixtures/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--Line 2c-->
                <tr>
                  <td style="text-align:center;font-weight:bold;border-bottom:1px black solid;">c</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Renewable diesel mixtures</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;padding-left:2mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/RenewableDieselMixtures/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/RenewableDieselMixtures/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/RenewableDieselMixtures/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/BiodieselOrRnwblDslMixtureCr/RenewableDieselMixtures/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
              </tbody>
            </table>
    
            <!--Line 3 -->	
            <div class="styBB" style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;width:6mm;">3</div>
              <div class="styLNDesc" style="width:100mm;height:4mm;">
                <span class="styBoldText">Alternative Fuel Credit</span>
              </div>
            </div>
            
            <!--
            <div style="border-bottom:1px black solid;width:187mm;">
              <div class="styLNLeftNumBox" style="height:5mm;width:8mm;"></div>
              <div class="styLNDesc" style="width:179mm;height:5mm;text-align:justify;padding-top:1.5mm;padding-bottom:1.5mm;">
 
              </div>
            </div>
            -->
            
            <!--Line 3 Table-->
            <table style="font-size:7pt;border-collapse:collapse;">
              <tbody>
              
                <tr>
                  <th scope="col" style="width:6mm;font-weight:normal;" align="left"><span style="width:1px;"/></th>
                  <th scope="col" style="width:84mm;font-weight:normal;" align="left"><span style="width:1px;"/></th>
                  <th scope="col" style="width:10mm;border-left:1px black solid;border-bottom:1px black solid;">(a)<br/> Rate<br/><br/></th>
                  <th scope="col" style="width:31mm;border-left:1px black solid;border-bottom:1px black solid;">(b)<br/> Gallons, or<br/>
                    <span class="styText" style="font-size:6pt;font-weight:bold">gasoline or diesel</span><br/>
                    <span class="styText" style="font-size:6pt;font-weight:bold">gallon equivalents</span>
                  </th>
                  <th scope="col" style="width:45mm;border-left:1px black solid;border-bottom:1px black solid;">(c) Amount of claim<br/>
                    <span style="font-weight:bold;">Multiply col.</span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;"> (a) </span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;">by col.</span><span style="width:0.5mm;"/>
                    <span style="font-weight:bold;"> (b).</span><br/><br/>
                  </th>
                  <th scope="col" style="width:10mm;border-left:1px black solid;border-bottom:1px black solid;">(d)<br/> CRN<br/><br/></th>
                </tr>
                
                 <!--Line 3a-->
                <tr>
                  <td style="text-align:center;font-weight:bold">a</td>
                  <td style="text-align:left;border-bottom:1px black solid;border-top:1px black solid;">Liquefied petroleum gas (LPG)</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;padding-top:">$<span style="width:1mm;"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedPetroleumGas/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedPetroleumGas/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;">$</span>
                    <span style="width:36.9mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedPetroleumGas/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedPetroleumGas/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
        
                <!--Line 3b-->
                <tr>
                  <td style="text-align:center;font-weight:bold;">b</td>
                  <td style="text-align:left;border-bottom:1px black solid;">"P" Series fuels</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;padding-left:2.75mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/PSeriesFuels/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/PSeriesFuels/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/PSeriesFuels/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/PSeriesFuels/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
      
                <!--Line 3c-->
                <tr>
                  <td style="text-align:center;font-weight:bold;">c</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Compressed natural gas (CNG)</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedNaturalGas/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedNaturalGas/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedNaturalGas/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedNaturalGas/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
    
                <!--Line 3d-->
                <tr>
                  <td style="text-align:center;font-weight:bold">d</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Liquefied hydrogen</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedHydrogen/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedHydrogen/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedHydrogen/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td> 
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedHydrogen/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
    
                <!--Line 3e-->
                <tr>
                  <td style="text-align:center;font-weight:bold;">e</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Fischer-Tropsch process liquid fuel  from coal (including peat) </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromCoal/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromCoal/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromCoal/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromCoal/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
    
                <!--Line 3f-->
                <tr>
                  <td style="text-align:center;font-weight:bold;">f</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Liquid fuel derived from biomass</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromBiomass/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromBiomass/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromBiomass/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquidFuelFromBiomass/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
    
                <!--Line 3g-->
                <tr>
                  <td style=";text-align:center;font-weight:bold;border-bottom:0px black solid;">g</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Liquefied natural gas (LNG)</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedNaturalGas/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedNaturalGas/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedNaturalGas/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedNaturalGas/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
        
                <!--Line 3h-->
                <tr>
                  <td style="text-align:center;font-weight:bold;border-bottom:0px black solid;">h</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Liquefied gas derived from biomass</td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedGasFromBiomass/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedGasFromBiomass/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedGasFromBiomass/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/LiquefiedGasFromBiomass/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
        
                <!--Line 3i-->
                <tr>
                  <td style="text-align:center;font-weight:bold;border-bottom:1px black solid;">i</td>
                  <td style="text-align:left;border-bottom:1px black solid;">Compressed gas derived from biomass </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:1.75mm;clear:none"/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedGasFromBiomass/Rt"/>
                    </xsl:call-template>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedGasFromBiomass/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedGasFromBiomass/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/AlternativeFuelCredit/CompressedGasFromBiomass/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
    
              </tbody>
            </table>
          </div>
          
          <div style="width:187mm">
            <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;">For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.</span>
            <span style="width:6mm;"/>
            <span style="width:18mm;font-weight:normal;font-size:6pt;"> Cat. No. 27451F</span>
            <span style="width:6mm;"/>
            <span style="text-align:right;width:32mm;font-weight:bold;font-size:6pt;">Schedule 3 (Form 8849)</span><span style="font-weight:normal;font-size:6pt;"> (Rev. 2-2020)</span>
          </div>
          <div class="pageEnd"/>
     
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">Additional Data </div>
            <div class="styLeftOverButtonContainer">
            
              <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
              
            </div>
          </div>
    
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>