<?xml version="1.0" encoding="UTF-8"?>
<!-- 02/12/15 - Made changes per UWR #151261 - Jeremy Nichols -->
<!-- 04/10/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/24/2015 - Added new dependency file per UWR #153560 - Jeremy Nichols -->
<!-- 12/16/2015 - Changes made for KISAM IM02397455 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS2290Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form2290" select="$RtnDoc/IRS2290"/>
  <xsl:param name="Form2290Data" select="$RtnDoc/IRS2290"/>
  <xsl:template match="/">
  
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form2290)"/>
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
        <meta name="Description" content="IRS Form 2290"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS2290Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form2290">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Begin Form Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:18mm;">
        Form <span class="styFormNumber">2290</span>
              <!-- General Dependency pushpin added -->
                <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2290"/>
              </xsl:call-template>
              
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="TargetNode" select="$Form2290/SpecialConditionDesc"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">(Rev. July 2015)
          <br/> Department of the Treasury
        </span>
              <br/>
              <span class="styAgency">Internal Revenue Service  (99)</span>
            </div>
            <div class="styFTBox" style="width:128mm;height:18mm;">
              <div class="styMainTitle" style="">Heavy Highway Vehicle Use Tax Return</div>
              <div style="font-family: ';Arial'font-size:10pt;">
          For the period July 1, 2015, through June 30, 2016
        </div>
              <div class="styFBT" style="height:2.5mm;">
                <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 
          Attach both copies of Schedule 1 to this return
        </div>
              <div class="styFBT" style="height:2.5mm;font-weight:normal;">
                <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 
                <b>Information about Form 2290 and its separate instructions is at www.irs.gov/form2290.</b>
        </div>
            </div>
            <div class="styTYBox" style="width:28mm;height:18mm;">
              <div class="styOMB" style="height:10mm;padding-left:1mm;padding-top:1mm;text-align:left;font-family:'Arial Narrow';font-size:8pt">Keep a copy of this<br/>return for your records</div>
              <div style="height:10mm;padding-left:0.5mm;padding-top:3mm;text-align:left;border-bottom-width:0">OMB No. 1545-0143</div>
            </div>
          </div>
          <!-- End Form Title -->
          <!-- Begin Address Change Table -->
          <table border="0" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm">
            <tbody>
              <tr>
                <td rowspan="3" style="border:0 solid black;border-right-width:1px;width:15mm;font-size:7pt;text-align:center">
                  <span class="styBoldText">Type<br/> or<br/> Print</span>
                </td>
                <td style="height:8mm;width:90mm;border:0 solid black;border-right-width:1px;border-bottom-width:1px;padding-left:2mm;">Name
              <br/>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                  </xsl:call-template>
                </td>
                <td style="width:47mm;height:8mm;border:0 solid black;border-right-width:0px;border-bottom-width:1px;vertical-align:top;padding-bottom:0.25mm;padding-left:1mm">
                  <b>Employer identification number</b>
                  <br/>
                  <div style="padding-top:1.25mm">
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="1"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="2"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="float:left;clear:none"> - </span>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="3"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="4"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="5"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="6"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="7"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="8"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                    <span style="width:0.5mm;float:left;clear:none"/>
                    <xsl:call-template name="PopulateIndividualSizableLetterBox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN"/>
                      <xsl:with-param name="BoxNum" select="9"/>
                      <xsl:with-param name="BoxWidth" select="'4mm'"/>
                      <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
                      <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
                    </xsl:call-template>
                  </div>
                </td>
              </tr>
              <tr>
                <td colspan="2" valign="top" style="border:0 solid black;padding-top:.5mm;border-right-width:0px;border-bottom-width:1px;padding-left:2mm;height:8mm;">Address (number, street, and room or suite no.)
              <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td colspan="2" valign="top" style="border:0 solid black;border-right-width:0px;padding-left:2mm;height:8mm;padding-bottom:1mm;">City or town, state or province, country, and ZIP or foreign postal code
              <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                  </xsl:call-template>
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
                    <xsl:with-param name="MainForm">true</xsl:with-param>
                  </xsl:call-template>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- End Address Change Table -->
          <!--  *****************ADDITION OF 4 CHECKBOXES PER WSP-090336OTH    FEB. 2009 *****************************************************-->
          <div class="styNBB" style="width:187mm;border-top-width:1px;border-color: black;border-style:solid;border-bottom-width:0px;border-right-width:0px; border-left-width:0px; ">
            <div class="styLNLeftNumBox" style="padding-left: 0mm;padding-top:.3mm;"/>
            <div class="styLNDesc" style="width:179mm;border-right-width:0;padding-top:1mm;padding-bottom:1mm;border-top-width:0;">
