<?xml version="1.0" encoding="UTF-8"?>
<!--<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>-->
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
              <div class="styMainTitle" style="padding-top:1mm;font-size:14pt;">Hospitals
          </div>
              <div class="styFBT" style="padding-top:1mm;">
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/>
            To be completed by organizations that answer "Yes" to Form 990, <br/>Part IV, line 20.<br/>
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/> Attach to Form 990.

          </div>
              <div/>
            </div>
            <div class="styTYBox" style="width:30.5mm;">
              <div class="styOMB">OMB No. 1545-0047</div>
              <div class="styTaxYear" style="height:4mm;padding-top:0mm;padding-bottom:0mm;">20<span class="styTYColor">08</span>
              </div>
              <div class="styPartName" style="font-size:6.5pt;width:30.5mm;padding-top:0mm;text-align:left;padding-left:5mm;">Open to Public Inspection</div>
            </div>
          </div>
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styFNBox" style="width:134mm;height:8mm;">
     Name of the organization<br/>
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
            <div class="styPartDesc" style=" width: 167mm">Charity Care and Certain Other Community Benefits at Cost
       <span class="styNormalText">
                <i>(Optional for 2008)</i>
              </span>
            </div>
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
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToAllHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToAllHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToAllHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToAllHospitals
            </xsl:with-param>
                  </xsl:call-template>
          Applied uniformly to all hospitals
        </label>
              </span>
              <span style="width:75mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToMostHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToMostHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyAppliedToMostHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToMostHospitals
            </xsl:with-param>
                  </xsl:call-template>
         Applied uniformly to most hospitals
        </label>
              </span>
              <span style="width:75mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyTailoredToIndHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyTailoredToIndHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PolicyTailoredToIndHospitals"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyTailoredToIndHospitals
            </xsl:with-param>
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
         income individuals? If "Yes," indicate which of the following is the family income limit for eligibility for free care: <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
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
              <span style="width:25mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         100%
        </label>
              </span>
              <span style="width:25mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         150%
        </label>
              </span>
              <span style="width:25mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         200%
        </label>
              </span>
              <span style="width:50mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherPercentage/Other"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHOtherPercentage</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherPercentage/Other"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHOtherPercentage
            </xsl:with-param>
                  </xsl:call-template>
         Other  <span class="styIRS990ScheduleHUnderlinedText" style="text-align: right">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherPercentage/FreeOtherPercentage"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 1mm">%</span>
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
         Does the organization use FPG to determine eligibility for providing <i>discounted</i> care  to low income individuals? If </span>
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
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         200%
        </label>
              </span>
              <span style="width:23mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         250%
        </label>
              </span>
              <span style="width:23mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         300%
        </label>
              </span>
              <span style="width:23mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         350%
        </label>
              </span>
              <span style="width:23mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         400%
        </label>
              </span>
              <span style="width:40mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
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
         Other  <span class="styIRS990ScheduleHUnderlinedBox" style="font-size: 7pt; width:15mm;text-align: right">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedOther/DiscountedOtherPercentage"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 1mm">%</span>
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
         If the organization does not use FPG to determine eligibility, describe in Part VI the income based criteria for determining eligibility for free or discounted care. Include in the description whether the organization uses an asset test or other threshold, regardless of income, to determine eligibility for free or discounted care. </span>
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
          <!--***************************************************************************************************************************************************************************************************************************************************************************************************************************************-->
          <!--  Line 7  Charity Care and Certain Other Community Benefits at Cost  -->
          <div style="width:187mm;height:3mm;border-style:solid; border-bottom-width:1px;border-top-width:1px; border-right-width:0px;border-left-width:0px;padding-top:0mm;float:left;">
            <div class="styLNLeftNumBox" style="height:3mm;padding-left:2mm;padding-top:0mm;">7</div>
            <span class="styNormalText" style="width:170mm;padding-top:0mm;">
              <span style="width:2mm;"/>Charity Care and Certain Other Community Benefits at Cost
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
                    <span class="styBoldText">
                           (a)</span> Number of activities or programs (optional)</th>
                  <th class="styIRS990ScheduleHTheadCell" style="width:16mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">
                           (b)</span> Persons served (optional)</th>
                  <th class="styIRS990ScheduleHTheadCell" style="width:30mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">
                           (c)</span> Total community benefit expense</th>
                  <th class="styIRS990ScheduleHTheadCell" style="width:30mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">
                           (d)</span> Direct offsetting revenue</th>
                  <th class="styIRS990ScheduleHTheadCell" style="width:30mm;font-size:6pt;" scope="col">
                    <span class="styBoldText">
                           (e)</span> Net community benefit expense</th>
                  <th class="styIRS990ScheduleHTheadCell" style="width:17mm;border-right-width:0px;font-size:6pt;" scope="col">
                    <span class="styBoldText">
                           (f)</span> Percent of total expense</th>
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
                    <i>worksheets 1 and 2)</i>
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CharityCareAtCost/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CharityCareAtCost/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CharityCareAtCost/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CharityCareAtCost/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CharityCareAtCost/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CharityCareAtCost/PercentOfTotalExpense"/>
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
                    <span style="width: 7mm"/>
                    <i>worksheet 3, column a)</i>
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">.</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedMedicaid/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedMedicaid/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedMedicaid/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedMedicaid/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedMedicaid/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedMedicaid/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 7c -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm;" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">c</span>
                    <span style="width:2mm;"/>
         Unreimbursed costs—other <br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
         means-tested government   
          <span class="styNormalText"/>
                    <span style="width: 7mm"/>
			 programs (from <i>Worksheet 3, </i>
                    <span class="styItalicText"/>
                    <span style="width: 7mm"/>
                    <i>column b)</i>
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">....</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedCosts/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedCosts/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedCosts/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedCosts/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedCosts/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              UnreimbursedCosts/PercentOfTotalExpense"/>
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
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCharityCare/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCharityCare/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCharityCare/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCharityCare/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCharityCare/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCharityCare/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--  Line 7e  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:12mm;font-size:7pt;">Other Benefits</span>
                    <span style="width:2mm"/>
                    <br/>
                    <span class="styBoldText" style="padding-left:2mm">e</span>
                    <span style="width:2mm"/>
           Community health improve-<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
            ment services and community<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
			 benefit operations (from<br/>
                    <span class="styNormalText"/>
                    <span style="width: 7mm"/>
			(worksheet 4)
	
                 <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">....</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunityHealthServices/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunityHealthServices/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunityHealthServices/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunityHealthServices/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunityHealthServices/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunityHealthServices/PercentOfTotalExpense"/>
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
         (from worksheet 5)
                 <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthProfessionsEducation/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthProfessionsEducation/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthProfessionsEducation/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthProfessionsEducation/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthProfessionsEducation/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthProfessionsEducation/PercentOfTotalExpense"/>
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
         (from worksheet 6)
                 <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              SubsidizedHealthServices/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              SubsidizedHealthServices/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              SubsidizedHealthServices/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              SubsidizedHealthServices/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              SubsidizedHealthServices/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              SubsidizedHealthServices/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 7h  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;width:41mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">h</span>
                    <span style="width:2mm"/>
         Research (from worksheet 7)
               <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;"/>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Research/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Research/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Research/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Research/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Research/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Research/PercentOfTotalExpense"/>
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
			 (from worksheet 8)
				
                 <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CashAndInKindContributions/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CashAndInKindContributions/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CashAndInKindContributions/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CashAndInKindContributions/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CashAndInKindContributions/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CashAndInKindContributions/PercentOfTotalExpense"/>
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
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalOtherBenefits/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalOtherBenefits/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalOtherBenefits/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalOtherBenefits/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalOtherBenefits/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalOtherBenefits/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!-- Line 7k  -->
                <tr>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px; width: 44mm" colspan="2">
                    <span class="styBoldText" style="padding-left:2mm">k</span>
                    <span style="width:2mm"/>
                    <b>Total</b>
                    <span class="styNormalText"/> (line 7d and 7j)
               <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;">...</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCommunityBenefits/NumberOfActivitiesOrPrograms"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCommunityBenefits/PersonsServed"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCommunityBenefits/TotalCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCommunityBenefits/DirectOffsettingRevenue"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCommunityBenefits/NetCommunityBenefitExpense"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              TotalCommunityBenefits/PercentOfTotalExpense"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <span style="width:112mm;font-size:6.25pt;font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the instructions for Form 990.</span>
            <span style="width:6mm;font-size:6.25pt;"/>Cat. No. 50192T
      <span style="width:9mm;"/>
            <span style="font-weight:bold;font-size:6.25pt;">Schedule H (Form 990) 2008</span>
          </div>
          <!-- PAGE2HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2008</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header  -->
          <!-- BEGIN PART II TITLE -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part II</div>
            <div class="styPartDesc">
              <b>Community Building Activities</b>
              <span class="styNormalText"> (Complete this table if the organization conducted any community building activities)            			<i>(Optional for 2008)</i>
              </span>
            </div>
          </div>
          <!--  BEGIN PART II  TABLE  -->
          <table class="styTable" id="IRS990ScheduleHPartIITable" summary="Community Building Activities" cellspacing="0" cellpadding="0" style="font-size:6pt;width:187mm;">
            <tr>
              <th class="styLNLeftNumBoxBB" style="width:5mm;height:4mm;padding-left:2mm;" scope="col"/>
              <th class="styIRS990ScheduleHTheadCell" style="width:41mm;padding-bottom:0mm;" scope="col"/>
              <th class="styIRS990ScheduleHTheadCell" style="width:19mm;font-size:6.25pt;padding-bottom:1px;" scope="col">
                <span class="styBoldText">
                           (a)</span> Number of activities or programs (optional)</th>
              <th class="styIRS990ScheduleHTheadCell" style="width:19mm;font-size:6.25pt;" scope="col">
                <span class="styBoldText">
                           (b)</span> Persons served (optional)</th>
              <th class="styIRS990ScheduleHTheadCell" style="width:28mm;font-size:6.25pt;" scope="col">
                <span class="styBoldText">
                           (c)</span> Total community building expense</th>
              <th class="styIRS990ScheduleHTheadCell" style="width:28mm;font-size:6.25pt;" scope="col">
                <span class="styBoldText">
                           (d)</span> Direct offsetting<br/> revenue</th>
              <th class="styIRS990ScheduleHTheadCell" style="width:28mm;font-size:6.25pt;" scope="col">
                <span class="styBoldText">
                           (e)</span> Net community building expense</th>
              <th class="styIRS990ScheduleHTheadCell" style="width:19mm;font-size:6.25pt;" scope="col">
                <span class="styBoldText">
                           (f)</span> Percent of total expense</th>
            </tr>
            <!--  PART II  Line 1 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:1px;width:4mm;padding-left:2mm;padding-top:0mm;font-size:6.25pt;padding-bottom:2mm;">1</td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:1px;padding-top:1px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">Physical improvements and housing</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              PhysicalImprovementsAndHousing/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              PhysicalImprovementsAndHousing/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              PhysicalImprovementsAndHousing/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              PhysicalImprovementsAndHousing/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              PhysicalImprovementsAndHousing/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              PhysicalImprovementsAndHousing/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 2-->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:2mm;font-size:6.25pt;">2</td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">				Economic development</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EconomicDevelopment/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EconomicDevelopment/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EconomicDevelopment/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EconomicDevelopment/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EconomicDevelopment/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EconomicDevelopment/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 3 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:2mm;font-size:6.25pt;">3</td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">				Community support</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunitySupport/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunitySupport/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunitySupport/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunitySupport/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunitySupport/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CommunitySupport/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 4 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:2mm;font-size:6.25pt;">4</td>
              <td class="styIRS990ScheduleHCell" style="border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;">				Environmental improvements</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EnvironmentalImprovements/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EnvironmentalImprovements/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EnvironmentalImprovements/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EnvironmentalImprovements/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EnvironmentalImprovements/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              EnvironmentalImprovements/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 5 -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:1mm;padding-bottom:3mm;font-size:6.25pt;">5</td>
              <td class="styIRS990ScheduleHCell" style="padding-top:0mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;font-size:6.25pt;"> Leadership development and training for community members</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              LeadershipDevelopment/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              LeadershipDevelopment/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              LeadershipDevelopment/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              LeadershipDevelopment/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              LeadershipDevelopment/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              LeadershipDevelopment/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 6-->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:.5mm;font-size:6.25pt;">6</td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> Coalition building</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CoalitionBuilding/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CoalitionBuilding/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CoalitionBuilding/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CoalitionBuilding/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CoalitionBuilding/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              CoalitionBuilding/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 7   -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:2.5mm;font-size:6.25pt;">7</td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> Community health improvement advocacy</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthImprovementAdvocacy/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthImprovementAdvocacy/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthImprovementAdvocacy/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthImprovementAdvocacy/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthImprovementAdvocacy/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              HealthImprovementAdvocacy/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 8   -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:.5mm;font-size:6.25pt;">8</td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> Workforce development</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              WorkforceDevelopment/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              WorkforceDevelopment/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              WorkforceDevelopment/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              WorkforceDevelopment/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              WorkforceDevelopment/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              WorkforceDevelopment/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 9  -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:2mm;padding-top:0mm;padding-bottom:.5mm;font-size:6.25pt;">9</td>
              <td class="styIRS990ScheduleHCell" style="padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;"> Other</td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Other/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Other/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Other/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Other/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Other/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Other/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
            <!--  PART II  Line 10  -->
            <tr>
              <td class="styLNLeftNumBoxBB" style="border-top-width:0px;width:4mm;padding-left:0mm;padding-top:0mm;padding-bottom:.5mm;border-color:black;font-size:6.25pt;">10</td>
              <td class="styIRS990ScheduleHCell" style="border-bottom-width:1px;padding-top:.5mm;border-top-width:0px;width:41mm;text-align:left;border-left-width:0px;padding-bottom:.5mm;font-size:6.25pt;">
                <b>Total</b>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Total/NumberOfActivitiesOrPrograms"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Total/PersonsServed"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Total/TotalCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Total/DirectOffsettingRevenue"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Total/NetCommunityBuildingExpense"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/
              Total/PercentOfTotalExpense"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc">
              <b>Bad Debt, Medicare, and Collection Practices</b>
              <span class="styNormalText">
                <i> (Optional for 2008)</i>
              </span>
            </div>
          </div>
          <!--  PART III  Line 1  -->
          <div style="width:187mm;">
            <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;"/>
            <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
              <div class="IRS990ScheduleH_LineDesc" style="width:163.25mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                <b>Section  A—Bad Debt Expense</b>
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
           Does the organization report bad debt expense in accordance with Heathcare Financial Management Association Statement No. 15?<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........................</span>
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
            <div class="styLNRightNumBox" style="padding-top:.5mm;">2</div>
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
              <span style="float:left; clear: none">Enter the estimated amount of the organization's bad debt expense (at cost)<span style="width:12mm;"/> attributable to patients eligible under the organization's charity care policy</span>
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
              <span style="float:left; clear: none">Provide in Part VI the text of the footnote to the organization's financial statements that describes bad debt expense. In addition, describe the costing methodology used in determining the amounts reported on lines 2 and 3, or rationale for including other bad debt amounts in community benefit.</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          <!--  PART III  Section B - Medicare  -->
          <div style="width: 187mm">
            <div class="styLNDesc" style="width: 163mm;padding-top:0mm;font-weight:bold">Section  B—Medicare</div>
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
              <span style="float:left; clear: none">Enter: line 5 less line  6—surplus or (shortfall)</span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span>
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
              <span style="float:left; clear: none">Describe in Part VI the extent to which any shortfall reported on line 7 should be treated as community benefit, and the costing methodology or source used to determine the amount reported on line 6 and indicate which of the following methods was used:</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:10mm;padding-bottom:1mm;border-top-width:0px;"/>
            <!-- line 8 check boxes -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;"/>
              <div class="styLNDesc" style="width:155mm;height:5mm;">
                <span style="width:50mm;">
                  <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostAccountingSystem"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostAccountingSystem</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostAccountingSystem"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostAccountingSystem
            </xsl:with-param>
                    </xsl:call-template>
          Cost accounting system
        </label>
                </span>
                <span style="width:50mm;">
                  <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostToChargeRatio"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostToChargeRatio</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/CostToChargeRatio"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostToChargeRatio
            </xsl:with-param>
                    </xsl:call-template>
         Cost to charge ratio
        </label>
                </span>
                <span style="width:50mm;">
                  <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/Other"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsed/Other"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHOther
            </xsl:with-param>
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
              <div class="styLNDesc" style="width: 163mm;padding-top:0mm;font-weight:bold">Section  C—Collection Practices</div>
              <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm; padding-bottom:1mm;border-top-width:0px;"/>
              <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1mm;border-top-width:0px;"/>
              <div class="styShadingCell" style="background-color:white;width:8mm;height:4mm;padding-bottom:1mm;border-top-width:0px;"/>
            </div>
            <!-- PART III  -  Section C   -  Line 9a  -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">9a</div>
              <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
                <span class="styNormalText">
           Does the organization have a written debt collection policy?<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span>
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
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">9b</div>
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
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!--   PART  IV   Management Companies and Joint Ventures -->
          <div class="styBB" style="width:187mm;height:4mm;border-top-width:1px;">
            <div class="styPartName">Part IV</div>
            <div class="styPartDesc" style="width:110mm;">
              <b>Management Companies and Joint Ventures</b>
              <span class="styNormalText">
                <i> (Optional for 2008)</i>
              </span>
            </div>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartIV"/>
              <xsl:with-param name="containerHeight" select="14"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'Part4ctn' "/>
            </xsl:call-template>
          </div>
          <div class="styTableContainer" id="Part4ctn" style="height:30mm;">
            <xsl:call-template name="SetInitialState"/>
            <table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
              <thead class="styTableThead">
                <tr style="height:6mm;">
                  <th class="styTableCellHeader" style="width:50mm;border-color:black;font-weight:normal;" scope="col">
                    <b>(a)</b> Name of entity    
                </th>
                  <th class="styTableCellHeader" style="width:60mm;border-color:black;font-weight:normal;" scope="col">
                    <b>(b)</b> Description of primary <br/> activity of entity
                </th>
                  <th class="styTableCellHeader" style="width:26mm;border-right-width:0px;border-color:black;font-weight:normal;" scope="col">
                    <b>(c)</b> Organization's<br/>profit % or stock<br/>ownership %
                </th>
                  <th class="styTableCellHeader" style="width:29mm;padding-top:1mm;padding-bottom:1mm;padding-left:1mm;border-left-width:1px;border-color:black;font-weight:normal;" scope="col">
                    <b>(d)</b> Officers, directors<br/>trustees, or key <br/>employees' profit % <br/>or stock ownership%
                </th>
                  <th class="styTableCellHeader" style="width:22mm;border-color:black;text-align:center;border-right-width:0px;font-weight:normal;" scope="col">
                    <b>(e)</b> Physicians'<br/>profit % or stock<br/>ownership %.
                </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartIV ">
                    <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt;=15) ">
                      <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartIV">
                        <tr style="height:4mm;">
                          <td class="styTableCell" style="width:50mm;vertical-align:top;text-align:left;border-color:black;">
                            <xsl:if test="position() = last() and position() &gt;= 14">
                              <xsl:attribute name="style">width:50mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                              <xsl:when test="position() &lt;15 ">
                                <span style="width:3mm;font-weight:bold;">
                                  <xsl:value-of select="position()"/>
                                </span>
                              </xsl:when>
                              <xsl:otherwise>
                                <span style="width:3mm;"/>
                              </xsl:otherwise>
                            </xsl:choose>
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
                            <xsl:if test="position()=last() and position() &gt;= 14">
                              <xsl:attribute name="style">width:60mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="DescriptionEntPrimaryActivity"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <!--COL  C  -->
                          <td class="styTableCell" style="width:27mm;text-align:right;border-color:black;vertical-align:top;">
                            <xsl:if test="position()=last() and position() &gt;= 14">
                              <xsl:attribute name="style">width:27mm;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="OrganizationProfitOrOwnership"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <!--  <td class="styTableCell" style="width:27mm;border-style:solid;border-right-width:0px;text-align:right;border-color:black;vertical-align:top;">
                        <xsl:if test="position()=last() and position() &gt;= 14">
                          <xsl:attribute name="style">width:27mm;border-right-width:0px;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulatePercent">
                          <xsl:with-param name="TargetNode" select="OrganizationProfitOrOwnership" />
                        </xsl:call-template>
                        <span class="styTableCellPad"></span>
                      </td>-->
                          <td class="styTableCell" style="width:28mm;border-left-width:0px;text-align:right;border-color:black;vertical-align:top;">
                            <xsl:if test="position()=last() and position() &gt;= 14">
                              <xsl:attribute name="style">width:28mm;border-left-width:0px;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px; </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="OfficersEtcProfitOrOwnership"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styTableCell" style="width:22mm;text-align:right;border-color:black;vertical-align:top;border-right-width:0px;">
                            <xsl:if test="position()=last() and position() &gt;= 14">
                              <xsl:attribute name="style">width:22mm;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
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
                    <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartIV) &lt; 14 or ((count($Form990ScheduleHData/Form990ScheduleHPartIV) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">14</xsl:with-param>
                        <xsl:with-param name="end">true</xsl:with-param>
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
                    <xsl:call-template name="populateirs990SchHpart4emptycells">
                      <xsl:with-param name="index">14</xsl:with-param>
                      <xsl:with-param name="end">true</xsl:with-param>
                    </xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartIV"/>
            <xsl:with-param name="containerHeight" select="14"/>
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
              <span class="styBoldText" style="font-size:7pt;">Schedule H (Form 990) 2008</span>
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- PAGE 3 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2008</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
            </div>
          </div>
          <!-- END Page Header  -->
          <!--  Begin PART V  Facility Information  ####################################################################################################################################-->
          <!-- Part V table code -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <span class="styPartName" style="width:16mm;">Part V</span>
            <span style="width:158mm;" class="styPartDesc">Facility Information<span style="width:1px;"/>
              <span class="styItalicText" style="font-weight:normal;">  (Required for 2008)</span>
            </span>
            <!-- Table expand/collapse toggle button-->
            <div style="float:right;clear:all;width:7mm;text-align:right;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartV"/>
                <xsl:with-param name="containerHeight" select="16"/>
                <xsl:with-param name="containerID" select=" 'PartVctn' "/>
              </xsl:call-template>
            </div>
            <!--Table expand/collapse toggle button end-->
          </div>
          <!-- BEGIN Part V Table -->
          <div class="styTableContainerBB" id="PartVctn">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;">
                <tr>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:top;padding-top:5mm;width:85mm;border-bottom-width:1px;border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;">
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:1px;vertical-align:top;padding-top:1mm;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_LicHosp.gif" alt="Licensed Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_GenMedSurg.gif" alt="General-Medical-Surgical"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ChildHosp.gif" alt="Children's Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_TeachHosp.gif" alt="Teaching Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_CriticalHosp.gif" alt="Critical Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ResearchFac.gif" alt="Research Facility"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ER-24hrs.gif" alt="ER-24Hours"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:1mm;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ER-Other.gif" alt="ER-Other"/>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:top;padding-top:5mm;width:45mm;border-bottom-width:1px;border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:8pt;">
                    <span style="font-weight:normal">Other <br/> (Describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartV">
                  <!-- Adding the separator section -->
                  <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/Form990ScheduleHPartV) &lt;16)">
                    <tr>
                      <td class="styTableCellText" style="width:85mm;padding-left:1mm;">
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
                        <xsl:if test="Address/AddressUS != ''">
                          <xsl:call-template name="PopulateUSAddressTemplate">
                            <xsl:with-param name="TargetNode" select="Address/AddressUS"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="Address/AddressForeign != ''">
                          <xsl:call-template name="PopulateForeignAddressTemplate">
                            <xsl:with-param name="TargetNode" select="Address/AddressForeign"/>
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
                      <td class="styTableCell" style="width:50mm;padding-left:1mm;text-align:left;border-right-width:0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Other"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartV) &lt; 1 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCellText" style="width:71mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartV"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="width:36mm;text-align:left;">
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px">
                      <span style="width:2px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartV) &lt; 1 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;2 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;3 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;4 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;5 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;6 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;7 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;8 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;9 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;10 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;11 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;12 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;13 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;14 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;15 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/Form990ScheduleHPartV) &lt;16 or ((count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartV"/>
            <xsl:with-param name="containerHeight" select="16"/>
            <xsl:with-param name="containerID" select=" 'PartVctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          <!-- END Part V Table -->
          <!-- footer line -->
          <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2008</div>
          </div>
          <!-- PAGE 4 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2008</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
            </div>
          </div>
          <!-- END Page Header  -->
          <!-- Part VI  -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName">Part VI</div>
            <div class="styPartDesc">
              <b>Supplemental Information</b>
              <span class="styNormalText">
                <i> (Optional for 2008)</i>
              </span>
            </div>
          </div>
          
          <!-- PART VI   Supplemental Information -->
          <div class="styNBB" style="width:187mm; padding-top:1mm;">        
        Complete this part to provide the following information.</div>
          <!--  Line 1  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;width:5mm;padding-top:1mm;">1</div>
            <div class="styLNDesc" style="width:172mm;height:4mm;padding-top:1mm;font-size:7pt;"> Provide the description required for Part I, line 3c; Part I, line 6a; Part I, line 7g; Part I, line 7, column (f); Part I, line 7; Part III, line 4; Part III, line 8; Part III, line 9b, and Part V.  See Instructions.
