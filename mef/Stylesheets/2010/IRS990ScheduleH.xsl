<?xml version="1.0" encoding="UTF-8"?>
<!-- 08/02/2010 - Modified per UWR BSP101319OTH - Jeremy Nichols -->
<!-- 09/16/2010 - Modified per UWR BSP102104OTH - Jeremy Nichols -->
<!-- 10/20/2010 - Modified per ITAMS #7651717 - Jeremy Nichols -->
<!-- 11/02/2010 - Modified per defect #27711 - Jeremy Nichols -->
<!-- 02/24/2011 - Modified per ITAMS #7742653 - Jeremy Nichols -->

<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990ScheduleHStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form990ScheduleHData" select="$RtnDoc/IRS990ScheduleH"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form990ScheduleHData)"/>
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
        <meta name="Description" content="IRS990ScheduleH"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS990ScheduleHStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS990ScheduleH">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:36mm;height:4mm;">
              <div style="padding-top:1mm;">
                <span class="styMainTitle" style="font-size:10pt">SCHEDULE H <br/>(Form 990)</span>
              </div>
              <div style="padding-top:3mm;padding-bottom:.5mm;">
                <span class="styAgency" style="width:30mm">Department of the Treasury</span>
                <br/>
                <span class="styAgency" style="width:30mm">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:120mm;">
              <div class="styMainTitle" style="padding-top:1mm;font-size:14pt;">Hospitals</div>
              <div class="styFBT" style="padding-top:1mm;">
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/>
                Complete if the organization answered "Yes" to Form 990, Part IV, question 20.<br/>
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/> Attach to Form 990. 
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/> See separate instructions.
              </div>
            </div>
            <div class="styTYBox" style="width:30.5mm;">
              <div class="styOMB">OMB No. 1545-0047</div>
              <div class="styTaxYear" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">
                20<span class="styTYColor">10</span>
              </div>
              <div class="styPartName" style="font-size:6.5pt;width:30.5mm;padding-top:0mm;text-align:left;padding-left:5mm;">Open to Public Inspection</div>
            </div>
          </div>
          
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styFNBox" style="width:134mm;height:8mm;">
              <span class="styBoldText">Name of the organization</span>
              <br/>
              <div style="font-family:verdana;font-size:6pt;height:6.25mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div class="styGenericDiv" style="width:52mm;height:4mm;padding-left:1mm;">
              <span class="styBoldText">Employer identification number</span>
              <br/>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- End Name and Identifying Number Section-->
          
          <div class="styBB" style="width: 187mm;">
            <div class="styPartName" style="width: 15mm; ">Part I</div>
            <div class="styPartDesc" style=" width: 167mm">Charity Care and Certain Other Community Benefits at Cost</div>
          </div>
          
          <!-- line 1  Yes - No boxes  -->
          <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
            <div class="IRS990ScheduleH_LineIndex" style="border-top-width:0px;height:4mm;"/>
            <div class="IRS990ScheduleH_LineDesc" style="width:155.25mm;height:4mm;border-right-width:0px;border-top-width:0px;"/>
            <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;padding-top:.25mm;border-bottom-width:0px;height:4mm;"/>
            <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;">Yes</div>
            <div class="IRS990ScheduleH_LineIndexMid" style="border-right-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;border-top-width:0px;">No</div>
          </div>
          
          <!-- Line 1a  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">1a</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization have a charity care policy? If "No," skip to question 6a<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:1px;border-bottom-width:1px;">
              <b>1a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCarePolicy"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:1px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCarePolicy"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 1b -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes," is it a written policy? <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>1b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenPolicy"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenPolicy"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">2</div>
            <div class="styLNDesc" style="width:155mm;height:8mm;">
              If the organization has multiple hospitals, indicate which of the following best describes application of the charity care policy to the various hospitals.
            </div>
            <div class="styShadingCell" style="width:8mm;height:8mm;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;"/>
          </div>
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:155mm;height:5mm;">
              <span style="width:75mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToAllHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToAllHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToAllHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToAllHospitals</xsl:with-param>
                  </xsl:call-template>
                  Applied uniformly to all hospitals
                </label>
              </span>
              <span style="width:75mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToMostHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToMostHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToMostHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToMostHospitals</xsl:with-param>
                  </xsl:call-template>
                  Applied uniformly to most hospitals
                </label>
              </span>
              <span style="width:75mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyTailoredToIndHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyTailoredToIndHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyTailoredToIndHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyTailoredToIndHospitals</xsl:with-param>
                  </xsl:call-template>
                  Generally tailored to individual hospitals
                </label>
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  Line 3  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">3</div>
            <div class="styLNDesc" style="width:155mm;height:6mm;">
              Answer the following based on the charity care eligibility criteria that applies to the largest number of the organization's patients.
            </div>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  Line 3a  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;padding-top:1mm;">a</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization use Federal Poverty Guidelines (FPG) to determine eligibility for providing <i>free</i> care to low 
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1.5mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1.5mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1.5mm;border-top-width:0px;"/>
          </div>
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;padding-top:1mm;"/>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:0mm;font-size:7pt;">
              <span class="styNormalText">
                income individuals? If "Yes," indicate which of the following is the FPG family income limit for eligibility for free care: <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:8.25mm;border-left-width:1px;padding-top:1mm;border-bottom-width:1px;">
              <b>3a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;padding-top:1mm;border-left-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;padding-top:1mm;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceFreeCare"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceFreeCare"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 3a  Checkboxes -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:5mm;"/>
            <div class="styLNDesc" style="width:155mm;height:5mm;">
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent100"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent100</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent100"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent100
                  </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  100%
                </label>
              </span>
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent150"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent150</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent150"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent150
                  </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  150%
                </label>
              </span>
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent200"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent200"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200
                  </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  200%
                </label>
              </span>
              <span style="width:50mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherPercentage/Other"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHOtherPercentage</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherPercentage/Other"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHOtherPercentage</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  Other  
                  <span class="styIRS990ScheduleHUnderlinedText" style="text-align: right">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherPercentage/FreeOtherPercentage"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 1mm"></span>
                </label>
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-top:1mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:1mm;border-top-width:0px;padding-top:1mm;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:1mm;border-top-width:0px;padding-top:1mm;"/>
          </div>
          
          <!-- Line 3b  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:1mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization use FPG to determine eligibility for providing <i>discounted</i> care  to low income individuals? If 
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-top:1mm;padding-bottom:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:1mm;"/>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
              <span class="styNormalText">"Yes," indicate which of the following is the family income limit for eligibility for discounted care:  </span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:8.25mm;border-left-width:1px;padding-top:1mm;padding-bottom:0mm;border-bottom-width:1px;">
              <b>3b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;padding-top:1mm;border-left-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;padding-top:1mm;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceDiscountedCare"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceDiscountedCare"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 3b  Checkboxes -->
          <div style="width:187mm;height:3mm;">
            <div class="styLNLeftNumBox" style="height:3mm;"/>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-bottom:1mm;">
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent200D"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200D</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent200D"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200D
                  </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  200%
                </label>
              </span>
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent250"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent250</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent250"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent250
                    </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  250%
                </label>
              </span>
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent300"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent300</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent300"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent300
                    </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  300%
                </label>
              </span>
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent350"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent350</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent350"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent350
                    </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  350%
                </label>
              </span>
              <span style="width:23mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent400"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent400</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Pcent400"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent400
                    </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  400%
                </label>
              </span>
              <span style="width:40mm;">
                <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedOther/Other"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHDiscountedOther</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedOther/Other"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHDiscountedOther
                    </xsl:with-param>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  Other  
                  <span class="styIRS990ScheduleHUnderlinedBox" style="font-size: 7pt; width:15mm;text-align: right">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedOther/DiscountedOtherPercentage"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 1mm"></span>
                </label>
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:6mm;padding-top:0mm;padding-bottom:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:0mm;padding-top:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:0mm;padding-top:0mm;border-top-width:0px;"/>
          </div>
          
          <!-- Line 3c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:1mm;">c</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If the organization does not use FPG to determine eligibility, describe in Part VI the income based criteria for determining eligibility for free or discounted care. Include in the description whether the organization uses an asset test or other threshold, regardless of income, to determine eligibility for free or discounted care. 
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-top:1mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;padding-top:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:0mm;padding-top:1mm;border-top-width:0px;"/>
          </div>
          
          <!-- Line 4 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:1mm;">4</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization's policy provide free or discounted care to the "medically indigent"?
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;padding-bottom:0mm;border-bottom-width:1px;">
              <b>4</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;padding-top:1mm;border-left-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;padding-top:1mm;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeDiscCareMedicallyIndigent"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeDiscCareMedicallyIndigent"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 5a  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">5a</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization budget amounts for free or discounted care provided under its charity care policy? <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>5a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AmountsBudgetedForCharityCare"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AmountsBudgetedForCharityCare"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 5b  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes," did the organization's charity care expenses exceed the budgeted amount?<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>5b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ExpensesExceededBudget"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ExpensesExceededBudget"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 5c  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;">c</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes" to line 5b, as a result of budget considerations, was the organization unable to provide free or discounted <br/>care to a patient who was eligibile for free or discounted care?<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:6mm;width:8.25mm;border-left-width:1px;padding-top:4mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>5c</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:6mm;border-bottom-width:1px;padding-top:4mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnableToProvideCare"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:6mm;width:7.5mm;padding-top:4mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnableToProvideCare"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 6a  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">6a</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization prepare an annual community benefit report?<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:3mm;">.............</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>6a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AnnualCommunityBenefitReport"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AnnualCommunityBenefitReport"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!--  Line 6b  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">6b</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes," does the organization make it available to the public? <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:3mm;">..............</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>6b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ReportPublicallyAvailable"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ReportPublicallyAvailable"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;"/>
            <div class="styLNDesc" style="width:155mm;height:8mm;">
              Complete the following table using the worksheets provided in the Schedule H instructions. Do not submit these worksheets with the Schedule H.
            </div>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>

          <!--  Line 7  Charity Care and Certain Other Community Benefits at Cost  -->
          <div style="width:187mm;height:3mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0mm;float:left;">
            <div class="styLNLeftNumBox" style="height:3mm;padding-left:2mm;padding-top:0mm;">7</div>
            <span class="styNormalText" style="width:170mm;padding-top:0mm;">
              <span style="width:2mm;"/>
              Charity Care and Certain Other Community Benefits at Cost
            </span>
          </div>
          <div class="styTable" style="border-top-width: 1px; width:187mm;border-bottom-width:1px;height:100%; ">
            <table class="styTable" style="border-color:black;" cellspacing="0">
              <thead>
                <tr>
                  <th class="styIRS990ScheduleHTheadCell" style="width:5mm;height:4mm;" scope="col"/>
                  <th class="styIRS990ScheduleHTheadCell" scope="col" style="width:41mm;text-align:center;font-size:7.5pt;border-bottom-width:0px;border-left-width:0px;">
                    <span class="styBoldText">Charity Care and <br/>Means-Tested Government Programs</span>
                  </th>
                  <th class="styIRS990ScheduleHTheadCell" style="width:17mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">(a)</span> Number of activities or programs (optional)
                  </th>
                  <th class="styIRS990ScheduleHTheadCell" style="vertical-align:top;width:16mm;font-size:6pt;padding-top:1mm;" scope="col">
                    <span class="styBoldText">(b)</span> Persons served (optional)
                  </th>
                  <th class="styIRS990ScheduleHTheadCell" style="vertical-align:top;padding-top:1mm;width:30mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">(c)</span> Total community benefit expense
                  </th>
                  <th class="styIRS990ScheduleHTheadCell" style="vertical-align:top;padding-top:1mm;width:30mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">(d)</span> Direct offsetting revenue
                  </th>
                  <th class="styIRS990ScheduleHTheadCell" style="vertical-align:top;padding-top:1mm;width:30mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">(e)</span> Net community benefit expense
                  </th>
                  <th class="styIRS990ScheduleHTheadCell" style="vertical-align:top;padding-top:1mm;width:17mm;border-right-width:0px;font-size:6pt;" scope="col">
                    <span class="styBoldText">(f)</span> Percent of total expense
                  </th>
                </tr>
              </thead>
              <tfoot/>
              
              <!--  Line 7a -->
              <tbody valign="top">
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">a</span>
                    <span style="width:2mm"/>
                    Charity care at cost (from<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    Worksheets 1 and 2)
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCareAtCost/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCareAtCost/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCareAtCost/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCareAtCost/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCareAtCost/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CharityCareAtCost/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7b  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">b</span>
                    <span style="width:2mm"/>
                    Unreimbursed Medicaid (from<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>Worksheet 3, column a)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">.</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaid/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaid/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaid/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaid/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaid/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaid/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7c -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm;" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">c</span>
                    <span style="width:2mm;"/>
                    Unreimbursed costs—other 
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    means-tested government   
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    programs (from Worksheet 3, 
                    <span class="styItalicText"/>
                    <span style="width: 7mm"/>column b)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">....</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCosts/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCosts/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCosts/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCosts/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCosts/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCosts/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7d -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">d</span>
                    <span style="width:2mm"/>
                    <b>Total</b> Charity Care and<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>Means-Tested Government <span style="width: 7mm"/>Programs
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">.....</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCharityCare/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCharityCare/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCharityCare/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCharityCare/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCharityCare/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCharityCare/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--  Line 7e  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:12mm;font-size:7pt;">Other Benefits</span>
                    <span style="width:1.5mm"/>
                    <br/>
                    <span class="styBoldText" style="padding-left:2mm">e</span>
                    <span style="width:1.75mm;"/>
                    Community health improvement<br/>
                    <span style="width: 6.5mm"/>
                    services and community<br/>
                    <span class="styNormalText"/>
                    <span style="width: 6.5mm"/>
                    benefit operations (from<br/>
                    <span class="styNormalText"/>
                    <span style="width: 6.5mm"/>
                    (Worksheet 4)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">....</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServices/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServices/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServices/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServices/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServices/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServices/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7f  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">f</span>
                    <span style="width:2mm"/>
                    Health professions education<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    (from Worksheet 5)
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducation/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducation/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducation/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducation/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducation/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducation/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7g  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">g</span>
                    <span style="width:2mm"/>
                    Subsidized health services<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    (from Worksheet 6)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServices/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServices/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServices/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServices/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServices/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServices/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7h  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">h</span>
                    <span style="width:2mm"/>
                    Research (from Worksheet 7)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;"/>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Research/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Research/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Research/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Research/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Research/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Research/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--  Line 7i  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">i</span>
                    <span style="width:2mm"/>
                    Cash and in-kind contributions<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    to community groups<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
                    (from Worksheet 8)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributions/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributions/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributions/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributions/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributions/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributions/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7j  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">j</span>
                    <span style="width:2mm"/>
                    <b>Total</b>
                    <span class="styNormalText"/> Other Benefits
                    <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;">...</span>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefits/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefits/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefits/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefits/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefits/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:2px;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefits/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7k  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px; width: 44mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">k</span>
                    <span style="width:2mm"/>
                    <b>Total. </b> Add lines 7d and 7j.
                    <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefits/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefits/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefits/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefits/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefits/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefits/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <span style="width:112mm;font-size:6.25pt;font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 990.</span>
            <span style="width:6mm;font-size:6.25pt;"/>
            Cat. No. 50192T
            <span style="width:9mm;"/>
            <span style="font-weight:bold;font-size:6.25pt;">Schedule H (Form 990) 2010</span>
          </div>
          
          <!-- PAGE2HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2010</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!-- BEGIN PART II TITLE -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part II</div>
            <div class="styPartDesc">
              <b>Community Building Activities</b>
              <span class="styNormalText"> Complete this table if the organization conducted any community building activities.</span>
            </div>
          </div>
          
          <!--  BEGIN PART II  TABLE  -->
          <table class="styTable" id="IRS990ScheduleHPartIITable" summary="Community Building Activities" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm;">
            <tr>
              <th class="styLNLeftNumBoxBB" style="width:5mm;height:4mm;padding-left:2mm;" scope="col"/>
              <th class="styIRS990ScheduleHTheadCell" style="width:41mm;padding-bottom:0mm;" scope="col"/>
              <th class="styIRS990ScheduleHTheadCell" style="width:19mm;font-size:6.25pt;padding-bottom:1px;" scope="col">
                <span class="styBoldText">(a)</span> Number of activities or programs (optional)
              </th>
              <th class="styIRS990ScheduleHTheadCell" style="width:19mm;font-size:6.25pt;vertical-align:top;" scope="col">
                <span class="styBoldText">(b)</span> Persons served (optional)
              </th>
              <th class="styIRS990ScheduleHTheadCell" style="width:28mm;font-size:6.25pt;vertical-align:top;" scope="col">
                <span class="styBoldText">(c)</span> Total community building expense
              </th>
              <th class="styIRS990ScheduleHTheadCell" style="width:28mm;font-size:6.25pt;vertical-align:top;" scope="col">
                <span class="styBoldText">(d)</span> Direct offsetting<br/> revenue
              </th>
              <th class="styIRS990ScheduleHTheadCell" style="width:28mm;font-size:6.25pt;vertical-align:top;" scope="col">
                <span class="styBoldText">(e)</span> Net community building expense
              </th>
              <th class="styIRS990ScheduleHTheadCell" style="width:19mm;font-size:6.25pt;vertical-align:top;" scope="col">
                <span class="styBoldText">(f)</span> Percent of total expense
              </th>
            </tr>
            
            <!--  PART II  Line 1 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:1px;width:4mm;padding-left:2mm;padding-top:1mm;font-size:6.25pt;padding-bottom:0mm;">
                1
              </td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:1px;padding-top:1px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">
                Physical improvements and housing
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprovementsAndHousing/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprovementsAndHousing/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprovementsAndHousing/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprovementsAndHousing/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprovementsAndHousing/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprovementsAndHousing/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 2-->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:2mm;font-size:6.25pt;">
                2
              </td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">				
                Economic development
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopment/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopment/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopment/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopment/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopment/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopment/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 3 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:2mm;font-size:6.25pt;">
                3
              </td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">				
                Community support
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupport/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupport/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupport/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupport/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupport/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupport/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 4 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:2mm;font-size:6.25pt;">
                4
              </td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">				
                Environmental improvements
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovements/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovements/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovements/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovements/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovements/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovements/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 5 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:1mm;padding-bottom:3mm;font-size:6.25pt;">
                5
              </td>
              <td class="styIRS990ScheduleHCell" style="padding-top:0mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;"> 
                Leadership development and training for community members
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopment/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopment/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopment/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopment/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopment/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopment/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 6-->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:.5mm;font-size:6.25pt;">
                6
              </td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> 
                Coalition building
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuilding/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuilding/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuilding/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuilding/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuilding/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuilding/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 7   -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:2.5mm;font-size:6.25pt;">
                7
              </td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> 
                Community health improvement advocacy
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacy/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacy/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacy/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacy/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacy/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacy/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 8   -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:.5mm;font-size:6.25pt;">
                8
              </td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> 
                Workforce development
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopment/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopment/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopment/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopment/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopment/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopment/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 9  -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:.5mm;font-size:6.25pt;">
                9
              </td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> 
                Other
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Other/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Other/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Other/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Other/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Other/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Other/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            
            <!--  PART II  Line 10  -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:0mm;padding-top:0mm;padding-bottom:.5mm;border-color:black;font-size:6.25pt;">
                10
              </td>
              <td class="styIRS990ScheduleHCell" style="border-bottom-width:1px;padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;">
                <b>Total</b>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Total/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Total/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Total/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Total/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Total/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Total/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc">
            
            <!-- added code for the & ampersand symbol -->
              <b>Bad Debt, Medicare, &#38; Collection Practices</b>
            </div>
          </div>
          
          <!--  PART III  Line 1  -->
          <div style="width:187mm;">
            <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:2mm;padding-top:0mm;"/>
            <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
              <div class="IRS990ScheduleH_LineDesc" style="width:163.25mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                <b>Section  A. Bad Debt Expense</b>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;padding-top:.25mm;border-bottom-width:1px;height:4mm;"/>
              <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:1px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;font-size:7pt;font-weight:bold;">Yes</div>
              <div class="IRS990ScheduleH_LineIndexMid" style="border-right-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;font-size:7pt;border-top-width:1px;font-weight:bold;">No</div>
            </div>
          </div>
          
          <!-- Line 1  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">1</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Does the organization report bad debt expense in accordance with Heathcare Financial Management Association Statement No. 15?
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........................</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:7mm;width:8.25mm;border-left-width:1px;padding-top:3mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>1</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:7mm;border-bottom-width:1px;padding-top:3mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseReported"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:7mm;width:7.5mm;padding-top:3mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseReported"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--  PART III   Line 2  -->
          <!--  Line 2  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">2</div>
            <div class="styLNDesc" style="width: 115mm; padding-top:.5mm;">
              <span style="float:left; clear: none">Enter the amount of the organization's bad debt expense (at cost)</span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
            </div>
            <div class="styLNRightNumBox" style="padding-top:.5mm;">
              2
            </div>
            <div class="styLNAmountBox" style="">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseAmount"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm; padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          <!-- Line 2  -->
          
          <!--  Line 3  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:1mm;">3</div>
            <div class="styLNDesc" style="width: 115mm;padding-top:0mm;">
              <span style="float:left; clear: none">Enter the estimated amount of the organization's bad debt expense (at cost)<span style="width:12mm;"/> attributable to patients eligible under the organization's charity care policy <span style="width:4mm;"  /> <b>.</b><span style="width:4mm;"/><b>.</b></span>
              <span style="letter-spacing:4mm; float:left;clear:none;font-weight:bold; font-size:7pt; "/>
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">3</div>
            <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AmountAttributableTo"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:7mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:7mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!-- PART III   Line 4  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">4</div>
            <div class="styLNDesc" style="width: 155mm;padding-top:.5mm;">
              <span style="float:left; clear: none">
                Provide in Part VI the text of the footnote to the organization's financial statements that describes bad debt expense. 
                In addition, describe the costing methodology used in determining the amounts reported on lines 2 and 3, and rationale 
                for including a portion of bad debt amounts as community benefit.</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  PART III  Section B - Medicare  -->
          <div style="width: 187mm">
            <div class="styLNDesc" style="width: 163mm;padding-top:0mm;font-weight:bold">Section  B. Medicare</div>
            <div class="styShadingCell" style="width:8mm;height:4mm; padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  Line 5  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">5</div>
            <div class="styLNDesc" style="width: 115mm; padding-top:.5mm;">
              <span style="float:left; clear: none">Enter total revenue received from Medicare (including DSH and IME)</span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
            </div>
            <div class="styLNRightNumBox" style="padding-top:.5mm;">5</div>
            <div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AmountReimbursedByMedicare"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm; padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  Line 6-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">6</div>
            <div class="styLNDesc" style="width: 115mm; padding-top:.5mm;">
              <span style="float:left; clear: none">Enter Medicare allowable costs of care relating to payments on line 5</span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
            </div>
            <div class="styLNRightNumBox" style="padding-top:.5mm;">6</div>
            <div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostOfCareReimbursedByMedicare"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm; padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  Line 7-->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">7</div>
            <div class="styLNDesc" style="width: 115mm; padding-top:.5mm;">
              <span style="float:left; clear: none">Subtract line 6 from line 5. This is the surplus or (shortfall)</span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">7</div>
            <div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/MedicareSurplusOrShortfall"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm; padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!-- PART III   Line 8  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:1mm;">8</div>
            <div class="styLNDesc" style="width: 155mm;padding-top:0mm;">
              <span style="float:left; clear: none">Describe in Part VI the extent to which any shortfall reported in line 7 should be treated as community benefit. <br/>Also describe in Part VI the costing methodology or source used to determine the amount reported on line 6. <br/>Check the box that describes the method used:</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            
            <!-- line 8 check boxes -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:155mm;height:5mm;">
                <span style="width:50mm;">
                  <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostAccountingSystem"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostAccountingSystem</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostAccountingSystem"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostAccountingSystem</xsl:with-param>
                    </xsl:call-template>
                    Cost accounting system
                  </label>
                </span>
                <span style="width:50mm;">
                  <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostToChargeRatio"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostToChargeRatio</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostToChargeRatio"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostToChargeRatio</xsl:with-param>
                    </xsl:call-template>
                    Cost to charge ratio
                  </label>
                </span>
                <span style="width:50mm;">
                  <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/Other"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/Other"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
                    </xsl:call-template>
                    Other
                  </label>
                </span>
              </div>
              <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:1mm;border-top-width:0px;"/>
              <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:1mm;border-top-width:0px;"/>
              <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:1mm;border-top-width:0px;"/>
            </div>
            
            <!--  PART III  Section C - Collection Practices  -->
            <div style="width: 187mm">
              <div class="styLNDesc" style="width: 163mm;padding-top:0mm;font-weight:bold">Section  C. Collection Practices</div>
              <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm; padding-bottom:1mm;border-top-width:0px;"/>
              <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1mm;border-top-width:0px;"/>
              <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1mm;border-top-width:0px;"/>
            </div>
            
            <!-- PART III  -  Section C   -  Line 9a  -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">9a</div>
              <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
                <span class="styNormalText">
                  Does the organization have a written debt collection policy?
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
                <b>9a</b>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
                <span style="font-weight: normal;">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenDebtCollectionPolicy"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
                <span style="font-weight: normal;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenDebtCollectionPolicy"/>
                  </xsl:call-template>
                </span>
              </div>
            </div>
            
            <!--  Part III   Line 9b  -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;">b</div>
              <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
                <span class="styNormalText">
                  If "Yes," does the organization's collection policy contain provisions on the collection practices to be followed for patients who are known to qualify for charity care or financial assistance? Describe in Part VI<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:6.5mm;width:8.25mm;border-left-width:1px;padding-top:3mm;font-size:7pt;border-top-width:0px;border-bottom-width:0px;">
                <b>9b</b>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:6.5mm;border-bottom-width:0px;padding-top:3mm;font-size:7pt;border-top-width:0px;">
                <span style="font-weight: normal;">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ProvisionForCharityCare"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:6.5mm;width:7.5mm;padding-top:3mm;border-right-width:0px;border-bottom-width:0px;border-top-width:0px;font-size:7pt;">
                <span style="font-weight: normal;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ProvisionForCharityCare"/>
                  </xsl:call-template>
                </span>
              </div>
            </div>
          </div>
          
          <!--   PART  IV   Management Companies and Joint Ventures -->
          <div class="styBB" style="width:187mm;height:4mm;border-top-width:1px;">
            <div class="styPartName">Part IV</div>
            <div class="styPartDesc" style="width:110mm;">
              <b>Management Companies and Joint Ventures</b>
             </div>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartIV"/>
              <xsl:with-param name="containerHeight" select="13"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'Part4ctn' "/>
            </xsl:call-template>
          </div>
          <div class="styTableContainer" id="Part4ctn" style="height:30mm;">
            <xsl:call-template name="SetInitialState"/>
            <table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
              <thead class="styTableThead">
                <tr style="height:5mm;">
                  <th class="styTableCellHeader" style="width:50mm;padding-top:1mm;border-color:black;font-weight:normal;vertical-align:top;" scope="col">
                    <b>(a)</b> Name of entity    
                </th>
                  <th class="styTableCellHeader" style="width:60mm;padding-top:1mm;border-color:black;font-weight:normal;vertical-align:top;" scope="col">
                    <b>(b)</b> Description of primary 
                    <br/> activity of entity
                </th>
                  <th class="styTableCellHeader" style="width:26mm;padding-top:1mm;border-right-width:0px;border-right-width:1px;border-color:black;font-weight:normal;vertical-align:top;" scope="col">
                    <b>(c)</b> Organization's
                    <br/>profit % or stock
                    <br/>ownership %
                </th>
                  <th class="styTableCellHeader" style="width:29.5mm;padding-left:1mm;padding-top:1mm;border-color:black;font-weight:normal;vertical-align:top;" scope="col">
                    <b>(d)</b> Officers, directors,
                    <br/>trustees, or key 
                    <br/>employees' profit % 
                    <br/>or stock ownership% 
                </th>
                  <th class="styTableCellHeader" style="width:22mm;padding-top:1mm;border-color:black;text-align:center;border-right-width:0px;font-weight:normal;vertical-align:top;" scope="col">
                    <b>(e)</b> Physicians'
                    <br/>profit % or stock
                    <br/>ownership %
                </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartIV ">
                    <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt;=13) ">
                      <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartIV">
                        <tr style="height:4mm;">
                          <td class="styTableCell" style="width:50mm;vertical-align:top;text-align:left;border-color:black;">
                            <xsl:if test="position() = last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:50mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <span style="width:3mm;font-weight:bold;">
                              <xsl:value-of select="position()"/>
                            </span>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
                            </xsl:call-template>
                            <br/>
                            <span style="width:3mm;"/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
                            </xsl:call-template>
                          </td>
                          <td class="styTableCell" style="width:60mm;text-align:left;border-color:black;border-right-width:1px;vertical-align:top;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:60mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DescriptionEntPrimaryActivity"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          
                          <!--COL  C  -->
                          <td class="styTableCell" style="width:27mm;text-align:right;border-color:black;vertical-align:top;padding-top:1mm;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:27mm;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="OrganizationProfitOrOwnership"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styTableCell" style="width:29mm;border-left-width:0px;text-align:right;border-color:black;vertical-align:top;padding-top:1mm;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:29mm;border-left-width:0px;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px; </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="OfficersEtcProfitOrOwnership"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styTableCell" style="width:22mm;text-align:right;border-color:black;vertical-align:top;border-right-width:0px;padding-top:1mm;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:22mm;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;border-right-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="PhysicansProfitOrOwnership"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 1 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">1</xsl:with-param>
                        <xsl:with-param name="IsSeparated">true</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 2 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">2</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 3 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">3</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 4 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">4</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 5 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">5</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 6 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">6</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 7 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">7</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 8 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">8</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 9 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">9</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 10 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">10</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 11 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">11</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 12 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">12</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 13 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">13</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">1</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">2</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">3</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">4</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">5</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">6</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">7</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">8</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">9</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">10</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">11</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">12</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">13</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartIV"/>
            <xsl:with-param name="containerHeight" select="13"/>
            <xsl:with-param name="headerHeight" select="1"/>
            <xsl:with-param name="containerID" select=" 'Part4ctn' "/>
          </xsl:call-template>
          
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:0mm;">
            <div style="float:left;">
              <span style="width:10mm;"/>
            </div>
            <div style="float:right;">
              <span style="width:30px;"/>
              <span class="styBoldText" style="font-weight:bold;font-size:6.25pt;">Schedule H (Form 990) 2010</span>
            </div>
          </div>
          <!-- END Page Break and Footer-->
          
          <!-- PAGE 3 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2010</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!--  Begin PART V  Facility Information  -->
          <!-- PART V  Section A - Hospital Facilities   -->
          <!-- Part V Facility Information table code -->
          <div class="styBB" style="width:187mm;height:4mm;border-top-width:1px;">
            <span class="styPartName">Part V</span>
            <span style="width:168mm;" class="styPartDesc">Facility Information
              <span class="styItalicText" style="width:15mm;">  </span>
            </span>
            
            <!-- Table expand/collapse toggle button-->
            <div style="float:right;clear:none;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionA"/>
                <xsl:with-param name="containerHeight" select="16"/>
                <xsl:with-param name="containerID" select=" 'PartVctn' "/>
              </xsl:call-template>
            </div>
          </div>
            <!--Table expand/collapse toggle button end-->
            
          <!-- BEGIN Part V Table -->
          <div class="styTableContainer" id="PartVctn" >
          
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:100%;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;">
                <tr>
                  <th class="styTableCellHeader" colspan="2" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:100mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:100mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  A. Hospital Facilities</b>
                    </div>
                    <span style="font-weight:normal;">(list in order of size, measured by total revenue per facility, from largest to smallest)</span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">How many hospital facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:20mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/NumberOfHospitalFacilities"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:30mm;"/>
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:1px;vertical-align:top;padding-top:.5mm;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_LicHosp.gif" alt="Licensed Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top; padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" >
                    <img src="{$ImagePath}/990SchH_GenMedSurg.gif" alt="General-Medical-Surgical"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" >
                    <img src="{$ImagePath}/990SchH_ChildHosp.gif" alt="Children's Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10">
                    <img src="{$ImagePath}/990SchH_TeachHosp.gif" alt="Teaching Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;width:7mm;border-style:solid;border-color:black;b  order-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; padding-bottom:18mm;" scope="col" rowspan="10" >
                    <img src="{$ImagePath}/990SchH_CriticalHosp.gif" alt="Critical Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" >
                    <img src="{$ImagePath}/990SchH_ResearchFac.gif" alt="Research Facility"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" >
                    <img src="{$ImagePath}/990SchH_ER-24hrs.gif" alt="ER-24Hours"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" >
                    <img src="{$ImagePath}/990SchH_ER-Other.gif" alt="ER-Other"/>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;padding-bottom:1mm;width:34mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:8pt;">
                    <span style="font-weight:normal">Other (Describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVSectionA">
                
                  <!-- Adding the separator section -->
                  <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;16)">
                    <tr>
                      <td class="styTableCellCtr " style="width:10mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FacilityNumber"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCellText" style="width:90mm;padding-left:1mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                        </xsl:call-template>
                        <xsl:if test="Name/BusinessNameLine2 != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="Address"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LicensedHospital"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GeneralMedicalAndSurgical"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ChildrensHospital"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TeachingHospital"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CriticalAccessHospital"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ResearchFacility"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Er24Hours"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ErOther"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCell" style="width:34mm;padding-left:1mm;text-align:left;border-right-width:0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Other"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt; 1 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" style="width:10mm;text-align:left;">
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCellText" style="width:90mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionA"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px;width:34mm;text-align:left;">
                      <span style="width:2px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;2 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;3 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;4 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;5 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;6 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;7 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;8 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;9 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;10 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;11 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;12 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;13 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;14 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;15 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &lt;16 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
              </tbody>
            </table>
          </div>
          
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionA"/>
            <xsl:with-param name="containerHeight" select="16"/>
            <xsl:with-param name="containerID" select=" 'PartVctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          <!-- END Part V Table -->
          <!-- END PART V  Section A - Hospital Facilities   -->
          
          <!-- footer line -->
          <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
          </div>
          
          <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartVSectionB) &lt; 1">
            <!-- PAGE 4 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
              </div>
            </div>
            <!-- END Page Header  -->
          
            <!--  PART V  Section B - Facility Policies and Practices  -->
            <div style="width: 187mm;border-top-width:1px;">
              <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
                <span class="styPartName">Part V</span>
                <span style="width:168mm;" class="styPartDesc">Facility Information
                  <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
                </span>
              </div><br/>
              
              <div class="styLNDesc" style="width: 187mm;padding-top:0mm;font-size:8pt;font-weight:bold;">Section  B. Facility Policies and Practices.</div><br/>
              <span style="font-weight:normal;">(Complete a separate Section B for each of the hospital facilities listed in Part V, Section A)</span><br/>     
            </div>    
                       
            <span style="height:4mm;"/>   
            
            <div class="styLNDesc" style="width:187mm;">
              <span style="font-weight:bold;">Name of Hospital Facility:</span>
              <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:148mm;font-weight:normal;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="HospitalFacilityName"/>
                </xsl:call-template>
              </span><br/>  
            </div> 
            <div class="styLNDesc" style="width:187mm;">
              <span style="font-weight:bold;">Line Number of Hospital Facility (from Schedule H, Part V, Section A):</span>
              <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:90mm;font-weight:normal;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="HospitalFacilityNumber"/>
                </xsl:call-template>
              </span><br/><br/>  
            </div> 
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="4" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="3" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Community Health Needs Assessment <span style="font-weight:normal;">(Lines 1 through 7 are optional for 2010)</span>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                
                <!-- Part V Section B line 1 -->
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    1
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
                    During the tax year or any prior tax year, did the hospital facility conduct a community health needs assessment (“Needs
                    Assessment”)? If “No,” skip to question 8. <span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.....................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    1
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConducted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConducted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate what the Needs Assessment describes (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDefinition"/>
                      </xsl:call-template>
                    </input>
                    A definition of the community served by the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDemographics"/>
                      </xsl:call-template>
                    </input>
                    Demographics of the community 
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ExistingResources"/>
                      </xsl:call-template>
                    </input>
                    Existing health care facilities and resources within the community that are available to respond to the health needs of the community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="HowDataObtained"/>
                      </xsl:call-template>
                    </input>
                    How data was obtained 
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityHealthNeeds"/>
                      </xsl:call-template>
                    </input>
                    The health needs of the community  
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherHealthIssues"/>
                      </xsl:call-template>
                    </input>
                    Primary and chronic disease needs and other health issues of uninsured persons, low-income persons, and minority groups
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IdentifyingProcess"/>
                      </xsl:call-template>
                    </input>
                    The process for identifying and prioritizing community health needs and services to meet those needs 
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ConsultingProcess"/>
                      </xsl:call-template>
                    </input>
                    The process for consulting with persons representing the community’s interests  
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InformationGaps"/>
                      </xsl:call-template>
                    </input>
                    Information gaps that limit the hospital facility’s ability to assess all of the community’s health needs
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    j
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="Other"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    2
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Indicate the tax year the hospital facility last conducted a Needs Assessment: 20
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="NeedsAssessmentConducted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    3
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    In conducting its most recent Needs Assessment, did the hospital facility take into account input from persons who represent the
                    community served by the hospital facility? If “Yes,” describe in Part VI how the hospital facility took into account input from
                    persons who represent the community, and identify the persons the hospital facility consulted.
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    3
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccount"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccount"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    4
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility’s Needs Assessment conducted with one or more other hospital facilities? If “Yes,” list the other hospital facilities in Part VI.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...........................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    4
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="OtherFacilities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="OtherFacilities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    5
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility make its Needs Assessment widely available to the public?
                    <span class="styDotLn" style="float:none">...........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    5
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAWidelyAvailable"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAWidelyAvailable"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate how the Needs Assessment was made widely available (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OwnWebsite"/>
                      </xsl:call-template>
                    </input>
                    Hospital facility’s website
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OnRequest"/>
                      </xsl:call-template>
                    </input>
                    Available upon request from the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethod"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    6
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If the hospital facility addressed needs identified in its most recently conducted Needs Assessment, indicate how (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AdoptImplementStrategy"/>
                      </xsl:call-template>
                    </input>
                    Adoption of an implementation strategy to address the health needs of the hospital facility’s community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ExecuteImplementStrategy"/>
                      </xsl:call-template>
                    </input>
                    Execution of the implementation strategy
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DevelopCommunityPlan"/>
                      </xsl:call-template>
                    </input>
                    Development of a community benefit plan for the facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ParticipateCommunityPlan"/>
                      </xsl:call-template>
                    </input>
                     Participation in community-wide community benefit plan
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IncludeOperationalPlans"/>
                      </xsl:call-template>
                    </input>
                    Inclusion of a community benefit section in operational plans
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AdoptBudget"/>
                      </xsl:call-template>
                    </input>
                    Adoption of a budget for provision of services that address the needs identified in the CHNA
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PrioritizeHealthNeeds"/>
                      </xsl:call-template>
                    </input>
                    Prioritization of health needs in the community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PrioritizeServices"/>
                      </xsl:call-template>
                    </input>
                    Prioritization of services that the hospital facility will undertake to meet health needs in its community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherNeedsAddressed"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    7
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility address all of the needs identified in its most recently conducted Needs Assessment?  If “No,” explain in Part VI which needs it has not addressed together with the reasons why it has not addressed such needs.
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    7
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AllNeedsAddressed"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AllNeedsAddressed"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="3" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Financial Assistance Policy
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td style="border-color:black;border-style:solid;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a written financial assistance policy that:
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    8
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Explains eligibility criteria for financial assistance, and whether such assistance includes free or discounted care?
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    8
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="EligibilityCriteriaExplained"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="EligibilityCriteriaExplained"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    9
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Used federal poverty guidelines (FPG) to determine eligibility for providing free care to low incomeindividuals?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">..</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    9
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGFree"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGFree"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate the FPG family income limit for eligibility for free care: 
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FPGFreePercent"/>
                      </xsl:call-template>
                    </span>%<br/>
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
            
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
            </div>
            
            <!-- PAGE 5 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
              </div>
            </div>
            <!-- END Page Header  -->
  
            <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
              <span class="styPartName">Part V</span>
              <span style="width:168mm;" class="styPartDesc">Facility Information
                <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
              </span>
            </div><br/>
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="4" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    10
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Used FPG to determine eligibility for providing discounted care to low income individuals?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    10
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGDiscounted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGDiscounted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate the FPG family
                    income limit for eligibility for discounted care: 
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FPGDiscountPercent"/>
                      </xsl:call-template>
                    </span>%
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    11
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Explained the basis for calculating amounts charged to patients?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    11
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsBasis"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsBasis"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate the factors used in determining such amounts (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IncomeLevel"/>
                      </xsl:call-template>
                    </input>
                    Income level
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AssetLevel"/>
                      </xsl:call-template>
                    </input>
                    Asset level
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicalIndigency"/>
                      </xsl:call-template>
                    </input>
                    Medical indigency
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InsuranceStatus"/>
                      </xsl:call-template>
                    </input>
                    Insurance status
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="UninsuredDiscount"/>
                      </xsl:call-template>
                    </input>
                    Uninsured discount
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicaidMedicare"/>
                      </xsl:call-template>
                    </input>
                    Medicaid/Medicare
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="StateRegulation"/>
                      </xsl:call-template>
                    </input>
                    State regulation
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherFactors"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    12
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Explained the method for applying for financial assistance?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    12
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsApplicationMethod"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsApplicationMethod"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Included measures to publicize the policy within the community served by the hospital facility?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasures"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasures"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate how the hospital facility publicized the policy (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PostedOnWebsite"/>
                      </xsl:call-template>
                    </input>
                    The policy was posted at all times on the hospital facility’s web site
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AttachedToInvoices"/>
                      </xsl:call-template>
                    </input>
                    The policy was attached to all billing invoices
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PostedInEmergencyRoom"/>
                      </xsl:call-template>
                    </input>
                    The policy was posted in the hospital facility’s emergency rooms or waiting rooms
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PostedInAdmissionOffice"/>
                      </xsl:call-template>
                    </input>
                    The policy was posted in the hospital facility’s admissions offices
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ProvidedOnAdmission"/>
                      </xsl:call-template>
                    </input>
                    The policy was provided, in writing, to patients upon admission to the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AvailableOnRequest"/>
                      </xsl:call-template>
                    </input>
                    The policy was available upon request
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherPublicity"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="6" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Billing and Collections
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a separate billing and collections policy, or a written financial
                    assistance policy that explained actions the hospital facility may take upon non-payment?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ActionsOnNonpayment"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ActionsOnNonpayment"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    15
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Check all of the following collection actions against a patient that were permitted under the hospital facility's policies at any time during the tax year:
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitReportToCreditAgency"/>
                      </xsl:call-template>
                    </input>
                    Reporting to credit agency
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitLawsuit"/>
                      </xsl:call-template>
                    </input>
                    Lawsuits
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitLienOnResidence"/>
                      </xsl:call-template>
                    </input>
                    Liens on residences
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitBodyAttachment"/>
                      </xsl:call-template>
                    </input>
                    Body attachments or arrests
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitOtherActions"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    16
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility engage in or authorize a third party to engage in any of the following collection actions during the tax
                    year?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    16
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” check all collection actions in which the hospital facility or a third party engaged (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ReportToCreditAgency"/>
                      </xsl:call-template>
                    </input>
                    Reporting to credit agency
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="Lawsuit"/>
                      </xsl:call-template>
                    </input>
                    Lawsuits
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="LienOnResidence"/>
                      </xsl:call-template>
                    </input>
                    Liens on residences
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="BodyAttachment"/>
                      </xsl:call-template>
                    </input>
                    Body attachments
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActions"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    17
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate which actions the hospital facility took before initiating any of the collection actions checked in question 16 (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NotifyUponAdmission"/>
                      </xsl:call-template>
                    </input>
                    Notified patients of the financial assistance policy upon admission
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NotifyBeforeDischarge"/>
                      </xsl:call-template>
                    </input>
                    Notified patients of the financial assistance policy prior to discharge
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NotifiedAllPatients"/>
                      </xsl:call-template>
                    </input>
                    Notified patients of the financial assistance policy in communications with the patients regarding the patients’ bills
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DocumentedDetermination"/>
                      </xsl:call-template>
                    </input>
                    Documented its determination of whether a patient who applied for financial assistance under the financial assistance policy
                    qualified for financial assistance
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActionsTaken"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
            </div>
            
            <!-- PAGE 6 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
              </div>
            </div>
            <!-- END Page Header  -->
  
            <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
              <span class="styPartName">Part V</span>
              <span style="width:168mm;" class="styPartDesc">Facility Information
                <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
              </span>
            </div><br/>
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="6" style="width:187mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Policy Relating to Emergency Medical Care
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="4" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    18
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a written policy relating to emergency medical care that requires the
                    hospital facility to provide, without discrimination, care for emergency medical conditions to individuals regardless of their
                    eligibility under the hospital facility’s financial assistance policy?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">..........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    18
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="NondiscrimEmergencyCarePolicy"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="NondiscrimEmergencyCarePolicy"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “No,” indicate the reasons why (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyCare"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility did not provide care for any emergency medical conditions
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyPolicy"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility did not have a policy relating to emergency medical care
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EmergencyCareLimited"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility limited who was eligible to receive care for emergency medical conditions (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherReason"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="6" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Charges for Medical Care
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    19
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate how the hospital facility determined the amounts generally billed to individuals who had insurance covering
                    emergency or other medically necessary care (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="LowestNegotiatedRates"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility used the lowest negotiated commercial insurance rate for those services at the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AverageNegotiatedRates"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility used the average of the three lowest negotiated commercial insurance rates for those services at the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicareRate"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility used the Medicare rate for those services
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethod"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    20
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility charge any of its patients who were eligible for assistance under the hospital facility’s financial
                    assistance policy, and to whom the hospital facility provided emergency or other medically necessary services, more than the
                    amounts generally billed to individuals who had insurance covering such care?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    20
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilled"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilled"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” explain in Part VI.
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility charge any of its patients an amount equal to the gross charge for services provided to that patient?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="GrossCharges"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="GrossCharges"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” explain in Part VI.
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
                
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
            </div>
          </xsl:if>   
              
          <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVSectionB">
            <!-- PAGE 4 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
              </div>
            </div>
            <!-- END Page Header  -->
          
            <!--  PART V  Section B - Facility Policies and Practices  -->
            <div style="width: 187mm;border-top-width:1px;">
              <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
                <span class="styPartName">Part V</span>
                <span style="width:168mm;" class="styPartDesc">Facility Information
                  <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
                </span>
              </div><br/>
              
              <div class="styLNDesc" style="width: 187mm;padding-top:0mm;font-size:8pt;font-weight:bold;">Section  B. Facility Policies and Practices.</div><br/>
              <span style="font-weight:normal;">(Complete a separate Section B for each of the hospital facilities listed in Part V, Section A)</span><br/>     
            </div>    
                       
            <span style="height:4mm;"/>   
            
            <div class="styLNDesc" style="width:187mm;">
              <span style="font-weight:bold;">Name of Hospital Facility:</span>
              <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:148mm;font-weight:normal;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="HospitalFacilityName"/>
                </xsl:call-template>
              </span><br/>  
            </div> 
            <div class="styLNDesc" style="width:187mm;">
              <span style="font-weight:bold;">Line Number of Hospital Facility (from Schedule H, Part V, Section A):</span>
              <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:90mm;font-weight:normal;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="HospitalFacilityNumber"/>
                </xsl:call-template>
              </span><br/><br/>  
            </div> 
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="4" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="3" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Community Health Needs Assessment <span style="font-weight:normal;">(Lines 1 through 7 are optional for 2010)</span>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                
                <!-- Part V Section B line 1 -->
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    1
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
                    During the tax year or any prior tax year, did the hospital facility conduct a community health needs assessment (“Needs
                    Assessment”)? If “No,” skip to question 8. <span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.....................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    1
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConducted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConducted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate what the Needs Assessment describes (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDefinition"/>
                      </xsl:call-template>
                    </input>
                    A definition of the community served by the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDemographics"/>
                      </xsl:call-template>
                    </input>
                    Demographics of the community 
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ExistingResources"/>
                      </xsl:call-template>
                    </input>
                    Existing health care facilities and resources within the community that are available to respond to the health needs of the community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="HowDataObtained"/>
                      </xsl:call-template>
                    </input>
                    How data was obtained 
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityHealthNeeds"/>
                      </xsl:call-template>
                    </input>
                    The health needs of the community  
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherHealthIssues"/>
                      </xsl:call-template>
                    </input>
                    Primary and chronic disease needs and other health issues of uninsured persons, low-income persons, and minority groups
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IdentifyingProcess"/>
                      </xsl:call-template>
                    </input>
                    The process for identifying and prioritizing community health needs and services to meet those needs 
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ConsultingProcess"/>
                      </xsl:call-template>
                    </input>
                    The process for consulting with persons representing the community’s interests  
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InformationGaps"/>
                      </xsl:call-template>
                    </input>
                    Information gaps that limit the hospital facility’s ability to assess all of the community’s health needs
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    j
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="Other"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    2
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Indicate the tax year the hospital facility last conducted a Needs Assessment: 20
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="NeedsAssessmentConducted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    3
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    In conducting its most recent Needs Assessment, did the hospital facility take into account input from persons who represent the
                    community served by the hospital facility? If “Yes,” describe in Part VI how the hospital facility took into account input from
                    persons who represent the community, and identify the persons the hospital facility consulted.
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    3
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccount"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccount"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    4
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility’s Needs Assessment conducted with one or more other hospital facilities? If “Yes,” list the other hospital facilities in Part VI.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...........................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    4
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="OtherFacilities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="OtherFacilities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    5
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility make its Needs Assessment widely available to the public?
                    <span class="styDotLn" style="float:none">...........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    5
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAWidelyAvailable"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAWidelyAvailable"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate how the Needs Assessment was made widely available (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OwnWebsite"/>
                      </xsl:call-template>
                    </input>
                    Hospital facility’s website
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OnRequest"/>
                      </xsl:call-template>
                    </input>
                    Available upon request from the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethod"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    6
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If the hospital facility addressed needs identified in its most recently conducted Needs Assessment, indicate how (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AdoptImplementStrategy"/>
                      </xsl:call-template>
                    </input>
                    Adoption of an implementation strategy to address the health needs of the hospital facility’s community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ExecuteImplementStrategy"/>
                      </xsl:call-template>
                    </input>
                    Execution of the implementation strategy
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DevelopCommunityPlan"/>
                      </xsl:call-template>
                    </input>
                    Development of a community benefit plan for the facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ParticipateCommunityPlan"/>
                      </xsl:call-template>
                    </input>
                     Participation in community-wide community benefit plan
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IncludeOperationalPlans"/>
                      </xsl:call-template>
                    </input>
                    Inclusion of a community benefit section in operational plans
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AdoptBudget"/>
                      </xsl:call-template>
                    </input>
                    Adoption of a budget for provision of services that address the needs identified in the CHNA
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PrioritizeHealthNeeds"/>
                      </xsl:call-template>
                    </input>
                    Prioritization of health needs in the community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PrioritizeServices"/>
                      </xsl:call-template>
                    </input>
                    Prioritization of services that the hospital facility will undertake to meet health needs in its community
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherNeedsAddressed"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    7
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility address all of the needs identified in its most recently conducted Needs Assessment?  If “No,” explain in Part VI which needs it has not addressed together with the reasons why it has not addressed such needs.
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    7
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AllNeedsAddressed"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AllNeedsAddressed"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="3" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Financial Assistance Policy
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td style="border-color:black;border-style:solid;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a written financial assistance policy that:
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    8
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Explains eligibility criteria for financial assistance, and whether such assistance includes free or discounted care?
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    8
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="EligibilityCriteriaExplained"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="EligibilityCriteriaExplained"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    9
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Used federal poverty guidelines (FPG) to determine eligibility for providing free care to low incomeindividuals?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">..</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    9
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGFree"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGFree"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate the FPG family income limit for eligibility for free care: 
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FPGFreePercent"/>
                      </xsl:call-template>
                    </span>%<br/>
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
            
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
            </div>
            
            <!-- PAGE 5 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span>
              </div>
            </div>
            <!-- END Page Header  -->
  
            <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
              <span class="styPartName">Part V</span>
              <span style="width:168mm;" class="styPartDesc">Facility Information
                <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
              </span>
            </div><br/>
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="4" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    10
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Used FPG to determine eligibility for providing discounted care to low income individuals?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    10
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGDiscounted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="UsesFPGDiscounted"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate the FPG family
                    income limit for eligibility for discounted care: 
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FPGDiscountPercent"/>
                      </xsl:call-template>
                    </span>%
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    11
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Explained the basis for calculating amounts charged to patients?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    11
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsBasis"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsBasis"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate the factors used in determining such amounts (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IncomeLevel"/>
                      </xsl:call-template>
                    </input>
                    Income level
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AssetLevel"/>
                      </xsl:call-template>
                    </input>
                    Asset level
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicalIndigency"/>
                      </xsl:call-template>
                    </input>
                    Medical indigency
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InsuranceStatus"/>
                      </xsl:call-template>
                    </input>
                    Insurance status
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="UninsuredDiscount"/>
                      </xsl:call-template>
                    </input>
                    Uninsured discount
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicaidMedicare"/>
                      </xsl:call-template>
                    </input>
                    Medicaid/Medicare
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="StateRegulation"/>
                      </xsl:call-template>
                    </input>
                    State regulation
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherFactors"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    12
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Explained the method for applying for financial assistance?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    12
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsApplicationMethod"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainsApplicationMethod"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Included measures to publicize the policy within the community served by the hospital facility?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasures"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasures"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate how the hospital facility publicized the policy (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PostedOnWebsite"/>
                      </xsl:call-template>
                    </input>
                    The policy was posted at all times on the hospital facility’s web site
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AttachedToInvoices"/>
                      </xsl:call-template>
                    </input>
                    The policy was attached to all billing invoices
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PostedInEmergencyRoom"/>
                      </xsl:call-template>
                    </input>
                    The policy was posted in the hospital facility’s emergency rooms or waiting rooms
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PostedInAdmissionOffice"/>
                      </xsl:call-template>
                    </input>
                    The policy was posted in the hospital facility’s admissions offices
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ProvidedOnAdmission"/>
                      </xsl:call-template>
                    </input>
                    The policy was provided, in writing, to patients upon admission to the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AvailableOnRequest"/>
                      </xsl:call-template>
                    </input>
                    The policy was available upon request
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherPublicity"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="6" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Billing and Collections
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a separate billing and collections policy, or a written financial
                    assistance policy that explained actions the hospital facility may take upon non-payment?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ActionsOnNonpayment"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ActionsOnNonpayment"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    15
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Check all of the following collection actions against a patient that were permitted under the hospital facility's policies at any time during the tax year:
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitReportToCreditAgency"/>
                      </xsl:call-template>
                    </input>
                    Reporting to credit agency
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitLawsuit"/>
                      </xsl:call-template>
                    </input>
                    Lawsuits
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitLienOnResidence"/>
                      </xsl:call-template>
                    </input>
                    Liens on residences
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitBodyAttachment"/>
                      </xsl:call-template>
                    </input>
                    Body attachments or arrests
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitOtherActions"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    16
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility engage in or authorize a third party to engage in any of the following collection actions during the tax
                    year?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    16
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivities"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” check all collection actions in which the hospital facility or a third party engaged (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ReportToCreditAgency"/>
                      </xsl:call-template>
                    </input>
                    Reporting to credit agency
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="Lawsuit"/>
                      </xsl:call-template>
                    </input>
                    Lawsuits
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="LienOnResidence"/>
                      </xsl:call-template>
                    </input>
                    Liens on residences
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="BodyAttachment"/>
                      </xsl:call-template>
                    </input>
                    Body attachments
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActions"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    17
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate which actions the hospital facility took before initiating any of the collection actions checked in question 16 (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NotifyUponAdmission"/>
                      </xsl:call-template>
                    </input>
                    Notified patients of the financial assistance policy upon admission
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NotifyBeforeDischarge"/>
                      </xsl:call-template>
                    </input>
                    Notified patients of the financial assistance policy prior to discharge
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NotifiedAllPatients"/>
                      </xsl:call-template>
                    </input>
                    Notified patients of the financial assistance policy in communications with the patients regarding the patients’ bills
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DocumentedDetermination"/>
                      </xsl:call-template>
                    </input>
                    Documented its determination of whether a patient who applied for financial assistance under the financial assistance policy
                    qualified for financial assistance
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActionsTaken"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
          
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
            </div>
            
            <!-- PAGE 6 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span>
              </div>
            </div>
            <!-- END Page Header  -->
  
            <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
              <span class="styPartName">Part V</span>
              <span style="width:168mm;" class="styPartDesc">Facility Information
                <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
              </span>
            </div><br/>
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="6" style="width:187mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Policy Relating to Emergency Medical Care
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="4" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    18
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a written policy relating to emergency medical care that requires the
                    hospital facility to provide, without discrimination, care for emergency medical conditions to individuals regardless of their
                    eligibility under the hospital facility’s financial assistance policy?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">..........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    18
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="NondiscrimEmergencyCarePolicy"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="NondiscrimEmergencyCarePolicy"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “No,” indicate the reasons why (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyCare"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility did not provide care for any emergency medical conditions
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyPolicy"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility did not have a policy relating to emergency medical care
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EmergencyCareLimited"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility limited who was eligible to receive care for emergency medical conditions (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherReason"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="6" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Charges for Medical Care
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    19
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate how the hospital facility determined the amounts generally billed to individuals who had insurance covering
                    emergency or other medically necessary care (check all that apply):
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="LowestNegotiatedRates"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility used the lowest negotiated commercial insurance rate for those services at the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;vertical-align:top;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AverageNegotiatedRates"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility used the average of the three lowest negotiated commercial insurance rates for those services at the hospital facility
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicareRate"/>
                      </xsl:call-template>
                    </input>
                    The hospital facility used the Medicare rate for those services
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input alt="alt" type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethod"/>
                      </xsl:call-template>
                    </input>
                    Other (describe in Part VI)
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    20
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility charge any of its patients who were eligible for assistance under the hospital facility’s financial
                    assistance policy, and to whom the hospital facility provided emergency or other medically necessary services, more than the
                    amounts generally billed to individuals who had insurance covering such care?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    20
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilled"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilled"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” explain in Part VI.
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility charge any of its patients an amount equal to the gross charge for services provided to that patient?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="GrossCharges"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="GrossCharges"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” explain in Part VI.
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
                
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
            </div>
          </xsl:for-each>

          <!-- PAGE 6 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2010</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!-- BEGIN Part V  Section C -->
          <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
            <span class="styPartName">Part V</span>
            <span style="width:168mm;" class="styPartDesc">Facility Information
              <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
            </span>
          </div><br/>
              
          <!-- Table expand/collapse toggle button-->
          <div style="float:right;clear:none;">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC"/>
              <xsl:with-param name="containerHeight" select="10"/>
              <xsl:with-param name="containerID" select=" 'PartVctn' "/>
            </xsl:call-template>
          </div>
          <!--Table expand/collapse toggle button end-->
            
          <div class="styTableContainer" id="PartVSecCctn" >
          
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:100%;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;border-right-width:0px;">
                <tr>
                  <th colspan="3" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:187mm;border-style:solid;border-color:black;border-bottom-width:1px; border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:187mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  C.  Other Facilities That Are Not Licensed, Registered, or Similarly Recognized as a Hospital Facility</b>
                    </div>
                    <span style="font-weight:normal;">(list in order of size, measured by total revenue per facility, from largest to smallest)</span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">How many non-hospital facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:50mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/NumberOfOtherFacilities"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:5mm;"/>
                  </th>
                </tr>
                <tr style="height:8mm;">
                  <th colspan="2" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:bottom;padding-top:2mm;width:102mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;">
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;width:85mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:8pt;">
                    <span style="font-weight:normal">Type of Facility (Describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities">
                
                  <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;=10)">
                    <tr>
                      <td style="width:7mm;vertical-align:top;">
                        <span style="width:3mm;font-weight:bold;">
                          <xsl:value-of select="position()"/>
                        </span>
                      </td>
                      <td class="styTableCellText" style="width:95mm;padding-left:1mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/Name/BusinessNameLine1"/>
                        </xsl:call-template>
                        <xsl:if test="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/Name/BusinessNameLine2 != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/Name/BusinessNameLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/Address"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:85mm;vertical-align:top;padding-left:1mm;text-align:left;border-right-width:0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/FacilityType"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt; 1 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <tr>
                      <td style="width:7mm;">
                        <span style="width:3mm;font-weight:bold;">
                          <xsl:value-of select="position()"/>
                        </span>
                      </td>
                    <td class="styTableCell" style="width:95mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px;width:85mm;text-align:left;">
                      <span style="width:2px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;2 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">2</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;3 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">3</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;4 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">4</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;5 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">5</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;6 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">6</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;7 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">7</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;8 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">8</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;9 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">9</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &lt;10 or ((count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">10</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
              </tbody>
            </table>
          </div> 
          
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select=" 'PartVSecCctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          <!-- END PART V  Section C   -->
          
          <!-- footer line -->
          <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
          </div>
          
          <!-- PAGE 8 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2010</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!-- Part VI  -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName">Part VI</div>
            <div class="styPartDesc">
              <b>Supplemental Information</b>
            </div>
          </div>
          
          <!-- PART VI   Supplemental Information -->
          <div class="styNBB" style="width:187mm; padding-top:1mm;">        
            Complete this part to provide the following information.
          </div>
          
          <span style="height:2mm;"/>
          
          <table style="width:187mm;font-size:7pt;">
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">1</td>
                  <td style="width:177mm;">
                    <b>Required descriptions.</b> Provide the description required for Part I, lines 3c, 6a, and 7; Part II; Part III, lines 4, 8, and 9b; and
                    Part V, Section B, lines 1j, 2, 4c, 6i, 7, 11i, 13i, 17l, 18l, 19e, 21d, 25, and 26.
                  </td>
                </tr>
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">2</td>
                  <td style="width:177mm;">
                    <b>Community health needs assessment.</b> Describe how the organization assesses the health care needs of the communities it
                    serves, in addition to any community health needs assessments reported in Part V, Section B.
                  </td>
                </tr> 
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">3</td>
                  <td style="width:177mm;">
                    <b>Patient education of eligibility for assistance.</b> Describe how the organization informs and educates patients and persons
                    who may be billed for patient care about their eligibility for assistance under federal, state, or local government programs or
                    under the organization’s financial assistance policy.
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">4</td>
                  <td style="width:177mm;">
                    <b>Community information.</b> Describe the community the organization serves, taking into account the geographic area and
                    demographic constituents it serves.
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">5</td>
                  <td style="width:177mm;">
                    <b>Promotion of community health.</b> Provide any other information important to describing how the organization’s hospital facilities or
                    other health care facilities further its exempt purpose by promoting the health of the community (e.g., open medical staff, community
                    board, use of surplus funds, etc.).
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">6</td>
                  <td style="width:177mm;">
                    <b>Affiliated health care system.</b> If the organization is part of an affiliated health care system, describe the respective roles of the
                    organization and its affiliates in promoting the health of the communities served.
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;text-align:center;vertical-align:top;">7</td>
                  <td style="width:177mm;">
                    <b>State filing of community benefit report.</b> If applicable, identify all states with which the organization, or a related
                    organization, files a community benefit report.
                  </td>
                </tr>                
          </table>
          
          <span style="height:4mm;"/>
          
          <table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Identifier</th>
                  <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">ReturnReference </th>
                  <th class="styDepTblCell" scope="col" style="width:87mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Explanation  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVI">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;height:7mm;width:50mm;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Identifier"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                    <td class="styTableCell" style="font-size:7pt;border-color:black;width:50mm;text-align:left;padding-top:1mm;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ReturnReference"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                    <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:87mm;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Explanation"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <!--<div class="styNBB" style="width:187mm;float:none;clear:both;">-->
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2010</div>
          </div>
          <!-- END Part VI -->
          
          <!-- Begininning of write-in data -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input alt="alt" class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          
          <!-- Part IV - Begin separated repeating data table -->
          <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part IV -  Management Companies and Joint Ventures</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:6.5pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:50mm;border-color:black;" scope="col">
                    <b>(a)</b> Name of Entity    
                  </th>
                  <th class="styDepTblCell" style="width:60mm;border-color:black;" scope="col">
                    <b>(b)</b> Description of primary<br/>activity of entity
                  </th>
                  <th class="styDepTblCell" style="width:27mm;border-color:black;" scope="col">
                    <b>(c)</b> Organization's<br/>profit % or stock ownership %
                  </th>
                  <th class="styDepTblCell" style="width:28mm;border-left-width:1px;border-color:black;" scope="col">
                    <b>(d)</b> Officers, directors, trustees, or key employees' profit % or stock ownership %
                  </th>
                  <th class="styDepTblCell" style="width:22mm;border-color:black;border-right-width:0px;" scope="col">
                    <b>(e)</b> Physicians' profit % or stock ownership %
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartIV">
                  <tr style="height:6mm;">
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:50mm;vertical-align:top;text-align:left;">
                      <span style="width:5mm;font-weight:bold;">
                        <xsl:number value="position()" format="1"/>
                      </span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
                      </xsl:call-template>
                      <xsl:if test="NameOfEntity/BusinessNameLine2 !=''">
                        <br/>
                        <span style="width:5mm;"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styDepTblCell" style="width:60mm;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DescriptionEntPrimaryActivity"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="width:27mm;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="OrganizationProfitOrOwnership"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="width:28mm;text-align:right;vertical-align:top;border-left-width:1px;">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="OfficersEtcProfitOrOwnership"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="width:22mm;text-align:right;vertical-align:top;">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="PhysicansProfitOrOwnership"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          
          <!-- BEGIN Part V Section A Repeating Table -->
          <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/Form990ScheduleHPartVSectionA) &gt;= 16)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part V Section  A. Hospital Facilities</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead" style="font-size:7pt;">
                <tr class="styDepTblHdr">
                  <th class="styTableCellHeader" colspan="2" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:100mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:100mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  A. Hospital Facilities</b>
                    </div>
                    <span style="font-weight:normal;">(list in order of size, measured by total revenue per facility, from largest to smallest)</span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">How many hospital facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:20mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/NumberOfHospitalFacilities"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:30mm;"/>
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:1px; vertical-align:top;border-right-width:1px;border-top-width:0px;border-bottom-width:1px;padding-top:9mm; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_LicHosp.gif" alt="Licensed Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_GenMedSurg.gif" alt="General-Medical-Surgical"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px; border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ChildHosp.gif" alt="Children's Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;vertical-align:top;border-right-width:1px;border-top-width:0px;border-bottom-width:1px;padding-top:9mm;  " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_TeachHosp.gif" alt="Teaching Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_CriticalHosp.gif" alt="Critical Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ResearchFac.gif" alt="Research Facility"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ER-24hrs.gif" alt="ER-24Hours"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ER-Other.gif" alt="ER-Other"/>
                  </th>
                   <th class="styDepTblCell" scope="col" style="vertical-align:top;width:45mm;border-bottom-width:1px;border-style:solid;border-color:black; border-right-width:0px">Other <br/> (Describe)
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVSectionA">
                
                  <!-- Adding the separator section -->
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styTableCellCtr " style="width:10mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FacilityNumber"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellText" style="width:90mm;text-align:left;">
                      <xsl:if test="Name/BusinessNameLine1 != ''">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="Name/BusinessNameLine2 != ''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
                        </xsl:call-template>
                      </xsl:if>
                      <br/>
                      <xsl:if test="Address != ''">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="Address"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="LicensedHospital"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GeneralMedicalAndSurgical"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ChildrensHospital"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TeachingHospital"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CriticalAccessHospital"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ResearchFacility"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Er24Hours"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ErOther"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellText" style="border-right-width:0px;text-align:left;padding-right:1px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Other"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          
          <!-- BEGIN Part V Section C Repeating Table -->
          <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities) &gt; 10)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part V Section  C.  Other Facilities That Are Not Licensed, Registered, or Similarly Recognized as a Hospital Facility</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead" style="font-size:7pt;">
                <tr class="styDepTblHdr">
                  <th class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:102mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:1px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:102mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  C.  Other Facilities That Are Not Licensed, Registered, or Similarly Recognized as a Hospital Facility</b>
                    </div>
                    <span style="font-weight:normal;">(list in order of size, measured by total revenue per facility, from largest to smallest)</span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">How many non-hospital facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:20mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/NumberOfOtherFacilities"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;padding-bottom:1mm;width:85mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:8pt;">
                    <span style="font-weight:normal">Type of Facility  <br/> (Describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities">
                
                  <!-- Adding the separator section -->
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                    <xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styTableCellText" style="width:102mm;padding-left:1mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/Name/BusinessNameLine1"/>
                        </xsl:call-template>
                        <xsl:if test="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/Name/OtherFacilities/BusinessNameLine2 != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/Name/OtherFacilities/BusinessNameLine2"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/Address"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:85mm;padding-left:1mm;text-align:left;vertical-align:top;border-right-width:0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVSectionC/OtherFacilities/FacilityType"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="populateirs990SchHpart4emptycells">
    <xsl:param name="index"/>
    <xsl:param name="end">false</xsl:param>
    <xsl:param name="IsSeparated">false</xsl:param>
    <tr style="height:6mm;">
      <xsl:if test="($end = 'false')">
        <td class="styTableCell" style="width:50mm;vertical-align:top;text-align:left;border-color:black;">
          <span class="styLNLeftNumBox" style="padding-left:0mm;text-align:left;width:3mm;">
            <xsl:value-of select="$index"/>
          </span>
          <xsl:if test="$IsSeparated != 'false' ">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartIV"/>
            </xsl:call-template>
          </xsl:if>
        </td>
        <td class="styTableCell" style="width:60mm;text-align:left;border-color:black;">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="width:27mm;text-align:left;border-color:black;">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="width:28mm;border-left-width:0px;text-align:right;border-color:black;">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="width:22mm;border-color:black;border-right-width:0px;text-align:right;">
          <span class="styTableCellPad"/>
        </td>
      </xsl:if>
      <xsl:if test="($end != 'false')">
        <td class="styTableCell" style="width:50mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;">
          <span class="styLNLeftNumBox" style="padding-left:0mm;text-align:left;">
            <xsl:value-of select="$index"/>
          </span>
        </td>
        <td class="styTableCell" style="width:60mm;text-align:left;border-color:black;border-bottom-width:0px;">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="width:27mm;text-align:right;border-color:black;border-bottom-width:0px;">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="width:28mm;border-left-width:0px;text-align:right;border-color:black;border-bottom-width:0px;">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="width:22mm;border-color:black;text-align:right;border-right-width:0px;border-bottom-width:0px;">
          <span class="styTableCellPad"/>
        </td>
      </xsl:if>
    </tr>
  </xsl:template>
  
  <xsl:template name="IRS990SchHPartVTableFillerRow">
    <tr>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCellText" style="width:93mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="border-right-width:0px;height:4mm;">
        <span style="width:1px"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template name="IRS990SchHPartVSecCTableFillerRow">
    <xsl:param name="index"/>
    
    <tr>
      <td style="width:7mm;vertical-align:top;">
        <span style="width:3mm;font-weight:bold;">
          <xsl:value-of select="$index"/>
        </span>
      </td>
      <td class="styTableCellText" style="width:95mm;height:4mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="border-right-width:0px;width:85mm;height:4mm;">
        <span style="width:1px"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