Check if applicable:</div>
          </div>
          <!-- Address Change Checkbox -->
          <div style=" height;auto;width: 187mm; ">
            <div class="styLNLeftNumBox" style="padding-left: 0mm;padding-top:0mm;"/>
            <div class="styLNDesc" style="height:auto;width:175mm;border-right-width:0;padding-left: 5mm;padding-top:0mm;">
				<table style="height:auto;width:175mm;">
					<tbody>
						<tr>
							<td style="height:auto;width:5mm;vertical-align:top;">
							  <input type="checkbox" class="styCkbox" onclick="return false;" style="height:3mm;width:3mm;">
								<xsl:call-template name="PopulateCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form2290/AddressChangeInd"/>
								  <xsl:with-param name="BackupName">Form2290AddressChange</xsl:with-param>
								</xsl:call-template>
							  </input>
							  <span style="height:7mm;width:5mm;"/>
							  <input type="checkbox" class="styCkbox" onclick="return false;" style="height:3mm;width:3mm;">
								<xsl:call-template name="PopulateCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form2290/AmendedReturnInd"/>
								  <xsl:with-param name="BackupName">Form990ScheduleDProtectionOfNaturalHabitat</xsl:with-param>
								</xsl:call-template>
							  </input>
							</td>
							<td style="height:auto;width:82.5mm;padding-top:1mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2290/AddressChangeInd"/>
								  </xsl:call-template>            
								  Address Change
								</label><br/>
								<span style="height:12mm;width;82mm;"/>
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2290/AmendedReturnInd"/>
								  </xsl:call-template>            
								  Amended Return
								</label><br/>
								  <span style="padding-left:0.5mm;padding-top:1mm;">Check this box if reporting (a) additional tax from<br/>
								  an increase in taxable gross vehicle weight or<br/>
								  (b) suspended vehicles exceeding the mileage<br/>
								  use limit.  <b>Do not </b>check this box for any other
								  </span>
							</td>
							<td style="height:auto;width:5mm;vertical-align:top;">
							  <input type="checkbox" class="styCkbox" onclick="return false;">
								<xsl:call-template name="PopulateCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form2290/VINCorrectionInd"/>
								  <xsl:with-param name="BackupName">Form2290VINCorrection</xsl:with-param>
								</xsl:call-template>
							  </input>
							  <span style="height:13mm;width:5mm;"/>
							  <input type="checkbox" class="styCkbox" onclick="return false;">
								<xsl:call-template name="PopulateCheckbox">
								  <xsl:with-param name="TargetNode" select="$Form2290/FinalReturnInd"/>
								  <xsl:with-param name="BackupName">Form990ScheduleDHistoricStructure</xsl:with-param>
								</xsl:call-template>
							  </input>
							</td>
							<td style="height:auto;width:82.5mm;padding-top:1mm;vertical-align:top;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2290/VINCorrectionInd"/>
								  </xsl:call-template>            
								  VIN Correction
								</label><br/>
								  <span style="padding-left:0.5mm;padding-top:1mm;">Check this box if you are correcting a vehicle<br/>
								  identification number (VIN) listed on a previously<br/>
								  filed Schedule 1 (Form 2290).  <b>Do not</b> check this<br/>
								  box for any other reason.
								  </span><br/>
								<span style="height:5mm;width;82mm;"/>
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form2290/FinalReturnInd"/>
								  </xsl:call-template>            
								  Final Return
								</label><br/>
								  <span style="padding-left:0.5mm;padding-top:1mm;">Check this box if you no longer have taxable<br/>
								  vehicles to report.
								  </span>
							</td>
						</tr>
					</tbody>
				</table>
              </div>
            </div>
          <!--  BEGIN  PART I  -->
          <div class="styBB" style="width:187mm;height:4.75mm;border-top-width:1px;">
            <div class="styPartName" style="height:4.75mm;padding-top:.5mm;">Part I</div>
            <div class="styPartDesc" style="float:left;width:167mm;padding-top:.5mm;"> Figuring the Tax</div>
          </div>
          <div style="width:187mm;">
            <div class="styLNDesc" style="width:137mm;"><b>Caution:</b> <i>If you purchased a used vehicle from a private seller, see instructions.</i></div>
            <div style="float:right">
               <div class="styLNRightNumBox" style="height:5mm;padding-left:.25mm;width:8.25mm;border-bottom-width:0;border-right-width:1px;"/>
               <div class="styLNAmountBox" style="padding-left:.25mm;width:33.75mm;border-bottom-width:1px;border-left-width:0px;">
				<span style="float:left;clear:none;width:5mm;padding-left:.5mm;padding-right:0mm;padding-top:.5mm;text-align:center;font-size:6.5pt;">Y</span>
                <span style="width:5.5mm;float:left;clear:none;text-align:center;padding-right:0mm;padding-left:.5mm;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="float:left;clear:none;padding-left:.5mm;width:5.5mm;text-align:center;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="width:5.7mm;float:left;clear:none;text-align:center;padding-left:.5mm;padding-top:.5mm;font-size:6.5pt;">Y</span>
                <span style="width:5mm;float:left;clear:none;text-align:center;padding-left:.25mm;padding-top:.5mm;font-size:6.5pt;">M</span>
                <span style="width:5mm;float:left;clear:none;text-align:center;padding-left:.25mm;padding-top:.5mm;font-size:6.5pt;">M</span>
              </div>
            </div>
          </div>
          <!-- Line 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="">1</div>
            <div class="styLNDesc" style="width:135mm;">Was the vehicle(s) reported on this return used on public highways during <b>July</b> 2015? If YES,</div>
            <div style="float:right">
               <div class="styLNRightNumBox" style="padding-left:.25mm;width:8.25mm;border-bottom-width:0;border-right-width:1px;"/>
               <div class="styLNAmountBox" style="padding-left:.25mm;width:33.75mm;border-bottom-width:0;border-left-width:0px;">
              </div>
            </div>
          </div>