</div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/IncomeBasedCriteria)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/IncomeBasedCriteria = ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/IncomeBasedCriteria "/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
            <div style="width:187mm;"/>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/CostingMethodUsed)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/CostingMethodUsed= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/CostingMethodUsed"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
            <div style="width:187mm;"/>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/BadDebtFootnote)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/BadDebtFootnote= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/BadDebtFootnote"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
            <div style="width:187mm;"/>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/ShortfallAsCommunityBenefit)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/ShortfallAsCommunityBenefit= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/ShortfallAsCommunityBenefit"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
            <div style="width:187mm;"/>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/DebtCollectionPolicy)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/DebtCollectionPolicy= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:left;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/DebtCollectionPolicy"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!-- Line 2  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:1mm;width:5mm;">2</div>
            <div style="float:left; padding-top:1mm">
              <b>Needs Assessment. </b>
        Describe how the organization assesses the health care needs of the communities it serves.
        </div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/NeedsAssessment)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/NeedsAssessment= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/NeedsAssessment"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!--  Line 3  -->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox" style="padding-top:1mm;width:5mm;">3</div>
            <div style="float:left; padding-top:1mm">
              <b>Patient Education of Eligibility for Assistance. </b>
       Describe how the organization informs and educates patients and persons who may be billed for patient care about their eligibility for assistance under federal, state, or local government programs or under the organization's charity care policy. 
        </div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/PatientEducationAssistance)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/PatientEducationAssistance= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/PatientEducationAssistance"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!-- Line 4  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:1mm;width:5mm;">4</div>
            <div style="float:left; padding-top:1mm">
              <b>Community Information.</b>
       Describe the community the organization serves, taking into account the geographic area and demographic constituents it serves.
        </div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/CommunityInformation)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/CommunityInformation= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/CommunityInformation"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!--  Line 5  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:1mm;width:5mm;">5</div>
            <div style="float:left; padding-top:1mm">
              <b>Community Building Activities. </b>
       Describe how the organization's community building activities, as reported in Part II, promote the health of the communities the organization serves. </div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/CommunityBuildingActivities)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/CommunityBuildingActivities= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/CommunityBuildingActivities"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!--  Line 6  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:1mm;width:5mm;">6</div>
            <div style="float:left; padding-top:1mm">
         Provide any other information important to describing how the organization's hospitals or other health care facilities further its exempt purpose by promoting the health of the community (e.g., open medical staff, community board, use of surplus funds, etc.). </div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/OtherInformation)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/OtherInformation= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/OtherInformation"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!--  Line 7  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:5mm; padding-top:1mm">7</div>
            <div style="float:left; padding-top:1mm">
       If the organization is part of an affiliated health care system, describe the respective roles of the organization and its affiliates in promoting the health of the communites served. </div>
            <xsl:choose>
              <xsl:when test="not($Form990ScheduleHData/Form990ScheduleHPartVI/AffiliatedHealthCareSystem)">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:when test="$Form990ScheduleHData/Form990ScheduleHPartVI/AffiliatedHealthCareSystem= ''">
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
                <div class="styBB" style="width:187mm;"/>
              </xsl:when>
              <xsl:otherwise>
                <div class="styBB" style="width:187mm;margin-left:0.75mm;text-align:justify;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/AffiliatedHealthCareSystem"/>
                  </xsl:call-template>
                </div>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <!-- Line 8  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-top:1mm;width:5mm;">8</div>
            <div style="float:left; padding-top:1mm">
         If applicable, identify all states with which the organization, or a related organization, files a community benefit report.
       </div>
            <div style="width:187mm;"/>
            <div class="styFixedUnderline" style="width: 187mm; padding-left:3mm;font-size: 7pt">
              <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates">
                <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates) &lt;= 30) ">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                  <xsl:if test="position()!=last()">
                    <span style="width: 2px">, </span>
                  </xsl:if>
                </xsl:if>
              </xsl:for-each>
              <xsl:if test="count($Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates) &lt; 1 or ((count($Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates) &gt;30) and ($Print = $Separated))">
                <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>
          <!-- Page 4  footer line -->
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <!--<div class="styNBB" style="width:187mm;float:none;clear:both;">-->
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2008</div>
          </div>
         
          <!-- END Part VI -->
          <!-- Begininning of write-in data -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
          Additional Data        
        </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
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
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="width:50mm;border-color:black;" scope="col">
                    <b>(a)</b> Name of Entity    
                </th>
                  <th class="styDepTblCell" style="width:60mm;border-color:black;" scope="col">
                    <b>(b)</b> Description of primary<br/>activity of entity
                </th>
                  <th class="styDepTblCell" style="width:27mm;border-color:black;" scope="col">
                    <b>(c)</b> Organization's<br/>profit % or stock<br/>ownership %
                </th>
                  <th class="styDepTblCell" style="width:28mm;border-left-width:1px;border-color:black;" scope="col">
                    <b>(d)</b> Officers, directors,<br/>trustees, or key <br/>employees' profit %<br/>or stock ownership %
                </th>
                  <th class="styDepTblCell" style="width:22mm;border-color:black;border-right-width:0px;" scope="col">
                    <b>(e)</b> Physicians'<br/>profit % or stock <br/> ownership %
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
          <!--  </form>
  </body>
  </html>
