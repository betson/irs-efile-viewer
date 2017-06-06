<?xml version="1.0" encoding="UTF-8"?>
<!-- 03/31/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 08/20/2015 - Changes made for defect 42829 - Jeremy Nichols -->
<!-- 08/28/2015 - Changes made for defect 42830 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate_ETEC.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8849Schedule2Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8849Schedule2"/>
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
        <meta name="Description" content="IRS Form 8849Schedule2"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <style type="text/css">
           <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="IRS8849Schedule2Style"/>
          <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8849Schedule2">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom:1px black solid;">
            <div class="styFNBox" style="width:31mm;height:17.5mm;border-right:1px black solid;">
              <span class="styFormNumber" style="font-size:10pt">Schedule 2</span>
              <br/>
              <span class="styFormNumber" style="font-size:10pt">(Form 8849)</span>
              <br/>
              <span class="styAgency">(Rev. January 2009)</span><br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="width:125mm;height:17.5mm;padding-top:3mm;border-right:0px black solid;">
              <div class="styMainTitle" style="height:8mm;padding-top:3mm;">Sales by Registered Ultimate Vendors</div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;padding-top:2mm;">
                <span style="text-align:center;font-weight:normal">
                  <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/> 
            Attach to Form 8849. <span class="styBoldText">Do not </span> file with any other schedule.
            </span>
              </div>
            </div>
            <div class="styTYBox" style="width:31mm;height:17.5mm;padding-top:8mm;text-align:center;">
        OMB No. 1545-1420
        </div>
          </div>
          <!--  Name / Employer identification number / Total Refund  -->
          <div style="width:187mm">
            <table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
              <tr>
                <td class="styNameBox" style="width:100mm;font-size:7pt;font-weight:normal; height:10.5mm">Name as shown on Form 8849
					<br/>
                  <div style="padding-top:1mm">
                    <span style="font-size:6.373pt;">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                      </xsl:call-template>
                    </span>
                      <br/>
                    <span style="font-size:6.373pt;">
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                        <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </div>
                </td>
                <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;width:40mm;font-weight:normal; height:10.5mm;">EIN<br/>
                  <div style="padding-top:4mm">
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
                <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal;height:10.5mm; border-right-width:0px">Total refund (see instructions)
					<br/><br/>
                  <div style="padding-top:1mm">$
					<span style="width:40mm;text-align:right;clear:none;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/TotalRefundAmt"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </td>
              </tr>
            </table>
          </div>
          <!--  end Name / Employer identification number / Total Refund  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;width:8mm;"/>
            <div class="styLNDesc" style="width:179mm;height:4.5mm;">
              <span class="styBoldText">Period of claim: </span>
              <span class="styItalicText">Enter month, day, and year</span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;width:8mm;"/>
            <div class="styLNLeftNumBox" style="height:4.5mm;width:22mm;"/>
            <div class="styLNDesc" style="width:157mm;height:4.5mm;">
              <span class="styItalicText"> in MMDDYYYY format.</span>
              <span style="width:120px;clear:none"/>
              <span class="styBoldText">From  <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>
              </span>
              <span style="width:2px;clear:none"/>
              <span style="width:32mm;text-align:left;clear:none">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodBeginDt"/>
                </xsl:call-template>
              </span>
              <span style="width:40px;clear:none"/>
              <span class="styBoldText">To <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>
              </span>
              <span style="width:2px;clear:none"/>
              <span style="width:32mm;text-align:left;clear:none;display:inline;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/ClaimPeriodEndDt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Claimant's reg num -->
			<table style="height:auto;width:187mm;">
				<tbody>
					<tr>
						<td style="height:8mm;width:47mm;text-align:right;">
							<div class="styLNDesc" style="width:47mm;font-size:7pt;">
								<b>Claimant's registration no.</b>	
								<span style="width:2mm"></span>
								<img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>	
							</div>					
						</td>
						<td style="height:8mm;width:60mm;">
							<div class="styLNDesc" style="width:60mm;font-size:7pt;">
							  <span style="width:3mm"/>
							  <span style="width:5mm;font-weight:bold;text-align:right;">U V</span>
							  <span style="width:0.5mm"/>
							  <span style="width:48.5mm;text-align:left;border-bottom:1px black solid;">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$FormData/UVClaimantRegistrationNum"/>
								</xsl:call-template>
							  </span>
							</div>				
						</td>
						<td style="height:8mm;width:80mm;">
							<div class="styLNDesc" style="width:80mm;font-size:7pt;padding-left:2mm;">
								<span style="width:76mm; font-style:italic">
								  Complete for lines 1a, 2a, 4a, 4b, 5a, and 5b. Also<br/> 
								  complete for lines 3d and 3e, type of use 14. <b>Note:</b> UV
								  claimant must complete line 6 or 7 on page 3.
								</span>
							</div>				
						</td>
					</tr>
					<tr>
						<td style="height:8mm;width:47mm;text-align:right;">
							<div class="styLNDesc" style="width:47mm;font-size:7pt;">
								<img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>	
							</div>					
						</td>
						<td style="height:8mm;width:60mm;">
							<div class="styLNDesc" style="width:60mm;font-size:7pt;">
							  <span style="width:3mm"/>
							  <span style="width:5mm;font-weight:bold;text-align:right;">U B</span>
							  <span style="width:0.5mm"/>
							  <span style="width:48.5mm;text-align:left;border-bottom:1px black solid;">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$FormData/UBClaimantRegistrationNum"/>
								</xsl:call-template>
							  </span>
							</div>				
						</td>
						<td style="height:8mm;width:80mm;">
							<div class="styLNDesc" style="width:80mm;font-size:7pt;padding-left:2mm;">
								<span style="width:76mm; font-style:italic">
								  Complete for lines 1b and 2c.
								</span>
							</div>				
						</td>
					</tr>
					<tr>
						<td style="height:8mm;width:47mm;text-align:right;">
							<div class="styLNDesc" style="width:47mm;font-size:7pt;padding-top:1mm;">
								<img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>	
							</div>					
						</td>
						<td style="height:8mm;width:60mm;">
							<div class="styLNDesc" style="width:60mm;font-size:7pt;padding-top:1mm;">
							  <span style="width:3mm"/>
							  <span style="width:5mm;font-weight:bold;text-align:right;">U P</span>
							  <span style="width:0.5mm"/>
							  <span style="width:48.5mm;text-align:left;border-bottom:1px black solid;">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$FormData/UPClaimantRegistrationNum"/>
								</xsl:call-template>
							  </span>
							</div>				
						</td>
						<td style="height:8mm;width:80mm;">
							<div class="styLNDesc" style="width:80mm;font-size:7pt;padding-left:2mm;padding-top:1mm;">
								<span style="width:76mm; font-style:italic">
								  Complete for line 2b.
								</span>
							</div>				
						</td>
					</tr>
					<tr>
						<td style="height:8mm;width:47mm;text-align:right;">
							<div class="styLNDesc" style="width:47mm;font-size:7pt;padding-top:2mm;">
								<img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>	
							</div>					
						</td>
						<td style="height:8mm;width:60mm;">
							<div class="styLNDesc" style="width:60mm;font-size:7pt;padding-top:2mm;">
							  <span style="width:3mm"/>
							  <span style="width:5mm;font-weight:bold;text-align:right;">U A</span>
							  <span style="width:0.5mm"/>
							  <span style="width:48.5mm;text-align:left;border-bottom:1px black solid;">
								<xsl:call-template name="PopulateText">
								  <xsl:with-param name="TargetNode" select="$FormData/UAClaimantRegistrationNum"/>
								</xsl:call-template>
							  </span>
							</div>				
						</td>
						<td style="height:8mm;width:80mm;">
							<div class="styLNDesc" style="width:80mm;font-size:7pt;padding-left:2mm;padding-top:2mm;">
								<span style="width:76mm; font-style:italic">
								  Complete for line 3. See <b>UV</b> for lines 3d and 3e, type of <br/>use 14.
								</span>
							</div>				
						</td>
					</tr>
				</tbody>
			</table><br/>
          
          <!-- Line 1-->
          <div class="styBB" style="width:187mm;border-top:1px black solid;">
            <div class="styLNLeftNumBox" style="height:10mm;text-align:left;padding-bottom:2mm;">
              <br/>1</div>
            <div class="styLNDesc" style="width:100mm;height:10mm;padding-bottom:2mm;">
              <span class="styBoldText">
                <br/>Sales by Registered Ultimate Vendors of Undyed Diesel Fuel</span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;">
            <div class="styLNLeftNumBox" style="height:16mm;width:8mm;"/>
            <div class="styLNDesc" style="width:170mm;height:16mm;text-align:justify;">
              <span class="styText" style="display:inline;">
    Claimant sold the diesel fuel at a tax-excluded price, repaid the amount of tax to the buyer, or obtained written consent of the buyer to make the claim. 
    </span>
              <span class="styText" style="font-weight:bold;display:inline;">For line 1a, </span>
              <span class="styText" style="display:inline;">claimant has obtained the required certificate from the buyer and has no reason to believe any information in the certificate is false. 
    </span>
              <span class="styText" style="font-weight:bold;display:inline;">For line 1b, </span>
              <span class="styText" style="display:inline;">the registered ultimate vendor is eligible to make this claim only if the buyer waives their right to make the claim by providing the registered ultimate vendor with an unexpired waiver and has no reason to believe any of the information in the waiver is false. See the instructions for additional information to be submitted. </span>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;width:8mm;"/>
              <div class="styLNDesc" style="width:179mm;height:4mm;">
                <span class="styText">Claimant certifies that the diesel fuel did not contain visible evidence of dye.</span>
              </div>
            </div>
            <div style="height:8mm;width:187mm;">
              <div class="styLNLeftNumBox" style="height:3mm;width:8mm;"/>
              <div class="styLNDesc" style="width:179mm;height:3mm;">
                <span class="styText" style="font-weight:bold;display:inline;">Exception. </span>
                <span style="width:3px;clear:none"/>
                <span class="styText" style="display:inline;">
      If any of the diesel fuel included in this claim</span>
                <span class="styText" style="font-weight:bold;display:inline;">
      did</span>
                <span class="styText" style="display:inline;">
      contain visible evidence of dye, attach an explanation and</span>
                <span style="width:22mm;clear:none"/>
                <span class="styText" style="text-align:bottom;display:inline;">check here</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <!--<span style="width:16px"></span>-->.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
			   <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
				 <span style="width:16px"/>.
			  <span style="width:16px"/>.
				 <span style="width:16px"/>.
				</span>
                <span style="width:1mm;clear:none"/>
                <span class="styBoldText">
                  <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>
                </span>
                <span style="width:4mm;clear:none"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
                    <xsl:with-param name="BackupName"/>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/UndyedDieselUseExceptionInd"/>
                    <xsl:with-param name="BackupName"/>
                  </xsl:call-template>
                </label>
              </div>
            </div>
          </div>
          <div style="height:7mm;width:187mm;">
            <div class="styLNLeftNumBox" style="height:3mm;width:8mm;"/>
            <div class="styLNDesc" style="width:170mm;height:3mm;text-align:justify;">
              <span class="styText" style="font-weight:bold;display:inline;">Caution. </span>
              <span style="width:3px;clear:none"/>
              <span class="styText" style="font-style:italic;display:inline;">
    Claims cannot be made on line 1a for diesel fuel purchased by a state or local government for its exclusive use with a 
    credit card issued to the state or local government by a credit card issuer.
    </span>
            </div>
          </div>
          <div style="width:187mm;">
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>
                  <th scope="col" style="width:8mm;height:8.0mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:58mm;height:8.0mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:22mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">
					  (a) Rate
				  </th>
                  <th scope="col" style="width:35mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">
					  (b) Gallons<br/>
                  </th>
                  <th scope="col" style="width:53mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">
					(c) Amount of refund<br/>
                    <span class="styItalicText" style="font-weight:normal;">Multiply col. </span>
                    <span class="styItalicText">(a) </span>
                    <span class="styItalicText" style="font-weight:normal">by col. </span>
                    <span class="styItalicText">(b)<br/>
                    </span>
                  </th>
                  <th style="width:10mm;height:8.0mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">(d)<br/>
					  CRN
				  </th>
                </tr>
                <tr>
                  <td style="height:9mm;width:6mm;text-align:center;font-weight=bold;">a</td>
                  <td style="height:9mm;text-align:left;border-bottom:1px black solid;">Use by a state or local government</td>
                  <td style="height:9mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:2.5mm;clear:none"/>$
        <span style="width:3.3mm;clear:none"/>
                    <span style="width:1.2mm;clear:none;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUsedByStateLocalGovt/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:4px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUsedByStateLocalGovt/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="height:6.5mm;width:2mm;text-align:bottom;padding-top:1.8mm;">$</span>
                    <span style="height:6.5mm;width:50mm;padding-top:1.8mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUsedByStateLocalGovt/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;">b</td>
                  <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;">Use in certain intercity and local buses</td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:3.3mm;clear:none"/>
                    <span style="height:6.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:1.5mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUseIntercityLocalBuses/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUseIntercityLocalBuses/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;padding-top:0.7mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUseIntercityLocalBuses/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedDieselFuel/FuelUseIntercityLocalBuses/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- Line 2 -->
          <div class="styBB" style="width:187mm;border-top:1px black;">
            <div class="styLNLeftNumBox" style="height:10mm;text-align:left;padding-bottom:2mm;">
              <br/>2</div>
            <div class="styLNDesc" style="width:150mm;height:10mm;padding-bottom:2mm;">
              <span class="styBoldText">
                <br/>Sales by Registered Ultimate Vendors of Undyed Kerosene (Other Than Kerosene For Use in Aviation)
    </span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;">
            <div class="styLNLeftNumBox" style="height:21mm;width:8mm;"/>
            <div class="styLNDesc" style="width:171mm;height:21mm;text-align:justify;">
              <span class="styText" style="display:inline;">Claimant sold the kerosene at a tax-excluded price, repaid the amount of tax to the buyer, or obtained written consent of the buyer to make the claim. 
    </span>
              <span class="styText" style="font-weight:bold;display:inline;">For line 2a, 
    </span>
              <span class="styText" style="display:inline;">claimant has obtained the required certificate from the buyer and has no reason to believe any information in the certificate is false. </span>
              <span class="styText" style="font-weight:bold;display:inline;">For line 2b, 
    </span>
              <span class="styText" style="display:inline;">claimant has a statement, if required, that contains the date of sale, name and address of the buyer, and the number of gallons of kerosene sold to the buyer. 
    </span>
              <span class="styText" style="font-weight:bold;display:inline;">For line 2c, </span>
              <span class="styText" style="display:inline;">the registered ultimate vendor is eligible to make this claim only if the buyer waives their right to make the claim by providing the registered ultimate vendor with an unexpired waiver and has no reason to believe any of the information in the waiver is false. See the instructions for additional information to be submitted.
    </span>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4mm;width:8mm;"/>
              <div class="styLNDesc" style="width:179mm;height:4mm;">
                <span class="styText">Claimant certifies that the kerosene did not contain visible evidence of dye.</span>
              </div>
            </div>
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:8mm;width:8mm;"/>
              <div class="styLNDesc" style="width:179mm;height:8mm;">
                <span class="styText" style="font-weight:bold;display:inline;">Exception. </span>
                <span style="width:3px;clear:none"/>
                <span class="styText" style="display:inline;">If any of the kerosene included in this claim </span>
                <span class="styText" style="font-weight:bold;display:inline;">did </span>
                <span class="styText" style="display:inline;">contain visible evidence of dye, attach an explanation and </span>
                <span style="width:23mm;clear:none"/>
                <span class="styText" style="text-align:bottom;display:inline;">check here</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/SlsUndyedKeroseneExceptionInd"/>
                </xsl:call-template>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:4px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
	 <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
        <span style="width:16px"/>.
      </span>
                <span style="width:1mm;clear:none"/>
                <span class="styBoldText">
                  <img src="{$ImagePath}/8849Schedule2_Bullet_Md.gif" alt="MediumBullet"/>
                </span>
                <span style="width:4mm;clear:none"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/SlsUndyedKeroseneExceptionInd"/>
                    <xsl:with-param name="BackupName"/>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/SlsUndyedKeroseneExceptionInd"/>
                    <xsl:with-param name="BackupName"/>
                  </xsl:call-template>
                </label>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;width:8mm;"/>
            <div class="styLNDesc" style="width:170mm;height:7.5mm;text-align:justify;">
              <span class="styText" style="font-weight:bold;display:inline;">Caution. </span>
              <span style="width:3px;clear:none"/>
              <span class="styText" style="font-style:italic;display:inline;">Claims cannot be made on line 2a for kerosene purchased by a state or local government for its exclusive use with a </span>
              <span class="styText" style="font-style:italic;display:inline;">credit card issued to the state or local government by a credit card issuer.
    </span>
            </div>
          </div>
          <div style="width:187mm;">
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>
                  <th scope="col" style="width:8mm;height:8mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:58mm;height:8mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:22mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">(a) Rate</th>
                  <th scope="col" style="width:35mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">(b) Gallons</th>
                  <th scope="col" style="width:53mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">(c) Amount of refund<br/>
                    <span class="styItalicText" style="font-weight:normal;">Multiply col. </span>
                    <span class="styItalicText">(a) </span>
                    <span class="styItalicText" style="font-weight:normal">by col. </span>
                    <span class="styItalicText">(b) <br/>
                    </span>
                  </th>
                  <th scope="col" style="width:10mm;height:8mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">(d)<br/> CRN</th>
                </tr>
                <tr>
                  <td style="height:9mm;width:6mm;text-align:center;font-weight=bold;">a</td>
                  <td style="height:9mm;text-align:left;border-bottom:1px black solid;">Use by a state or local government</td>
                  <td style="height:9mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:2.5mm;clear:none"/>$
          <span style="width:3.3mm;clear:none"/>
                    <span style="width:1.2mm;clear:none">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:4px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="height:6.5mm;width:2mm;text-align:bottom;padding-top:1.8mm;">$</span>
                    <span style="height:6.5mm;width:50mm;padding-top:1.8mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td rowspan="2" style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUsedByStateLocalGovt/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;">b</td>
                  <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;">Sales from a blocked pump</td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:3.3mm;clear:none"/>
                    <span style="height:6.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-bottom:2.6mm;text-align:center">
                      <span style="width:3mm;clear:none"/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelSalesFromBlockedPump/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelSalesFromBlockedPump/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;padding-top:0.7mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelSalesFromBlockedPump/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;">c</td>
                  <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;">Use in certain intercity and local buses</td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="width:3.3mm;clear:none"/>
                    <span style="height:6.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:1.5mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUseIntercityLocalBuses/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUseIntercityLocalBuses/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:37mm;padding-top:0.7mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUseIntercityLocalBuses/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/VendorSalesUndyedKeroseneFuel/FuelUseIntercityLocalBuses/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- Footer of first page -->
          <div style="width:187mm;border-top:0px black solid;">
            <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;"> 
				For Privacy Act and Paperwork Reduction Act Notice, see Form 8849 instructions.
			  </span>
            <span style="width:5mm;"/>
            <span style="width:18mm;font-weight:normal;font-size:6pt;">
				Cat. No. 27450U
			  </span>
            <span style="width:5mm;"/>
            <span style="text-align:right;width:30mm;font-weight:bold;font-size:6pt;display:inline;">Schedule 2 (Form 8849)</span>
            <span style="text-align:right;width:21mm;padding-left:2mm;font-weight:normal;font-size:6pt;">(Rev. 1-2009)</span>
          </div>
          <div class="pageEnd" />
          
          <!-- Header page 2 -->
          <div style="width:187mm;border-bottom:1px black solid;">
            <span style="width:174mm;font-weight:normal;text-align:left;font-size:7pt;display:inline;"> 
				Schedule 2 (Form 8849) (Rev. 1-2009)
			  </span>
            <span style="width:127mm;"/>
            <span style="text-align:right;width:13mm;font-weight:normal;font-size:7pt;display:inline;">Page </span>
            <span style="text-align:right;width:1mm;font-weight:bold;font-size:7pt;display:inline;">2</span>
          </div>
          <!--  Name / Employer identification number -->
          <div style="width:187mm;border-bottom:0px black solid;">
            <table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
              <tr>
                <td class="styNameBox" style="width:143mm;font-size:7pt;font-weight:normal; height:10mm">
        Name as shown on Form 8849<br/>
                  <span style="font-size:6.373pt;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                  </span>
                    <br/>
                  <span style="font-size:6.373pt;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </td>
                <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal; height:10mm; border-right-width:0px">EIN<br/><br/>
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
                </td>
              </tr>
            </table>
          </div>
          <!--  end Name / Employer identification number -->
          <!-- Line 3 Sales-->
          <div class="styBB" style="width:187mm;border-top:1px black;height:4mm;">
            <div class="styLNLeftNumBox" style="text-align:left;">3</div>
            <div class="styLNDesc" style="width:150mm;">
              <span class="styBoldText" style="text-align:left;padding-right:8mm;padding-top:0mm">Sales by Registered Ultimate Vendors of Kerosene for Use in Aviation
			</span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;">
            <div class="styLNLeftNumBox" style="height:20mm;width:8mm;"/>
            <div class="styLNDesc" style="width:170mm;height:20mm;text-align:justify;">
              <span class="styText" style="display:inline;">
				  Claimant sold the kerosene for use in aviation at a tax-excluded price and has not collected the amount of tax from the buyer, repaid the amount of tax to the buyer, or has obtained written consent of the buyer to make the claim.
				</span>
              <span class="styText" style="font-weight:bold;display:inline;">For lines 3a, 3b, 3d, 3e, and 3f, </span>
              <span class="styText" style="display:inline;">the registered ultimate vendor is eligible to make this claim only if the buyer waives their right to make the claim by providing the registered ultimate vendor with an unexpired waiver and has no reason to believe any of the information in the waiver is false. </span>
              <span class="styText" style="font-weight:bold;display:inline;">
				  For line 3c, 
				</span>
              <span class="styText" style="display:inline;">claimant has obtained the required certificate from the buyer and has no reason to believe any of the information in the certificate is false. See the instructions for additional information to be submitted. </span>
              <span class="styText" style="font-weight:bold;"/>
              <span class="styText"/>
            </div>
          </div>
          <div style="width:187mm;">
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>
                  <th scope="col" style="width:8mm;height:6.5mm;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:70mm;height:6.5mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:13mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-aligh:right;border-top:1px black solid;" valign="top">
					  Type of <br/>use
				  </th>
                  <th scope="col" style="width:15mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">
					  (a) <br/>Rate
		  		  </th>
                  <th scope="col" style="width:32mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">
					  (b) <br/>Gallons
				  </th>
                  <th scope="col" style="width:36mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" valign="top">
					(c) <br/>Amount of refund<br/>
                    <span class="styItalicText" style="font-weight:normal;">Multiply col.	</span>
                    <span class="styItalicText">(a)<br/>
                    </span>
                    <span class="styItalicText" style="font-weight:normal">by col. </span>
                    <span class="styItalicText">(b)<br/>
                    </span>
                  </th>
                  <th scope="col" style="width:8mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;padding-bottom:2mm;border-top:1px black solid;">
				    (d)<br/> CRN<br/>
                  </th>
                </tr>
                <!-- line 3a -->
                <tr>
                  <td style="height:6.5mm;width:6mm;text-align:center;font-weight=bold;padding-bottom:3.2mm;">a</td>
                  <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use in commercial aviation (other than foreign trade) <br/> taxed at $.219
        </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
                    <span style="width:2.5mm;clear:none"/>
                    <span style="width:1.2mm;clear:none"/>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:1.5mm;">
                    <span style="width:0.5mm;clear:none;"/>$
          <span style="width:2mm;clear:none;"/>
                    <span style="width:8mm;clear:none;padding-top:2mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:4mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:7px;clear:none;"> $ </span>
                    <span style="height:6.5mm;width:32mm;padding-top:3.8mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:3mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt219/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- line 3b -->
                <tr>
                  <td style="height:4.5mm;width:6mm;text-align:center;font-weight=bold;padding-bottom:3mm;">b</td>
                  <td style="height:4.5mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use in commercial aviation (other than foreign trade)<br/> taxed at $.244
        </td>
                  <td style="height:4.5mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
                    <span style="width:2.5mm;clear:none"/>
                    <span style="width:1.2mm;clear:none"/>
                  </td>
                  <td style="height:4.5mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:1mm;">
                    <span style="height:4.5mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:2.5mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:4.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:3.5mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:4.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:30mm;padding-top:3.3mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:4.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;padding-top:3.5mm">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/CommercialAviationTaxedAt244/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- line 3c -->
                <tr>
                  <td style="height:3mm;width:6mm;text-align:center;font-weight=bold;">c</td>
                  <td style="height:3mm;text-align:left;border-bottom:1px black solid;">Nonexempt use in noncommercial aviation</td>
                  <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
                    <span style="width:2.5mm;clear:none"/>
                    <span style="width:1.2mm;clear:none"/>
                  </td>
                  <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/NonexemptFuelUseCommercialAvn/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/NonexemptFuelUseCommercialAvn/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="height:3mm;width:0.5m;text-align:bottom;text-aligh:left;padding-top:0mm;"/>
                    <span style="width:34mm;paddng-top:0mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/NonexemptFuelUseCommercialAvn/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/NonexemptFuelUseCommercialAvn/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- line 3d -->
                <xsl:for-each select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt244">
                  <tr>
                    <td style=" height:3mm;width:6mm;text-align:center;font-weight=bold;">d</td>
                    <td style=" height:3mm;text-align:left;border-bottom:1px black solid;">Other nontaxable uses taxed at $.244</td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                      </xsl:call-template>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
                      <span style=" height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0.5mm;text-align:center">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rt"/>
                        </xsl:call-template>
                      </span>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GallonsQty"/>
                      </xsl:call-template>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amt"/>
                        </xsl:call-template>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
                <!-- line 3e -->
                <xsl:for-each select="$FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219">
                  <tr>
                    <xsl:choose>
                      <xsl:when test="position() = count($FormData/KeroseneUsedInAviation/OtherNontaxableUsesTaxedAt219)">
                        <td style=" height:3mm;width:6mm;text-align:center;font-weight:bold;">e</td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td style=" height:3mm;width:6mm;text-align:center;font-weight:bold;border-bottom:0px black solid;">e</td>
                      </xsl:otherwise>
                    </xsl:choose>
                    <td style=" height:3mm;text-align:left;border-bottom:1px black solid;">Other nontaxable uses taxed at $.219</td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="NontaxableUseOfFuelTypeCd"/>
                      </xsl:call-template>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
                      <span style=" height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0.5mm;text-align:center">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Rt"/>
                        </xsl:call-template>
                      </span>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GallonsQty"/>
                      </xsl:call-template>
                    </td>
                    <td style=" height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amt"/>
                        </xsl:call-template>
                    </td>
                    <td style=" height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CreditReferenceNum"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
                <!-- Line 3f was added per RIS ETA0801388OTH  - Schema ver 2008v2.0 -  PDF dated 2/29/2008 was used 4/9/08  SKM-->
                <tr>
                  <td style="height:3mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;">f</td>
                  <td style="height:3mm;text-align:left;border-bottom:1px black solid;">LUST tax on aviation fuels used in foreign trade</td>
                  <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;background-color:gray;">
                    <span style="width:2.5mm;clear:none"/>
                    <span style="width:1.2mm;clear:none"/>
                  </td>
                  <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;">
                    <span style="height:3mm;width:6mm;clear:none;padding-left:5.2mm;padding-top:0mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:3mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="height:3mm;width:0.5m;text-align:bottom;text-aligh:left;padding-top:0mm;"/>
                    <span style="width:34mm;paddng-top:0mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:3mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/KeroseneUsedInAviation/LUSTTaxAviationUseForeignTrade/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--new section 4 Sales-->
          <div class="styBB" style="width:187mm;border-top:1px black;height:4mm;">
            <div class="styLNLeftNumBox" style="text-align:left;">4</div>
            <div class="styLNDesc" style="width:150mm;">
              <span class="styBoldText" style="text-align:left;padding-right:8mm;padding-top:0mm">
      Sales by Registered Ultimate Vendors of Gasoline
    </span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;">
            <div class="styLNLeftNumBox" style="height:12mm;width:8mm;"/>
            <div class="styLNDesc" style="width:170mm;height:12mm;text-align:justify;">
              <span class="styText">
      Claimant sold the gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid the 
      amount of tax to the buyer, or has obtained written consent of the buyer to make the claim; and obtained an unexpired 
      certificate from the buyer and has no reason to believe any information in the certificate is false. See the instructions for
      additional information to be submitted.
    </span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:10mm;width:8mm;"/>
            <div class="styLNDesc" style="width:170mm;height:10mm;text-align:justify;">
              <span class="styText" style="font-weight:bold;display:inline;">
      Caution. 
    </span>
              <span class="styText" style="font-style:italic;display:inline;">
      Claims cannot be made on line 4a or 4b for gasoline purchased by a state or local government or a nonprofit 
      educational organization for its exclusive use with a credit card issued to the state or local government or nonprofit 
      educational organization by the credit card issuer.
    </span>
              <span style="width:9mm;clear:none;"/>
            </div>
          </div>
          <!--new 4 sales table-->
          <div style="width:187mm;">
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>
                  <th scope="col" style="width:8mm;height:6.5mm;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:95mm;height:6.5mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:15mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;">(a) Rate<br/>
                    <br/>
                  </th>
                  <th scope="col" style="width:20mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;">(b) Gallons<br/>
                    <br/>
                  </th>
                  <th scope="col" style="width:49mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;">
					  (c) Amount of refund<br/>
					  <span class="styItalicText" style="font-weight:normal;">
						  Multiply col.
					  </span>
                    <span class="styItalicText">
						(a)
				    </span>
                    <span class="styItalicText" style="font-weight:normal">
						by col.
				    </span>
                    <span class="styItalicText">
						(b)
				    </span>
                  </th>
                  <th scope="col" style="width:10mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:2mm;">
					  (d)<br/> CRN<br/>
                  </th>
                </tr>
                <tr>
                  <td style="height:8mm;width:8mm;text-align:center;font-weight=bold;" valign="bottom">a</td>
                  <td style="height:8mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use by a nonprofit educational organization
        </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
                    <span style="width:0.5mm;clear:none;"/>$
          <span style="width:2mm;clear:none;"/>
                    <span style="width:1.2mm;clear:none;padding-top:2mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:2.8mm;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
                    <span style="width:.5mm;text-align:bottom;text-aligh:left;">$</span>
                    <span style="width:46.5mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td rowspan="2" style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUseNonprofitEducationalOrg/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td style="height:6.5mm;width:8mm;text-align:center;font-weight=bold;border-bottom:1px black solid;" valign="bottom">b</td>
                  <td style="height:6.5mm;text-align:left;border-bottom:1px black solid;" valign="bottom">Use by a state or local government</td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
                    <span style="width:0.5mm;clear:none;"/>
                    <span style="width:2.5mm;clear:none;"/>
                    <span style="width:1.2mm;clear:none;padding-top:2mm;padding-left:0.5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUsedByStateLocalGovt/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:6.5mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUsedByStateLocalGovt/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
                    <span style="width:.5mm;text-align:bottom;text-aligh:left;"/>
                    <span style="width:46.5mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfGasoline/FuelUsedByStateLocalGovt/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--new section 5 sales -->
          <div class="styBB" style="width:187mm;border-top:1px black;height:4mm;">
            <div class="styLNLeftNumBox" style="text-align:left;">5</div>
            <div class="styLNDesc" style="width:150mm;">
              <span class="styBoldText" style="text-align:left;padding-right:8mm;padding-top:0mm">Sales by Registered Ultimate Vendors of Aviation Gasoline
    </span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;">
            <div class="styLNLeftNumBox" style="height:12mm;width:8mm;"/>
            <div class="styLNDesc" style="width:171mm;height:12mm;text-align:justify;">
              <span class="styText">
      Claimant sold the aviation gasoline at a tax-excluded price and has not collected the amount of tax from the buyer, repaid 
      the amount of tax to the buyer, or has obtained written consent of the buyer to make the claim; and obtained an unexpired 
      certificate from the buyer and has no reason to believe any information in the certificate is false. See the instructions for 
      additional information to be submitted.
    </span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:10mm;width:8mm;"/>
            <div class="styLNDesc" style="width:171mm;height:10mm;text-align:justify;">
              <span class="styText" style="font-weight:bold;display:inline;">
      Caution. 
    </span>
              <span style="width:3px;clear:none"/>
              <span class="styText" style="font-style:italic;display:inline;">
      Claims cannot be made on line 5a or 5b for aviation gasoline purchased by a state or local government or a nonprofit 
      educational organization for its exclusive use with a credit card issued to the state or local government or nonprofit 
      educational organization by the credit card issuer.
    </span>
              <span style="width:18mm;clear:none;"/>
            </div>
          </div>
          <!--new 5 sales table-->
          <div style="width:187mm;border-bottom:0px black solid;">
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>
                  <th scope="col" style="width:8mm;height:6.5mm;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:95mm;height:6.5mm;border-top:1px black solid;">
                    <span style="width:1px;"/>
                  </th>
                  <th scope="col" style="width:15mm;height:6.5mm;border-left:1px black solid;border-top:1px black solid;border-bottom:1px black solid;">(a) Rate<br/>
                    <br/>
                  </th>
                  <th scope="col" style="width:20mm;height:6.5mm;border-left:1px black solid;border-top:1px black solid;border-bottom:1px black solid;">(b) Gallons<br/>
                    <br/>
                  </th>
                  <th scope="col" style="width:49mm;height:6.5mm;border-left:1px black solid;border-top:1px black solid;border-bottom:1px black solid;">
					  (c) Amount of refund<br/>
                    <span class="styItalicText" style="font-weight:normal;">Multiply col. </span>
                    <span class="styItalicText">(a) </span>
                    <span class="styItalicText" style="font-weight:normal">by col. </span>
                    <span class="styItalicText">(b) </span>
                  </th>
                  <th scope="col" style="width:10mm;height:6.5mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:2mm;">
					  (d)<br/> CRN<br/>
                  </th>
                </tr>
                <tr>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;" valign="bottom">a</td>
                  <td style="height:8mm;text-align:left;border-bottom:1px black solid;" valign="bottom">Use by a nonprofit educational organization</td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
                    <span style="width:0.5mm;clear:none;"/>$
          <span style="width:2mm;clear:none;"/>
                    <span style="width:1.2mm;clear:none;padding-top:2mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;           padding-top:2.8mm;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
                    <span style="height:6mm;width:.5mm;text-align:bottom;test-aligh:left;padding-top:2.8mm;">$</span>
                    <span style="height:6mm;width:46.5mm;padding-top:2.8mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td rowspan="2" style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUseNonprofitEducationalOrg/CreditReferenceNum"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <tr>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;" valign="bottom">b</td>
                  <td style="height:8mm;text-align:left;border-bottom:1px black solid;" valign="bottom">
          Use by a state or local government
        </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;" valign="bottom">
                    <span style="width:6mm;clear:none;padding-left:5.2mm;text-align:center">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUsedByStateLocalGovt/Rt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;           text-align:right;padding-top:2mm;" valign="bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUsedByStateLocalGovt/GallonsQty"/>
                    </xsl:call-template>
                  </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;" valign="bottom">
                    <span style="width:2mm;text-align:left;"/>
                    <span style="width:45mm;padding-top:1.7mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/SalesOfAviationGasoline/FuelUsedByStateLocalGovt/Amt"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!--footnote-->
          <div style="width:187mm;border-top-width:0px;">
            <span style="width:140mm;font-weight:bold;text-align:left;font-size:6pt;border-top-width:0px;"/>
            <span style="text-align:right;width:30mm;font-weight:bold;font-size:6pt;display:inline;">
    Schedule 2 (Form 8849)
  </span>
            <span style="text-align:right;width:20mm;font-weight:normal;font-size:6pt;display:inline;">(Rev. 1-2009)</span>
          </div>
          <div class="pageEnd" />
          
          <!-- Header page 2 -->
          <div style="width:187mm;border-bottom:1px black solid;">
            <span style="width:140mm;font-weight:normal;text-align:left;font-size:7pt;display:inline;"> 
				Schedule 2 (Form 8849) (Rev. 1-2009)
			  </span>
			  <span style="width:127mm;"/>
            <span style="text-align:right;width:30mm;font-weight:normal;font-size:7pt;display:inline;">Page </span>
            <span style="text-align:right;width:1mm;font-weight:bold;font-size:7pt;display:inline;">3</span>
          </div>
          <!--  Name / Employer identification number -->
          <div style="width:187mm">
            <table cellspacing="0" style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px; border-left-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
              <tr>
                <td class="styNameBox" style="width:143mm;font-size:7pt;font-weight:normal; height:10mm">Name as shown on Form 8849<br/>
                  <span style="font-size:6.373pt;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                  </span>
                    <br/>
				  <span style="font-size:6.373pt;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </td>
                <td valign="top" class="styNameBox" style="padding-left:2mm;font-size:7pt;font-weight:normal; height:10mm; border-right-width:0px">EIN<br/><br/>
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
                </td>
              </tr>
            </table>
          </div>
          <!--  end Name / Employer identification number -->
          <!-- section 6 Government-->
          <div class="styBB" style="width:187mm;border-top:1px black;">
            <div class="styLNLeftNumBox" style="height:10mm;text-align:left">
              <br/>6</div>
            <div class="styLNDesc" style="width:150mm;height:10mm;">
              <span class="styBoldText">
                <br/>Government Unit Information</span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;border-bottom:1px black solid;">
            <div class="styLNLeftNumBox" style="height:7mm;width:8mm;"/>
            <div class="styLNDesc" style="width:175mm;height:7mm;">
    Complete if making a claim on lines 1a or 2a; or lines 3d and 3e for type of use 14. Enter the information below for <br/>
    each governmental unit to whom the fuel was sold. If more space is needed, attach additional sheets.
  </div>
          </div>
          <div class="styBB" style="height:auto;width:187mm;border-top:1px black;border-bottom:0px;">
            <div class="styTableContainer" style="height:auto;" id="PSOctn">
              <table style="height:auto;width:187mm;font-size:7pt;" cellpadding="0" cellspacing="0">
                <thead>
                  <tr>
                    <th scope="col" style="width:44mm;height:7.7mm;border-top-width:0px;border-left-width:0px;border-right-width:1px;border-bottom-width:1px;text-align:center;border-color:black;border-style:solid;">Taxpayer Identification No.
				    </th>
                    <th scope="col" style="width:99mm;height:7.7mm;border-left-width:1px;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align-center">Name
				    </th>
                    <th scope="col" style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:center;">Gallons
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:if test="(count($FormData/GovernmentUnitInformation) &lt; 12 or ($Print != $Separated))">
                    <xsl:for-each select="$FormData/GovernmentUnitInformation">
                      <tr>
                        <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="EIN"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:right;padding-left:7mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 1 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/GovernmentUnitInformation"/>
                        </xsl:call-template>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;               border:0 black solid;border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;               border:0 black solid;border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 2 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 3 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 4 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 5 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 6 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 7 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 8 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 9 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 10 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/GovernmentUnitInformation) &lt; 11 or (count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:0px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:0px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:0px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </tbody>
              </table>
            </div>
          </div>
          <!--new section 7-->
          <div class="styBB" style="width:187mm;border-top:0px black;">
            <div class="styLNLeftNumBox" style="height:9mm;text-align:left">
              <br/>7</div>
            <div class="styLNDesc" style="width:150mm;height:9mm;">
              <span class="styBoldText">
                <br/>Nonprofit Educational Organization and Government Unit Information</span>
            </div>
          </div>
          <div style="width:187mm;font-size:7pt;border-bottom:1px black solid;">
            <div class="styLNLeftNumBox" style="height:7mm;width:8mm;"/>
            <div class="styLNDesc" style="width:175mm;height:7mm;">
    Complete if making a claim on lines 4a, 4b, 5a, or 5b. Enter the information below for each nonprofit educational organization
    <br/> or governmental unit to whom the gasoline or aviation gasoline was sold. If more space is needed, attach additional 
    sheets.
  </div>
            <!-- button display logic -->
            <div style="float:right">
              <br/>
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$FormData/NonprofitEducationalOrgGovtGrp"/>
                <xsl:with-param name="containerHeight" select="11"/>
                <xsl:with-param name="containerID" select=" 'PSOctn2' "/>
              </xsl:call-template>
            </div>
            <!-- end button display logic -->
          </div>
          <div class="styBB" style="width:187mm;border-top:1px black;border-bottom:0px;">
            <div class="styTableContainer" style="height:auto;" id="PSOctn2">
              <xsl:call-template name="SetInitialState"/>
              <table style="height:auto;width:187mm;font-size:7pt;cellspacing:0;border-collapse:collapse;">
                <thead>
                  <tr>
                    <th scope="col" style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
						Taxpayer Identification No.
				    </th>
                    <th scope="col" style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align-center">
						Name
				    </th>
                    <th scope="col" style="width:42mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:center;">
						Gallons
				    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:if test="(count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 12 or ($Print != $Separated))">
                    <xsl:for-each select="$FormData/NonprofitEducationalOrgGovtGrp">
                      <tr>
                        <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="EIN"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
                          </xsl:call-template>
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                          </xsl:call-template>
                        </td>
                        <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:right;padding-left:7mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GallonsQty"/>
                          </xsl:call-template>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 1 or            ((count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11) and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/NonprofitEducationalOrgGovtGrp"/>
                        </xsl:call-template>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 2 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 3 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 4 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 5 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 6 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 7 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 8 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 9 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 10 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:1px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:1px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:1px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &lt; 11 or            (count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated))">
                    <tr>
                      <td style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;               border-bottom-width:0px;text-align:center;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-right-width:1px;border-bottom-width:0px;">
                        <span style="width:1px;"/>
                      </td>
                      <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;               border-bottom-width:0px;text-align:right;">
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </tbody>
              </table>
              <!-- Set Initial Height of Above Table -->
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$FormData/NonprofitEducationalOrgGovtGrp"/>
                <xsl:with-param name="containerHeight" select="11"/>
                <xsl:with-param name="containerID" select=" 'PSOctn2' "/>
              </xsl:call-template>
              <!-- End Set Initial Height of Above Table -->
            </div>
          </div>
          <div style="width:187mm">
            <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;"/>
            <span style="width:5mm;"/>
            <span style="width:18mm;font-weight:normal;font-size:6pt;"/>
            <span style="width:11mm;"/>
            <span style="text-align:right;width:30mm;font-weight:bold;font-size:6pt;display:inline;">Schedule 2 (Form 8849)</span>
            <span style="text-align:right;width:20mm;font-weight:normal;font-size:6pt;display:inline;">(Rev. 1-2009)</span>
          </div>
          <div class="pageEnd" />
          
          <!--header 6 -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
    Additional Data        
  </div>
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
          <!--print section 6-->
          <xsl:if test="count($FormData/GovernmentUnitInformation) &gt; 11 and ($Print = $Separated)">
            <div class="styLNDesc" style="width:187mm;height:4mm;">
              <span class="styText" style="font-weight:bold">
                <br/>IRS Form 8849 Schedule 2, Section 6, Government Unit Information
    </span>
            </div>
            <table class="styDepTbl" style="font-size:7pt;cellspacing:0;border-collapse:collapse;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
					  Taxpayer Identification No.
				  </th>
                  <th scope="col" class="styDepTblCell" style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align-center">
					  Name
				  </th>
                  <th scope="col" class="styDepTblCell" style="width:42mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:center;">
					  Gallons
				  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$FormData/GovernmentUnitInformation">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
                      <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                      </xsl:call-template>
                    </td>
                    <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:right;padding-left:7mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GallonsQty"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!--header 7-->
          <!--print section 7-->
          <xsl:if test="count($FormData/NonprofitEducationalOrgGovtGrp) &gt; 11 and ($Print = $Separated)">
            <br/>
            <span class="styRepeatingDataTitle">IRS Form 8849 Schedule 2, Section 7, Nonprofit Educational Organization and Government Unit Information </span>
            <table class="styDepTbl" style="font-size:7pt;cellspacing:0;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
					  Taxpayer Identification No.
				  </th>
                  <th scope="col" class="styDepTblCell" style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align-center">
					  Name
				  </th>
                  <th scope="col" class="styDepTblCell" style="width:42mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:center;">
					  Gallons
				  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$FormData/NonprofitEducationalOrgGovtGrp">
                  <xsl:variable name="pos" select="position()"/>
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:44mm;height:7.7mm;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:center;">
                      <xsl:call-template name="PopulateEIN">
                        <xsl:with-param name="TargetNode" select="EIN"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="width:99mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-right-width:1px;border-bottom-width:1px;text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
                      </xsl:call-template>
                    </td>
                    <td style="width:35mm;height:7.7mm;border-left:1px black solid;border:0 black solid;border-bottom-width:1px;text-align:right;padding-left:7mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GallonsQty"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- <br/>-->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>