<div style="width:187mm;">
  <div class="styLNLeftNumBox" style=""/>
  <div class="styLNDesc" style="width:117mm;">enter <span class="styBoldText">201507</span> in the boxes to the right. If NO, see the table on page 3 of the instructions</div>
  <div class="styLNAmountBox" style="width:34mm;height:4.5mm;float:right">      
    <xsl:call-template name="PopulateYear">
      <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDt"/>
    </xsl:call-template>
    <xsl:call-template name="PopulateMonth">
      <xsl:with-param name="TargetNode" select="$RtnHdrData/FirstUsedDt"/>
    </xsl:call-template>
  </div>
  <div class="styLNRightNumBox" style="height:4.5mm;float:right">1</div>
  <span style="float:right;padding-right:3mm;padding-top:1mm">
    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
  </span>
  <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">...</div>
           
           
               </div>
          <!-- Line 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="">2</div>
            <div class="styLNDesc" style="width:77mm;">
              <span class="styBoldText">Tax.</span> Enter the <span class="styBoldText">Total</span> from Form 2290, page 2, column (4)</div>
            <div class="styLNAmountBox" style="width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/TotalTaxComputationAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="float:right">2</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <span class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.............</span>
          </div>
          <!-- Line 3 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="">3</div>
            <div class="styLNDesc" style="width:98mm;">Additional tax from increase in taxable gross weight (see instructions).  
    <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2290/AdditionalTaxAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/AdditionalTaxAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="float:right">3</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.......</div>
          </div>
          <!-- Line 4 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="">4</div>
            <div class="styLNDesc" style="width:40mm;">
              <span class="styBoldText">Total tax.</span> Add lines 2 and 3</div>
            <div class="styLNAmountBox" style="width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/TotalTaxAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="float:right">4</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">......................</div>
          </div>
          <!-- Line 5 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="">5</div>
            <div class="styLNDesc" style="width:44mm;">
              <span class="styBoldText">Credits.</span> (see instructions).
    <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form2290/TaxCreditsAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNAmountBox" style="width:34mm;float:right">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/TaxCreditsAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="float:right">5</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">.....................</div>
          </div>
          <!-- Line 6 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="">6</div>
            <div class="styLNDesc" style="width:135mm;">
              <span class="styBoldText">Balance due.</span> Subtract line 5 from line 4. This is the amount you owe. If payment through</div>
            <div class="styLNAmountBox" style="width:34mm;border-bottom-width:0;float:right"/>
            <div class="styLNRightNumBox" style="border-bottom-width:0;float:right"/>
          </div>
          <div style="height:5.5mm;width:187mm;">
            <div class="styLNLeftNumBox" style=""/>
            <div class="styLNDesc" style="height:5.5mm;width:30mm;">EFTPS, check here <span style="width2mm"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form2290/EFTPSPaymentInd"/>
                  <xsl:with-param name="BackupName">IRS2290EFTPSPayment</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form2290/EFTPSPaymentInd"/>
                  <xsl:with-param name="BackupName">IRS2290EFTPSPayment</xsl:with-param>
                </xsl:call-template>
              </label>
            </div>
            <div class="styLNAmountBox" style="height:5.5mm;width:34mm;float:right;border-bottom-width:0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form2290/BalanceDueAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:5.5mm;float:right;border-bottom-width:0px">6</div>
            <span style="float:right;padding-right:3mm;padding-top:1mm">
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
            </span>
            <div class="styDotLn" style="float:right;padding-right:2mm;padding-top:1mm">........................</div>
          </div>
          <!-- Begin Part II -->
          <div class="styBB" style="width:187mm;height:4.75mm;border-top-width:1px">
            <div class="styPartName" style="height:4.75mm;padding-top:.5mm;">Part II</div>
            <div class="styPartDesc" style="float:left;width:167mm;padding-top:.5mm;"> Statement in Support of Suspension <span style="font-size:7pt;font-weight:normal">(Complete the statements that apply. Attach additional sheets if needed.)</span>
            </div>
          </div>
          <!--  LINE 7 -->
          <div style="width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:6mm;">7</div>
            <div class="styLNDesc" style="width:178mm;height:14mm;padding-top:.5mm;">
              <!--Dotted Line-->
             I declare that the vehicles reported on Schedule 1 as suspended (category W) are expected to be used on public highways 
             <br/>(check the boxes that apply):
              <span style="padding-left:5mm;padding-top:.5mm;">
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form2290/MileageUsed5000OrLessInd"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox5000Miles</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form2290/MileageUsed5000OrLessInd"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox5000Miles</xsl:with-param>
                  </xsl:call-template>
        5,000 miles or less </label>
                <span style="width:10mm"/>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form2290/AgricMileageUsed7500OrLessInd"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox7500Miles</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form2290/AgricMileageUsed7500OrLessInd"/>
                    <xsl:with-param name="BackupName">IRS2290Checkbox7500Miles</xsl:with-param>
                  </xsl:call-template>
        7,500 miles or less for agricultural vehicles</label>
              </span>
              <br/>