</xsl:template>-->
          <!-- BEGIN Part V Repeating Table -->
          <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/Form990ScheduleHPartV) &gt; 16)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part V - Facility Informaiton</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead" style="font-size:7pt;">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:85mm;">Name and address</th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:1px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_LicHosp.gif" alt="Licensed Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_GenMedSurg.gif" alt="General-Medical-Surgical"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ChildHosp.gif" alt="Children's Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_TeachHosp.gif" alt="Teaching Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_CriticalHosp.gif" alt="Critical Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ResearchFac.gif" alt="Research Facility"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ER-24hrs.gif" alt="ER-24Hours"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" rowspan="10" valign="middle">
                    <img src="{$ImagePath}/990SchH_ER-Other.gif" alt="ER-Other"/>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="width:50mm;border-bottom-width:1px;border-style:solid;border-color:black; border-right-width:0px">
                    <span style="font-weight:normal">Other <br/> (Describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartV">
                  <!-- Adding the separator section -->
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:85mm;text-align:left;">
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
                      <xsl:if test="Address/AddressUS != ''">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="Address/AddressUS"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="Address/AddressForeign != ''">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                          <xsl:with-param name="TargetNode" select="Address/AddressForeign"/>
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
                    <td class="styDepTblCell" style="width:50mm;border-right-width:0px;text-align:left;padding-right:1px;">
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
          <!-- Begin Repeating Data for Part VI   Supplemental Information -->
          <!-- Additiona Data Table for Separated Data from Part VI -->
          <!-- If the Print parameter is not set to be Separated or there are less elements than the container height (15), execute -->
          <!--      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/Form990ScheduleHPartVI) &gt; 1)">        
        <br />
        <br />
        <span class="styRepeatingDataTitle">Form IRS 990 Schedule H, Part VI - Supplemental Information (Optional for 2008)</span>
        <div>
          <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm">
          	<thead class="styTableThead">
	              <tr class="styDepTblHdr" style="height:10mm; ">
				<th nowrap="nowrap" style="width:180mm; text-align:center; font-size:7pt; border-bottom:1 solid black" scope="col"><b>Supplemental Information (Optional for 2008)</b></th>
	              </tr>  
            	</thead>          
            <tbody>              
            <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVI">
                <tr>
	                <xsl:attribute name="class">
			          <xsl:choose>
			            <xsl:when test="position() mod 2 = 1">
			              styDepTblRow1
			            </xsl:when>
			            <xsl:otherwise>
			              styDepTblRow2
			            </xsl:otherwise>
			          </xsl:choose>
			        </xsl:attribute>

                  <td style="padding-top: 1mm; padding-bottom: 1mm; border-bottom:1 solid black;text-align: left; font-size: 7pt">
                    <xsl:if test="position = last()">
                      <xsl:attribute name="style">border-bottom:0 solid black;</xsl:attribute>
                    </xsl:if>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="IncomeBasedCriteria" />                
                    </xsl:call-template>
                    <span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="BadDebtFootnote" />                
                    </xsl:call-template>
                    <span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="ShortfallAsCommunityBenefit" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="DebtCollectionPolicy" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="NeedsAssessment" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="PatientEducationAssistance" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="CommunityInformation" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="CommunityBuildingActivities" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="OtherInformation" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="AffiliatedHealthCareSystem" />                
                    </xsl:call-template>