during the period July 1, 2014, through June 30, 2015, and are suspended from the tax. Complete and attach Schedule 1.
       </div>
          </div>
          <!-- Line 8a -->
          <div style="height:8mm;width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="">8a</div>
            <div class="styLNDesc" style="width:178mm;;">        
            I declare that the vehicles listed as suspended on the Form 2290 filed for the period July 1, 2013, through June 30, 2014, were not
subject to the tax for that period except for any vehicles listed on line 8b. <span class="styBoldText">Check this box if applicable.</span>
              <span style="width:3mm"/>
              <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
              <span style="width:3mm"/>
              <input type="checkbox" class="styCkbox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form2290/NotSubjectToTaxInd "/>
                  <xsl:with-param name="BackupName">IRS2290NotSubjectToTax </xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form2290/NotSubjectToTaxInd "/>
                  <xsl:with-param name="BackupName">IRS2290NotSubjectToTax </xsl:with-param>
                </xsl:call-template>
              </label>
            </div>
          </div>
          <!--  LINE 8b  -->
          <div style="width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:5mm;padding-left:3mm;">b</div>
            <div class="styLNDesc" style="width:178mm;height:5mm;">        
            Vehicle identification numbers
                
          <span style="width:130mm;border-bottom:1 black solid">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form2290/SuspendedVINReferenceTyp"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--  LINE 9 -->
          <div style="height:16mm;width:187mm;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:5mm;">9</div>
            <div class="styLNDesc" style="width:178mm;height:5mm;">        
           
           I declare that vehicle identification numbers 
            <span style="width:110mm;border-bottom:1 black solid">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form2290/TrnsfrSuspendedVINReferenceTyp"/>
                </xsl:call-template>
              </span>
              <br/>
were listed as suspended on the Form 2290 filed for the period July 1, 2013, through June 30, 2014. These vehicles were sold or
<br/>transferred to
<span style="width:90mm;border-bottom:1px black solid"></span>

 on <span style="width:30mm;border-bottom:1px black solid;"></span>,<span style="width:30mm;border-bottom:1px black solid;"></span>.
              <div class="styLNDesc" style="width:178mm;height:3mm;">
At the time of the transfer, the vehicles were still eligible for the suspension of the tax. Attach a separate list if needed.
           </div>
            </div>
          </div>
          <!-- Begin Third Party Designee Signature block -->
          <table border="0" cellspacing="0" cellpadding="0" style="font-size:7pt;width:187mm">
            <tbody>
              <tr>
                <td style="font-size:8pt;border:1px solid black;border-left-width:0;font-weight:bold">Third<br/> Party<br/> Designee</td>
                <td style="padding-left:2mm;border:1px solid black;border-left-width:0;border-right-width:0">Do you want to allow another person to discuss this return with the IRS (see instructions)?
					<input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYesInd"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyYes</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYesInd"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyYes</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <b> Yes.</b> Complete the following. 
					<input type="checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNoInd"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyNo</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNoInd"/>
                      <xsl:with-param name="BackupName">IRS2290ThirdPartyDesigneeDiscussWithThirdPartyNo</xsl:with-param>
                    </xsl:call-template>
                  </label>
                  <b>No</b>
                  <br/>
                  <br/>
                  <div style="float:left">
          Designee's<br/>name<span style="width:5mm"/>
                    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:1mm"/>
                    <span style="width:40mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/ThirdPartyDesigneeNm"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div style="float:left">
          Phone<br/>no.<span style="width:5mm"/>
                    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:1mm"/>
                    <span style="width:30mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/ThirdPartyDesigneePhoneNum"/>
                      </xsl:call-template>
                    </span>
                  </div>
                  <div style="float:left">
          Personal identification<br/>number (PIN)<span style="width:13mm"/>
                    <img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:1mm"/>
                    <span style="width:30mm">
                      <xsl:call-template name="PopulatePin">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/ThirdPartyDesigneePIN"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </td>
              </tr>
              <!-- END Third Party Designee block -->
              <!--  BEGIN Sign Here block -->
              <tr>
                <td style="font-size:8pt;border:0 solid black; border-right-width:1px;border-bottom-width:1px;font-weight:bold">Sign Here</td>
                <td style="padding-left:2mm;border: 0 solid black;border-bottom-width:1px;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my
                  knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.<br/>
                  <br/>
                  <img src="{$ImagePath}/2290_Bullet_Jumbo.gif" alt="bullet"/>
                  <span style="width:90mm;border-top:1px solid black">Signature</span>
                  <span style="width:10mm"/>
                  <img src="{$ImagePath}/2290_Bullet_Jumbo.gif" alt="bullet"/>
                  <span style="width:63mm;border-top:1px solid black">Date</span>
                  <br/>
                  <div style="width:105mm;float:left;clear:none">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <span>Type or print name below signature.</span>
                  </div>
                  <div style="width:60mm;float:left;clear:none">
                    <br/>
                    <br/>
Telephone number 
<span style="padding-left:2mm">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$RtnHdrData/DaytimePhoneNum"/>
                      </xsl:call-template>
                    </span>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- END  Sign Here Signature block -->
          <!-- The Paid Preparer&apos;s Signature block was added per PDF dated 02/14/2008 and schema version 2007v6.2 
      and RIS  ETA081635OTH   Also changed revision dates to 2008 -->
          <!-- BEGIN Paid Preparer&apos;s Use Only block -->
          <!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:0px solid black;">
            <tr>
							<!--row 1-->
							<td rowspan="3" style="width:15.5mm;font-size:9pt;font-weight:bold;font-family:'arial narrow';border-right:1px solid black;border-bottom:1px solid black;text-align:left;">Paid<br/> Preparer<br/> Use Only</td>
							<td style="width:45.5mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">Print/Type preparer's name
								<br/><br/>
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm">
										<span style="text-align:left;">
											<xsl:call-template name="PopulateReturnHeaderPreparer">
											  <xsl:with-param name="TargetNode">Name</xsl:with-param>
											</xsl:call-template>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="text-align:left;">
											<xsl:call-template name="PopulateReturnHeaderPreparer">
											  <xsl:with-param name="TargetNode">BusinessName</xsl:with-param>
											</xsl:call-template>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td style="width:57mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">Preparer's signature
								<br/><br/>
								<span style="width:2px;"/>
							</td>
							<td style="width:24mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;">
								Date <br/><br/>
								<span style="text-align:left; padding-left:4mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
									  <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="width:19mm;border-right:1px solid black;border-bottom:1px solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
                <nobr>
                  <label for="dummyid1">
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
                      <xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
                      <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>Check  
          </label>
                </nobr>
                <input class="styCkbox" type="checkbox" id="dummyid1" style="width:4mm;">
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
                    <xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
                  </xsl:call-template>
                </input>
                if <br/> self-employed
              </td>
			  <td style="width:35mm;border-bottom:1px solid black;padding-left:1mm;">PTIN
                <br/><br/>
                <xsl:choose>
					<xsl:when test="$RtnHdrData/Preparer/SSN">
						<span style="text-align:center;padding-left:10mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
							</xsl:call-template>
						</span>
					</xsl:when>
					<xsl:otherwise>
						<span style="text-align:center;padding-left:10mm;">
							<xsl:call-template name="PopulateReturnHeaderPreparer">
							  <xsl:with-param name="TargetNode">PTIN</xsl:with-param>
							</xsl:call-template>
						</span>
					</xsl:otherwise>
				</xsl:choose>
              </td>
            </tr>
            <tr>
							<!--row 2-->
							<td rowspan="1" colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;padding-left:.5mm;">Firm's name
                <img src="{$ImagePath}/2290_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:16mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1px solid black;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/2290_Bullet_Sm.gif" alt="SmallBullet"/>
                <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<!--row 3-->
							<td rowspan="1" colspan="4" style="border-bottom:1px solid black;border-right:1px solid black;padding-left:.5mm;">Firm's address
                <img src="{$ImagePath}/2290_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
              </td>
              <td style="border-bottom:1px solid black;padding-left:1mm;"> Phone no. 
        <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">Phone</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="PopulateReturnHeaderPreparer">
                  <xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <!-- END PREPARER SIGNATURE SECTION -->
          <div class="pageEnd" style="width:187mm;padding-top:.5mm;">
            <span>
              <span class="styBoldText" style="padding-right:5mm">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</span>
              <span style="padding-right:5mm;">Cat. No. 11250O</span>
              <span>Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2015)</span>
            </span>
          </div>
          <!--  PAGE 1  END -->
          <!-- PAGE 2  BEGIN -->
          <div class="styBB" style="width:187mm;text-align:right">
            <span style="float:left">Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2015)</span>Page <span class="styBoldtext" style="font-size:8pt">2</span>
          </div>
          <!--******************************************************************************************************************************************-->
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!--  TAX  COMPUTATION  TABLE -->
          <div class="styBB" style="width:187mm;text-align:center;font-weight:bold;font-size:9pt;padding:2mm;">