<span style="width:4px;"></span>
                    <xsl:call-template name="PopulateText">
                    	<xsl:with-param name="TargetNode" select="ReportsFiledWithStates" />                
                    </xsl:call-template>
                  </td>                  
                </tr> 
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </xsl:if>-->
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
    <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates) &gt; 30)">
      <span class="styRepeatingDataTitle">Form 990 Schedule H, Part VI, Line 8 - Identify all states with which the organization or a related organization files a community benefit report.</span>
      <table class="styDepTbl" style="font-size: 7pt" cellspacing="0">
        <thead class="styTableThead"/>
        <tbody>
          <tr class="styDepTblRow1">
            <td class="styDepTblCell" style="text-align: left; width:80mm"> Identify all states with which the organization or a related organization files a community benefit report.</td>
            <td class="styDepTblCell" style="text-align: left; width: 187mm">
              <xsl:for-each select="$Form990ScheduleHData/Form990ScheduleHPartVI/ReportsFiledWithStates">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>
                <xsl:if test="position() != last()">,
                    </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </tbody>
      </table>
      <br/>
    </xsl:if>
  </xsl:template>
  <xsl:template name="IRS990SchHPartVTableFillerRow">
    <tr>
      <td class="styTableCellText" style="width:85mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:50mm;border-right-width:0px">
        <span style="width:1px"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