Tax Computation
 </div>
          <div style="width:187mm">
            <table cellspacing="0" style="font-size:7pt;border-color:black;text-align:center">
              <tbody>
                <tr style="height:17mm">
                  <th scope="col" class="styTableCellHeader" style="width:8mm;height:32mm" rowspan="2">
                    <img src="{$ImagePath}/2290_Category.gif" alt="VehicleCategoryCd"/>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:16mm;background-color:lightgrey">
                    <span style="width:1px"/>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:30mm;vertical-align:top" colspan="2">(1)<br/>Annual tax<br/>
                    <span style="font-weight:normal">(vehicles used</span><br/><span style="font-weight:normal">during July)</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:56mm;vertical-align:top" colspan="2">(2)<br/>Partial-period tax<br/>
                    <span style="font-weight:normal">(vehicles first used after July)</span><br/><span style="font-weight:normal">(See the tables at the end of</span><br/><span style="font-weight:normal">the separate instructions.)</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:44mm;vertical-align:top" colspan="2">(3)<br/>Number of<br/>vehicles</th>
                  <th scope="col" class="styTableCellHeader" style="width:26mm;vertical-align:top">(4)<br/>Amount of tax <br/>
                    <span style="font-weight:normal">(col. (1) or (2)</span><br/><span style="font-weight:normal">multiplied by col.(3))</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:8mm;height:32mm;border-right-width:0px" rowspan="2">
                    <img src="{$ImagePath}/2290_Category.gif" alt="VehicleCategoryCd"/>
                  </th>
                </tr>
                <tr style="height:15mm;font-weight:bold">
                  <td class="styTableCellHeader" style="width:20mm;vertical-align:center;padding-left:1mm">Taxable<br/>gross weight<br/>(in pounds)</td>
                  <td class="styTableCellHeader" style="width:14mm;vertical-align:top">(a)<br/>Vehicles<br/>except logging*</td>
                  <td class="styTableCellHeader" style="width:14mm;vertical-align:top">(b)<br/>Logging<br/>vehicles*</td>
                  <td class="styTableCellHeader" style="width:28mm;vertical-align:top">(a)<br/>Vehicles<br/>except logging*</td>
                  <td class="styTableCellHeader" style="width:28mm;vertical-align:top">(b)<br/>Logging<br/>vehicles*</td>
                  <td class="styTableCellHeader" style="width:21mm;vertical-align:top">(a)<br/>Vehicles<br/>except logging*</td>
                  <td class="styTableCellHeader" style="width:21mm;vertical-align:top">(b)<br/>Logging<br/>vehicles*</td>
                  <td class="styTableCellHeader" style="background-color:lightgrey">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">A</xsl:with-param>
                  <xsl:with-param name="pos">1</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">B</xsl:with-param>
                  <xsl:with-param name="pos">2</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">C</xsl:with-param>
                  <xsl:with-param name="pos">3</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">D</xsl:with-param>
                  <xsl:with-param name="pos">4</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">E</xsl:with-param>
                  <xsl:with-param name="pos">5</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">F</xsl:with-param>
                  <xsl:with-param name="pos">6</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">G</xsl:with-param>
                  <xsl:with-param name="pos">7</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">H</xsl:with-param>
                  <xsl:with-param name="pos">8</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">I</xsl:with-param>
                  <xsl:with-param name="pos">9</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">J</xsl:with-param>
                  <xsl:with-param name="pos">10</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">K</xsl:with-param>
                  <xsl:with-param name="pos">11</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">L</xsl:with-param>
                  <xsl:with-param name="pos">12</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">M</xsl:with-param>
                  <xsl:with-param name="pos">13</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">N</xsl:with-param>
                  <xsl:with-param name="pos">14</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">O</xsl:with-param>
                  <xsl:with-param name="pos">15</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">P</xsl:with-param>
                  <xsl:with-param name="pos">16</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">Q</xsl:with-param>
                  <xsl:with-param name="pos">17</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">R</xsl:with-param>
                  <xsl:with-param name="pos">18</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">S</xsl:with-param>
                  <xsl:with-param name="pos">19</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">T</xsl:with-param>
                  <xsl:with-param name="pos">20</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">U</xsl:with-param>
                  <xsl:with-param name="pos">21</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CategoryRow">
                  <xsl:with-param name="TargetCategory">V</xsl:with-param>
                  <xsl:with-param name="pos">22</xsl:with-param>
                </xsl:call-template>
                <!--			&lt;/xsl:otherwise&gt;
              &lt;/xsl:choose&gt;-->
                <tr>
                  <td class="styTableCellText" style="width:105mm;height:12mm;text-align:justify" colspan="6">
                    <b>Totals.</b> Add the number of vehicles in columns (3a) and (3b). Enter the total
				here (this should be the same total of taxable vehicles shown on Schedule 1, Part II, line c). Add the amounts in column (4). Enter
				the total here and on Form 2290, line 2 <span class="styDotLn" style="float:none;padding-left:1.5mm">.......................... </span>
				<img src="{$ImagePath}/2290_Bullet_Md.gif" alt="MediumBullet"/> 

                  </td>
                  <td class="styTableCell" style="width:44mm;vertical-align:bottom;font-size:6pt;padding-right:.5mm" colspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/TotalVehicleCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="font-size:6pt;width:30mm;vertical-align:bottom;padding-right:1mm">
                    <span style="float:left;clear:none">$</span>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/TotalTaxComputationAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:8mm;background-color:lightgrey;border-right-width:0px;border-bottom-width:0px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="styLNCtrNumBox" style="border-left-width:0px;height:12mm;vertical-align:middle">W</td>
                  <td class="styTableCellText" style="width:22mm;font-size:6pt">
						Tax-Suspended Vehicles
						(See <i>Part II</i> in
						the separate instructions.)
				  </td>
                  <td class="styTableCellText" style="height:12mm;width:76mm;background-color:lightgrey" colspan="4">
                    <span style="width:1px"/>
                  </td>
                  <td class="styTableCell" style="font-size:6pt;height:12mm;width:22mm;vertical-align:bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/TaxSuspendedLoggingVehCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="font-size:6pt;height:12mm;width:22mm;vertical-align:bottom">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form2290/TaxSuspendedNonLoggingVehCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="height:12mm;width:30mm;background-color:lightgrey;border-right-width:0px">
                    <span style="width:1px"/>
                  </td>
                  <td class="styLNCtrNumBox" style="height:12mm;border-left-width:0px;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey" colspan="2">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellCtr" style="width:179mm;height:8mm;vertical-align:middle;font-weight:bold;font-size:9pt;border-bottom-width:1px" colspan="9">
					Complete both copies of Schedule 1 (Form 2290) and attach them to Form 2290.
				  </td>
                  <td class="styLNCtrNumBox" style="height:8mm;background-color:lightgrey;border-left-width:0px;border-right-width:0px;border-bottom-width:1px">
                    <span style="width:1px"/>
                  </td>
                </tr>
                <tr>
                  <td class="styTableCellText" style="width:179mm;height:8mm;vertical-align:middle;border-bottom-width:1px;border-right-width:0px;" colspan="10">
					* See page 2 of the instructions for information on logging vehicles.
				</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="pageEnd" style="width:187mm">
            <span style="float:right"> Form <span class="styBoldText" style="font-size:8pt">2290</span> (Rev. 7-2015)</span>
          </div>
          <!-- BEGIN Left Over Table -->
          
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>      
          </div>
          
                    
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form2290"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>          
            <xsl:if test="$Form2290/AmendedMonthNum">
              <tr>
                <td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
                  <xsl:call-template name="PopulateLeftoverRow">
                    <xsl:with-param name="Desc">Amended Month</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form2290/AmendedMonthNum"/>
                    <xsl:with-param name="DescWidth" select="100"/>
                  </xsl:call-template>
                </td>
              </tr>
            </xsl:if>
          </table>
          <!-- END Left Over Table -->
          
<!--Special Condition Description -->
<span class="styRepeatingDataTitle">Form 2290, Special Condition Description: </span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">
Special Condition Description</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:for-each select="$Form2290Data/SpecialConditionDesc">
<tr style="border-color:black;height:6mm;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td class="styTableCellText" style="width:179mm;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="."/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
          
          
          
          
          <!-- Optional Print Solution for repeating data table Part I, Line 2 -->
          <!--     </div>-->
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="CategoryDetails">
    <xsl:param name="TargetCategory"/>
    <!-- enter this as a number 1=A -->
    <xsl:choose>
      <xsl:when test="$TargetCategory = 1 ">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      55,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				$100.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				$75.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 2">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      55,001-56,000
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				122.00
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				91.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 3">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      56,001-57,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				144.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				108.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 4">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      57,001-58,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				166.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				124.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 5">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      58,001-59,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				188.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				141.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 6">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      59,001-60,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				210.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				157.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 7">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      60,001-61,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				232.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				174.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 8">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      61,001-62,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				254.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				190.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 9">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      62,001-63,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				276.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				207.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 10">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      63,001-64,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				298.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				223.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 11">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      64,001-65,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				320.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				240.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 12">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      65,001-66,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				342.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				256.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 13">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      66,001-67,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				364.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				273.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 14">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      67,001-68,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				386.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				289.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 15">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      68,001-69,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				408.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				306.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 16">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      69,001-70,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				430.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				322.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 17">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      70,001-71,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				452.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				339.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 18">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      71,001-72,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				474.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				355.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 19">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      72,001-73,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				496.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				372.00
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 20">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      73,001-74,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				518.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				388.50
			</td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 21">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			      74,001-75,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				540.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				405.00
        </td>
      </xsl:when>
      <xsl:when test="$TargetCategory = 22 ">
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
			     Over 75,000
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				550.00
			</td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm;text-align:center">
				412.50
			</td>
      </xsl:when>
      <xsl:otherwise>
        <td class="styTableCellCtr" style="font-size:6pt;width:20mm;padding-left:1mm">
          <span style="width:1px"/>
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm">
          <span style="width:1px"/>
        </td>
        <td class="styTableCellText" style="font-size:6pt;width:14mm">
          <span style="width:1px"/>
        </td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="CategoryRow">
    <xsl:param name="TargetCategory"/>
    <xsl:param name="pos"/>
    <xsl:param name="internal">1</xsl:param>
    <xsl:choose>
      <xsl:when test="$TargetCategory=$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/VehicleCategoryCd">
        <tr>
          <td class="styLNCtrNumBox" style="border-left-width:0px">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/VehicleCategoryCd"/>
            </xsl:call-template>
          </td>
          <xsl:call-template name="CategoryDetails">
            <xsl:with-param name="TargetCategory" select="$pos"/>
          </xsl:call-template>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = 'A'">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/HighwayMtrVehTxCmptColumnsGrp/NonLoggingVehPartialTaxAmt"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = 'A'">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/HighwayMtrVehTxCmptColumnsGrp/LoggingVehPartialTaxAmt"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/HighwayMtrVehTxCmptColumnsGrp/NonLoggingVehicleCnt"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/HighwayMtrVehTxCmptColumnsGrp/LoggingVehicleCnt"/>
            </xsl:call-template>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:30mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = 'A'">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/HighwayMtrVehTxCmptColumnsGrp/TaxAmt"/>
            </xsl:call-template>
          </td>
          <td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form2290/HighwayMtrVehTxComputationGrp[position()=$internal]/VehicleCategoryCd"/>
            </xsl:call-template>
          </td>
        </tr>
      </xsl:when>
      <xsl:when test="$internal &gt; 22">
        <!--Empty row-->
        <tr>
          <td class="styLNCtrNumBox" style="border-left-width:0px">
            <xsl:value-of select="$TargetCategory"/>
          </td>
          <xsl:call-template name="CategoryDetails">
            <xsl:with-param name="TargetCategory">
              <xsl:value-of select="$pos"/>
            </xsl:with-param>
          </xsl:call-template>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = 'A'">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:28mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = 'A'">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:21mm;padding-right:.5mm">
            <span style="width:1px"/>
          </td>
          <td class="styTableCell" style="font-size:6pt;width:30mm;padding-right:.5mm">
            <xsl:if test="$TargetCategory = 'A'">
              <span style="float:left;clear:none">$</span>
            </xsl:if>
            <span style="width:1px"/>
          </td>
          <td class="styLNCtrNumBox" style="border-left-width:0px;border-right-width:0px">
            <xsl:value-of select="$TargetCategory"/>
          </td>
        </tr>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="CategoryRow">
          <xsl:with-param name="TargetCategory" select="$TargetCategory"/>
          <xsl:with-param name="internal">
            <xsl:value-of select="$internal+1"/>
          </xsl:with-param>
          <xsl:with-param name="pos">
            <xsl:value-of select="$pos"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>