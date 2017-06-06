<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 06/02/2014 - Modified per UWR #107555 - Jeremy Nichols -->
<!-- 08/21/2014 - Modified per defect 41417 - Jeremy Nichols -->
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
  <xsl:variable name="SupplementalSize" select="count($Form990ScheduleHData/SupplementalInformationGrp)"/>
  <xsl:variable name="RowsToShow" select="27"/>
  
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
        <script language="JavaScript" type="text/javascript">
            var intCount;
            intCount = 1;
            
            function nextPage()
            {
              intCount = intCount + 1;
              document.write(intCount);
              return true;
            }
        </script>
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
            <div class="styFNBox" style="width:26mm;height:4mm;">
              <div style="padding-top:1mm;">
                <span class="styMainTitle" style="font-size:10pt">SCHEDULE H <span style="width:5mm;"/>(Form 990)</span>
              </div>
              <div style="padding-top:6mm;padding-bottom:1mm;">
                <span class="styAgency" style="width:26mm">Department of the Treasury</span>
                <span class="styAgency" style="width:26mm">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:130mm;">
              <div class="styMainTitle" style="padding-top:1mm;font-size:14pt;">Hospitals</div>
              <div class="styFBT" style="padding-top:1mm;">
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/>
                Complete if the organization answered "Yes" to Form 990, Part IV, question 20.<br/>
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/> Attach to Form 990. <br/>
                <img src="{$ImagePath}/990SchH_Bullet_Md.gif" alt="MediumBullet"/> Information about Schedule H (Form 990) and its instructions is at <i>www.irs.gov/form990</i>.
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;">
              <div class="styOMB">OMB No. 1545-0047</div>
              <div class="styTaxYear" style="height:4mm;padding-top:1.5mm;padding-bottom:1.5mm;">
                20<span class="styTYColor">14</span>
              </div>
              <div class="styPartName" style="font-size:6.5pt;width:30mm;padding-top:0mm;padding-bottom:0.25mm;text-align:left;padding-left:5mm;">Open to Public Inspection</div>
            </div>
          </div>
          
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styFNBox" style="width:134mm;height:8mm;">
              <span class="styBoldText">Name of the organization</span>
              <br/>
              <div style="font-family:verdana;font-size:6pt;height:6.25mm">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
            <div class="styPartDesc" style=" width: 167mm">Financial Assistance and Certain Other Community Benefits at Cost</div>
          </div>
          
          <!-- line 1  Yes - No boxes  -->
          <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
            <div class="IRS990ScheduleH_LineIndex" style="border-top-width:0px;height:4mm;"/>
            <div class="IRS990ScheduleH_LineDesc" style="width:155mm;height:4mm;border-right-width:0px;border-top-width:0px;"/>
            <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;padding-top:.25mm;border-bottom-width:0px;height:4mm;"/>
            <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;">Yes</div>
            <div class="IRS990ScheduleH_LineIndexMid" style="border-right-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;border-top-width:0px;">No</div>
          </div>
          
          <!-- Line 1a  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">1a</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Did the organization have a financial assistance policy during the tax year? If "No," skip to question 6a
                <span style="width:1.5mm;"/>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:1px;border-bottom-width:1px;">
              <b>1a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistancePolicyInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:1px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistancePolicyInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 1b -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes," was it a written policy? <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>1b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenPolicyInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenPolicyInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">2</div>
            <div class="styLNDesc" style="width:155mm;height:8mm;">
              If the organization had multiple hospital facilities, indicate which of the following best describes application of the financial assistance policy to its various hospital facilities during the tax year.
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
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AllHospitalsPolicyInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToAllHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AllHospitalsPolicyInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToAllHospitals</xsl:with-param>
                  </xsl:call-template>
                  Applied uniformly to all hospital facilities
                </label>
              </span>
              <span style="width:75mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/MostHospitalsPolicyInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToMostHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/MostHospitalsPolicyInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyAppliedToMostHospitals</xsl:with-param>
                  </xsl:call-template>
                  Applied uniformly to most hospital facilities
                </label>
              </span>
              <span style="width:75mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/IndivHospitalTailoredPolicyInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyTailoredToIndHospitals</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/IndivHospitalTailoredPolicyInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPolicyTailoredToIndHospitals</xsl:with-param>
                  </xsl:call-template>
                  Generally tailored to individual hospital facilities
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
              Answer the following based on the financial assistance eligibility criteria that applied to the largest number of the organization's patients during the tax year.
            </div>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!--  Line 3a  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:3mm;padding-left:4mm;padding-top:1mm;">a</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:6.5pt;">
              <span class="styNormalText">
                Did the organization use Federal Poverty Guidelines <span style="font-size:6pt;">(FPG)</span> as a factor in determining eligibility for providing <i>free</i> care?
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
                If "Yes," indicate which of the following was the FPG family income limit for eligibility for <i>free</i> care: <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:8.25mm;border-left-width:1px;padding-top:1mm;border-bottom-width:1px;">
              <b>3a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;padding-top:1mm;border-left-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;padding-top:1mm;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceFreeCareInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceFreeCareInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 3a  Checkboxes -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:5mm;"/>
            <div class="styLNDesc" style="width:155mm;height:5mm;">
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent100Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent100</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent100Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent100</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  100%
                </label>
              </span>
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent150Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent150</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent150Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent150</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  150%
                </label>
              </span>
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent200Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent200Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  200%
                </label>
              </span>
              <span style="width:82mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeCareOthPercentageGrp/OtherInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHOtherPercentage</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeCareOthPercentageGrp/OtherInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHOtherPercentage</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  Other  
                  <span class="styIRS990ScheduleHUnderlinedText" style="width:64mm;text-align: right">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeCareOthPercentageGrp/FreeCareOtherPct"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 1mm"/>
                </label>
                <xsl:if test="(count($Form990ScheduleHData/FreeCareOthPercentageGrp/FreeCareOtherPct)=0) ">
                %
                </xsl:if>
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-top:1mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:1mm;border-top-width:0px;padding-top:1mm;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:1mm;border-top-width:0px;padding-top:1mm;"/>
          </div>
          
          <!-- Line 3b  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;padding-top:1mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Did the organization use FPG as a factor in determining eligibility for providing <i>discounted</i> care? If "Yes," indicate
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-top:1mm;padding-bottom:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;padding-top:1mm;"/>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
              <span class="styNormalText">which of the following was the family income limit for eligibility for discounted care:  </span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:8.25mm;border-left-width:1px;padding-top:1mm;padding-bottom:0mm;border-bottom-width:1px;">
              <b>3b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;padding-top:1mm;border-left-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;padding-top:1mm;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceDiscountedCareInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:5mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FPGReferenceDiscountedCareInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 3b  Checkboxes -->
          <div style="width:187mm;height:3mm;">
            <div class="styLNLeftNumBox" style="height:3mm;"/>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-bottom:1mm;">
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent200DInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200D</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent200DInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent200D</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  200%
                </label>
              </span>
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent250Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent250</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent250Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent250</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  250%
                </label>
              </span>
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent300Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent300</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent300Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent300</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  300%
                </label>
              </span>
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent350Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent350</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent350Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent350</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  350%
                </label>
              </span>
              <span style="width:14.5mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent400Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent400</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/Percent400Ind"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHPcent400</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  400%
                </label>
              </span>
              <span style="width:82mm;">
                <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedCareOthPercentageGrp/OtherInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHDiscountedOther</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedCareOthPercentageGrp/OtherInd"/>
                    <xsl:with-param name="BackupName">Form990ScheduleHDiscountedOther</xsl:with-param>
                  </xsl:call-template>
                  <span style="width:0.5mm;"/>
                  Other  
                  <span class="styIRS990ScheduleHUnderlinedBox" style="font-size: 7pt;width:64mm;text-align: right">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/DiscountedCareOthPercentageGrp/DiscountedCareOtherPct"/>
                    </xsl:call-template>
                  </span>
                  <span style="width: 1mm"/>
                </label>
                <xsl:if test="(count($Form990ScheduleHData/DiscountedCareOthPercentageGrp/DiscountedCareOtherPct)=0) ">
                %
                </xsl:if>
              </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:6mm;padding-top:0mm;padding-bottom:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:0mm;padding-top:0mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:6mm;padding-bottom:0mm;padding-top:0mm;border-top-width:0px;"/>
          </div>
          
          <!-- Line 3c -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;padding-top:1mm;">c</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText" >If the organization used factors other than FPG in determining eligibility, describe in Part VI the criteria used for </span> 
              <span class="styNormalText" >determining eligibility for free or discounted care. Include in the description whether the organization used an asset </span>
              <span class="styNormalText" >test or other threshold, regardless of income, as a factor in determining eligibility for free or discounted care. </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-top:1mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:1mm;padding-top:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:11mm;padding-bottom:0mm;padding-top:1mm;border-top-width:0px;"/>
          </div>
          
          <!-- Line 4 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;padding-top:1mm;">4</div>
            <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Did the organization's financial assistance policy that applied to the largest number of its patients during the tax year provide for free or discounted care to the "medically indigent"?
                <span style="width:1mm;"/>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;padding-bottom:0mm;border-bottom-width:1px;">
              <br/>
              <b>4</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;padding-top:1mm;border-left-width:0px;border-bottom-width:1px;">
              <br/>
              <span style="font-weight: normal;padding-top:1mm;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeCareMedicallyIndigentInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;">
              <br/>
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FreeCareMedicallyIndigentInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 5a  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">5a</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Did the organization budget amounts for free or discounted care provided under its financial assistance policy during the tax year? <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............................</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <br/>
              <b>5a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <br/>
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceBudgetInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <br/>
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceBudgetInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 5b  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes," did the organization's financial assistance expenses exceed the budgeted amount?
                <span style="width:0.5mm;"/>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>5b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ExpensesExceedBudgetInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ExpensesExceedBudgetInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 5c  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span style="width:155mm;">If "Yes" to line 5b, as a result of budget considerations, was the organization unable to provide free or discounted</span> 
              <span style="width:155mm;">care to a patient who was eligibile for free or discounted care?
                <span style="width:3mm;"/>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span></span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:6mm;width:8.25mm;border-left-width:1px;padding-top:4mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>5c</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:6mm;border-bottom-width:1px;padding-top:4mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnableToProvideCareInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:6mm;width:7.5mm;padding-top:4mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnableToProvideCareInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!-- Line 6a  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm;">6a</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Did the organization prepare a community benefit report during the tax year?
                <span style="width:1.5mm;"/>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:3mm;">..........</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>6a</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AnnualCommunityBnftReportInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/AnnualCommunityBnftReportInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          
          <!--  Line 6b  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                If "Yes," did the organization make it available to the public? 
                <span style="width:3.5mm;"/>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:3mm;">..............</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>6b</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ReportPublicallyAvailableInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ReportPublicallyAvailableInd"/>
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
            <span class="styNormalText" style="width:170mm;font-size:7.5pt;padding-top:0mm;">
              <span style="width:2mm;"/>
              Financial Assistance and Certain Other Community Benefits at Cost
            </span>
          </div>
          <div class="styTable" style="border-top-width: 1px; width:187mm;border-bottom-width:1px; ">
            <table class="styTable" style="border-color:black;" cellspacing="0">
              <thead>
                <tr>
                  <th colspan="2" class="styIRS990ScheduleHTheadCell" scope="col" style="width:41mm;text-align:center;font-size:7.5pt;border-bottom-width:0px;border-left-width:0px;">
                    <span class="styBoldText">Financial Assistance and</span><br/>
                    <span class="styBoldText">Means-Tested</span><br/>
                    <span class="styBoldText">Government Programs</span><br/>
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
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">a</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Financial Assistance at cost<br/>
                    (from Worksheet 1)
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceAtCostTyp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceAtCostTyp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceAtCostTyp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceAtCostTyp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceAtCostTyp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistanceAtCostTyp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7b  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">b</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Medicaid (from Worksheet 3,<br/>
                    column a)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">....</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaidGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaidGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaidGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaidGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaidGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedMedicaidGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7c -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">c</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Costs of other means-tested<br/>
                    government programs (from<br/>
                    Worksheet 3, column b)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:4mm;">.</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCostsGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCostsGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCostsGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCostsGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCostsGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/UnreimbursedCostsGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7d -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;border-bottom-width:1px;border-left-width:0px; border-top-width:0px;border-right-width:0px;border-color:black;border-style:solid;">d</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    <b>Total</b> Financial Assistance<br/>
                    and Means-Tested<br/>
                    Government Programs
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">.</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalFinancialAssistanceTyp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalFinancialAssistanceTyp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalFinancialAssistanceTyp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalFinancialAssistanceTyp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalFinancialAssistanceTyp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalFinancialAssistanceTyp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--  Line 7e  -->
                <tr>
                  <td colspan="2" class="styIRS990ScheduleHTheadCell" scope="col" style="width:41mm;text-align:center;font-size:7.5pt;border-bottom-width:0px;border-left-width:0px;">
                    <span class="styBoldText">Other Benefits</span>
                    <br/>
				  </td>
                  <td class="styIRS990ScheduleHCell " rowspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServicesGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " rowspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServicesGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " rowspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServicesGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " rowspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServicesGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " rowspan="2">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServicesGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " rowspan="2">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunityHealthServicesGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
				</tr>
				<tr>
				  <td style="width:4.5mm;font-size:6pt;text-align:right;">e</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Community health<br/>
                    improvement services and<br/>
                    community benefit operations<br/>
                    (from Worksheet 4)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                </tr>
                
                <!-- Line 7f  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">f</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Health professions education<br/>
                    (from Worksheet 5)
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducationGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducationGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducationGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducationGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducationGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthProfessionsEducationGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7g  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">g</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Subsidized health services<br/>
                    (from Worksheet 6)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3.5mm; font-weight:bold; margin-left:3mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServicesGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServicesGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServicesGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServicesGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServicesGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SubsidizedHealthServicesGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7h  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">h</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Research (from Worksheet 7)
                    
                    <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;"/>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ResearchGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ResearchGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ResearchGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ResearchGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ResearchGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ResearchGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--  Line 7i  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">i<span style="width:0.2mm;"/></td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    Cash and in-kind<br/>
                    contributions for community<br/>
                    benefit (from Worksheet 8)
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributionsGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributionsGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributionsGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributionsGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributionsGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CashAndInKindContributionsGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7j  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;">j</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 0px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    <b>Total.</b>
                    <span class="styNormalText"/> Other Benefits
                    <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;">..</span>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefitsGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefitsGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefitsGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefitsGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefitsGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell " style="border-bottom-width:1px;">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalOtherBenefitsGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- Line 7k  -->
                <tr>
                  <td style="width:4.5mm;font-size:6pt;text-align:right;border-top:0px;border-bottom-width: 1px;border-left:0px;border-right:0px;border-color:black;border-style:solid;">k</td>
                  <td class="styTableCell" style="text-align:left; border-bottom-width: 1px; border-left-width: 0px; border-top-width: 0px;border-right-width:0px;padding-left:2.5mm;">
                    <b>Total. </b> Add lines 7d and 7j
                    <!--Dotted Line-->
                    <span style="letter-spacing:3mm; font-weight:bold; margin-left:1mm;">.</span>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefitsGrp/ActivitiesOrProgramsCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefitsGrp/PersonsServedCnt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefitsGrp/TotalCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefitsGrp/DirectOffsettingRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefitsGrp/NetCommunityBenefitExpnsAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styIRS990ScheduleHCell ">
                    <xsl:call-template name="PopulatePercent">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommunityBenefitsGrp/TotalExpensePct"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <span style="width:112mm;font-size:6.25pt;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 990.</span>
            <span style="width:6mm;font-size:6.25pt;"/>
            Cat. No. 50192T
            <span style="width:9mm;"/>
            <span style="font-weight:bold;font-size:6.25pt;">Schedule H (Form 990) 2014</span>
          </div>
          
          <!-- PAGE2HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2014</div>
            <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!-- BEGIN PART II TITLE -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part II</div>
            <div class="styPartDesc">
              <b>Community Building Activities</b>
              <span class="styNormalText"> Complete this table if the organization conducted any community building
                activities during the tax year, and describe in Part VI how its community building activities promoted the
                health of the communities it serves.
              </span>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprvAndHousingGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprvAndHousingGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprvAndHousingGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprvAndHousingGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprvAndHousingGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/PhysicalImprvAndHousingGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopmentGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopmentGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopmentGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopmentGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopmentGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EconomicDevelopmentGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupportGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupportGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupportGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupportGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupportGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CommunitySupportGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovementsGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovementsGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovementsGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovementsGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovementsGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/EnvironmentalImprovementsGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopmentGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopmentGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopmentGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopmentGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopmentGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/LeadershipDevelopmentGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuildingGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuildingGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuildingGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuildingGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuildingGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CoalitionBuildingGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacyGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacyGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacyGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacyGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacyGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HealthImprovementAdvocacyGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopmentGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopmentGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopmentGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopmentGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopmentGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WorkforceDevelopmentGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherCommuntityBuildingActyGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherCommuntityBuildingActyGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherCommuntityBuildingActyGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherCommuntityBuildingActyGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherCommuntityBuildingActyGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OtherCommuntityBuildingActyGrp/TotalExpensePct"/>
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
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommuntityBuildingActyGrp/ActivitiesOrProgramsCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommuntityBuildingActyGrp/PersonsServedCnt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommuntityBuildingActyGrp/TotalCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommuntityBuildingActyGrp/DirectOffsettingRevenueAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommuntityBuildingActyGrp/NetCommunityBenefitExpnsAmt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS990ScheduleHCell ">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/TotalCommuntityBuildingActyGrp/TotalExpensePct"/>
                </xsl:call-template>
              </td>
            </tr>
          </table>
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc">
            
            <!-- added code for the & ampersand symbol -->
              <b>Bad Debt, Medicare, &amp; Collection Practices</b>
            </div>
          </div>
          
          <!--  PART III  Line 1  -->
          <div style="width:187mm;">
            <div class="IRS990ScheduleH_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
              <div class="IRS990ScheduleH_LineDesc" style="width:163mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                <b>Section  A. Bad Debt Expense</b>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;padding-top:.25mm;border-bottom-width:1px;height:4mm;"/>
              <div class="IRS990ScheduleH_LineIndexMid" style="border-top-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;font-size:7pt;font-weight:bold;">Yes</div>
              <div class="IRS990ScheduleH_LineIndexMid" style="border-right-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;font-size:7pt;border-top-width:0px;font-weight:bold;">No</div>
            </div>
          </div>
          
          <!-- Line 1  -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:1mm;">1</div>
            <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
              <span class="styNormalText">
                Did the organization report bad debt expense in accordance with Heathcare Financial Management Association Statement No. 15?
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........................</span>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:7mm;width:8.25mm;border-left-width:1px;padding-top:3mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
              <b>1</b>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:7mm;border-bottom-width:1px;padding-top:3mm;font-size:7pt;border-top-width:0px;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateYesBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseReportedInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="IRS990ScheduleH_LineIndexMid" style="height:7mm;width:7.5mm;padding-top:3mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
              <span style="font-weight: normal;">
                <xsl:call-template name="PopulateNoBoxText">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseReportedInd"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!--  PART III   Line 2  -->
          <!--  Line 2  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">2</div>
            <div class="styLNDesc" style="width: 115mm; padding-top:.5mm;">
              <span style="float:left; clear: none">Enter the amount of the organization's bad debt expense.  
              Explain in Part VI the methodology used by the organization to estimate this amount.
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span></span>
            </div>
            <div class="styLNRightNumBox" style="padding-top:4.5mm;">
              2
            </div>
            <div class="styLNAmountBox" style="padding-top:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:8.5mm; padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8.5mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8.5mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          <!-- Line 2  -->
          
          <!--  Line 3  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:0mm;padding-left:1mm;">3</div>
            <div class="styLNDesc" style="width: 115mm;padding-top:0mm;">
              <span style="float:left; clear: none">Enter the estimated amount of the organization's bad debt expense attributable to patients eligible under the organization's financial assistance policy.
              Explain in Part VI the methodology used by the organization to estimate this amount and the rationale, if any, for including this portion of bad debt as community benefit.
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span></span>
              <span style="letter-spacing:4mm; float:left;clear:none;font-weight:bold; font-size:7pt; "/>
            </div>
            <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">3</div>
            <div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/BadDebtExpenseAttributableAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:14mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:14mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:14mm;padding-bottom:1mm;border-top-width:0px;"/>
          </div>
          
          <!-- PART III   Line 4  -->
          <div style="width: 187mm">
            <div class="styLNLeftNumBox" style="padding-top:.5mm;padding-left:1mm;">4</div>
            <div class="styLNDesc" style="width: 155mm;padding-top:.5mm;">
              <span style="float:left; clear: none">
                Provide in Part VI the text of the footnote to the organization’s financial statements that describes bad debt
				expense or the page number on which this footnote is contained in the attached financial statements.
			  </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
            <div class="styShadingCell" style="width:8mm;height:8mm;padding-bottom:1mm;border-top-width:0px;"/>
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
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ReimbursedByMedicareAmt"/>
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
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostOfCareReimbursedByMedcrAmt"/>
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
              <span style="float:left; clear: none">Subtract line 6 from line 5. This is the surplus (or shortfall)</span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">7</div>
            <div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/MedicareSurplusOrShortfallAmt"/>
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
              <span style="width: 155mm;float:left; clear: none">Describe in Part VI the extent to which any shortfall reported in line 7 should be treated as community benefit.</span> 
              <span style="width: 155mm;float:left; clear: none">Also describe in Part VI the costing methodology or source used to determine the amount reported on line 6.</span> 
              <span style="width: 155mm;float:left; clear: none">Check the box that describes the method used:</span>
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
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsedGrp/CostAccountingSystemInd"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostAccountingSystem</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsedGrp/CostAccountingSystemInd"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostAccountingSystem</xsl:with-param>
                    </xsl:call-template>
                    Cost accounting system
                  </label>
                </span>
                <span style="width:50mm;">
                  <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsedGrp/CostToChargeRatioInd"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostToChargeRatio</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsedGrp/CostToChargeRatioInd"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHCostToChargeRatio</xsl:with-param>
                    </xsl:call-template>
                    Cost to charge ratio
                  </label>
                </span>
                <span style="width:50mm;">
                  <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsedGrp/OtherInd"/>
                      <xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/CostingMethodologyUsedGrp/OtherInd"/>
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
                  Did the organization have a written debt collection policy during the tax year?
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........</span>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:8.25mm;border-left-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;border-bottom-width:1px;">
                <b>9a</b>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;border-bottom-width:1px;padding-top:1mm;font-size:7pt;border-top-width:0px;">
                <span style="font-weight: normal;">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenDebtCollectionPolicyInd"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:4mm;width:7.5mm;padding-top:1mm;border-right-width:0px;border-bottom-width:1px;border-top-width:0px;font-size:7pt;">
                <span style="font-weight: normal;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/WrittenDebtCollectionPolicyInd"/>
                  </xsl:call-template>
                </span>
              </div>
            </div>
            
            <!--  Part III   Line 9b  -->
            <div style="width:187mm">
              <div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;">b</div>
              <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.25mm;padding-bottom:0mm;font-size:7pt;">
                <span class="styNormalText">
                  If "Yes," did the organization’s collection policy that applied to the largest number of its patients during the tax year contain provisions
                  on the collection practices to be followed for patients who are known to qualify for financial assistance? Describe in Part VI<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:6.5mm;width:8.25mm;border-left-width:1px;padding-top:3mm;font-size:7pt;border-top-width:0px;border-bottom-width:0px;">
                <br/>
                <b>9b</b>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:6.5mm;border-bottom-width:0px;padding-top:3mm;font-size:7pt;border-top-width:0px;">
                <br/><span style="font-weight: normal;">
                  <xsl:call-template name="PopulateYesBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistancePrvsnInd"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="IRS990ScheduleH_LineIndexMid" style="height:6.5mm;width:7.5mm;padding-top:3mm;border-right-width:0px;border-bottom-width:0px;border-top-width:0px;font-size:7pt;">
                <br/><span style="font-weight: normal;">
                  <xsl:call-template name="PopulateNoBoxText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FinancialAssistancePrvsnInd"/>
                  </xsl:call-template>
                </span>
              </div>
            </div>
          </div>
          
          <!--   PART  IV   Management Companies and Joint Ventures -->
          <div class="styBB" style="width:187mm;height:4mm;border-top-width:1px;vertical-align:bottom;">
            <div class="styPartName">Part IV</div>
              <span style="font-size:8pt;"><b>Management Companies and Joint Ventures</b></span>
             <span style="font-size:5pt;padding-bottom:0.5mm;">(owned 10% or more by officers, directors, trustees, key employees, and physicians—see instructions)</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ManagementCoAndJntVenturesGrp"/>
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
                    <br/>or stock ownership % 
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
                  <xsl:when test="$Form990ScheduleHData/ManagementCoAndJntVenturesGrp ">
                    <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt;=13) ">
                      <xsl:for-each select="$Form990ScheduleHData/ManagementCoAndJntVenturesGrp">
                        <tr style="height:4mm;">
                          <td class="styTableCell" style="width:50mm;vertical-align:top;text-align:left;border-color:black;">
                            <xsl:if test="position() = last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:50mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <span style="width:3mm;font-weight:bold;">
                              <xsl:value-of select="position()"/>
                            </span>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
                            </xsl:call-template>
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
                            </xsl:call-template>
                          </td>
                          <td class="styTableCell" style="width:60mm;text-align:left;border-color:black;border-right-width:1px;vertical-align:top;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:60mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          
                          <!--COL  C  -->
                          <td class="styTableCell" style="width:27mm;text-align:right;border-color:black;vertical-align:top;padding-top:1mm;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:27mm;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="OrgProfitOrOwnershipPct"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styTableCell" style="width:29mm;border-left-width:0px;text-align:right;border-color:black;vertical-align:top;padding-top:1mm;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:29mm;border-left-width:0px;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px; </xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="OfcrEtcProfitOrOwnershipPct"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styTableCell" style="width:22mm;text-align:right;border-color:black;vertical-align:top;border-right-width:0px;padding-top:1mm;">
                            <xsl:if test="position()=last() and position() &gt;= 13">
                              <xsl:attribute name="style">width:22mm;text-align:right;border-color:black;vertical-align:top;border-bottom-width:0px;border-right-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulatePercent">
                              <xsl:with-param name="TargetNode" select="PhysiciansProfitOrOwnershipPct"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 1 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">1</xsl:with-param>
                        <xsl:with-param name="IsSeparated">true</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 2 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">2</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 3 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">3</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 4 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">4</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 5 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">5</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 6 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">6</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 7 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">7</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 8 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">8</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 9 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">9</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 10 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">10</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 11 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">11</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 12 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
                      <xsl:call-template name="populateirs990SchHpart4emptycells">
                        <xsl:with-param name="index">12</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &lt; 13 or ((count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14) and ($Print = $Separated))">
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
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ManagementCoAndJntVenturesGrp"/>
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
              <span class="styBoldText" style="font-weight:bold;font-size:6.25pt;">Schedule H (Form 990) 2014</span>
            </div>
          </div>
          <!-- END Page Break and Footer-->
          
          <!-- PAGE 3 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2014</div>
            <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
                <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HospitalFacilitiesGrp"/>
                <xsl:with-param name="containerHeight" select="16"/>
                <xsl:with-param name="containerID" select=" 'PartVctn' "/>
              </xsl:call-template>
            </div>
          </div>
            <!--Table expand/collapse toggle button end-->
            
          <!-- BEGIN Part V Table -->
          <div class="styTableContainer" id="PartVctn" style="height:150mm;">
          
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:100%;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;">
                <tr>
                  <th class="styTableCellHeader" colspan="2" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:70mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;padding-bottom:1mm;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:68mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  A. Hospital Facilities</b>
                    </div>                    
                    <span style="height:10mm;"/>
                    <span style="width:68mm;font-weight:normal;">(list in order of size from largest to smallest—see instructions)</span><br/>                    
                    <span style="width:68mm;font-weight:normal;">How many hospital facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:20mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HospitalFacilitiesCnt"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="width:68mm;font-weight:normal;">Name, address, primary website address, and state license number (and if a group return, the name and EIN of the subordinate hospital organization that operates the hospital facility)</span>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:1px;vertical-align:top;padding-top:.5mm;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" valign="middle">
                    <img src="{$ImagePath}/990SchH_LicHosp.gif" alt="Licensed Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top; padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_GenMedSurg.gif" alt="General-Medical-Surgical"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ChildHosp.gif" alt="Children's Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_TeachHosp.gif" alt="Teaching Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px;" scope="col">
                    <img src="{$ImagePath}/990SchH_CriticalHosp.gif" alt="Critical Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ResearchFac.gif" alt="ResearchGrp Facility"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ER-24hrs.gif" alt="ER-24Hours"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ER-Other.gif" alt="ER-Other"/>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;padding-bottom:1mm;width:29mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:1px;padding-left:1mm;font-size:7pt;">
                    <span style="font-weight:normal">Other (describe)</span>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;padding-bottom:1mm;width:33mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:7pt;">
                    <span style="font-weight:normal">Facility reporting group</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/HospitalFacilitiesGrp">
                
                  <!-- Adding the separator section -->
                  <xsl:if test="($Print != $Separated)">
                    <tr>
                      <td class="styTableCellCtr " style="width:12mm;vertical-align:top;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FacilityNum"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCellText" style="width:58mm;padding-left:1mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="USAddress"/>
                        </xsl:call-template>
                        <xsl:if test="WebsiteAddressTxt != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="WebsiteAddressTxt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="StateLicenseNum != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="StateLicenseNum"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="SubordinateHospitalName != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="SubordinateHospitalName"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="SubordinateHospitalEIN != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="SubordinateHospitalEIN"/>
                          </xsl:call-template>
                        </xsl:if>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LicensedHospitalInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GeneralMedicalAndSurgicalInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ChildrensHospitalInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TeachingHospitalInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CriticalAccessHospitalInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ResearchFacilityInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="EmergencyRoom24HrsInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr " style="width:7mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="EmergencyRoomOtherInd"/>
                        </xsl:call-template>
                        <span style="width:1px"/>
                      </td>
                      <td class="styTableCellCtr" style="width:29mm;padding-left:1mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="OtherDesc"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                      <td class="styTableCellCtr" style="width:33mm;padding-left:1mm;text-align:left;border-bottom-width:1px;border-right-width:0px;border-color:black;">
						<xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FacilityReportingGroupCd"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990ScheduleHData/HospitalFacilitiesGrp) &lt; 1 or ($Print = $Separated)">
                  <tr>
                    <td class="styTableCell" style="width:12mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCellText" style="width:58mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HospitalFacilitiesGrp"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="width:7mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:4px;"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px;width:29mm;text-align:left;border-bottom-width:1px;border-right-width:1px;border-color:black;">
                      <span style="width:2px;"/>
                    </td>
                    <td class="styTableCell" style="border-right-width:0px;width:33mm;text-align:left;border-bottom-width:1px;border-right-width:0px;border-color:black;">
                      <span style="width:2px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;2 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;3 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;4 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;5 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;6 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;7 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;8 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;9 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/HospitalFacilitiesGrp) &lt;10 or ((count($Form990ScheduleHData/HospitalFacilitiesGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVTableFillerRow"/>
                </xsl:if>
              </tbody>
            </table>
          </div>
          
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HospitalFacilitiesGrp"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select=" 'PartVctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          <!-- END Part V Table -->
          <!-- END PART V  Section A - Hospital Facilities   -->
          
          <!-- footer line -->
          <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
          </div>
          
          <xsl:if test="count($Form990ScheduleHData/HospitalFcltyPoliciesPrctcGrp) &lt; 1">
            <!-- PAGE 4 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2014</div>
              <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
              
              <div class="styLNDesc" style="width: 187mm;padding-top:0mm;font-size:8pt;font-weight:bold;">Section  B. Facility Policies and Practices</div><br/>
              <span style="font-weight:normal;">(Complete a separate Section B for each of the hospital facilities or facility reporting groups listed in Part V, Section A)</span><br/>     
            </div>    
      
            <table border="0" cellspacing="0" cellpadding="0" style="width:186mm;font-size:7pt;">
				<tr>
					<td style="width:86mm;">
						<span style="width:1mm;"/>
					</td>
					<td style="width:100mm;">
					    <span style="width:100mm;font-weight:normal;">
						  <xsl:call-template name="PopulateText">
						    <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
						  </xsl:call-template>
					    </span>
					</td>
				</tr>
				<tr>
					<td style="width:86mm;">
						<span style="font-weight:bold;">Name of hospital facility or letter of facility reporting group</span>
					</td>
					<td style="width:100mm;">
						<span class="styIRS990ScheduleHUnderlinedText" style="width:100mm;font-weight:normal;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						  </span>
					</td>
				</tr>
			</table>  
			<span style="height:3.5mm;"/>
			
			<table border="0" cellspacing="0" cellpadding="0" style="width:171mm;font-size:7pt;">			
				<tr>
					<td style="width:133mm;">
					    <span style="font-weight:bold;">Line number of hospital facility, or line numbers of hospital facilities in a facility </span><br/>
					    <span style="font-weight:bold;">reporting group (from Part V, Section A):</span>
					</td>
					<td style="width:38mm;">
						<span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:55mm;font-weight:normal;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FacilityNum"/>
						  </xsl:call-template>
					    </span>
				    </td>
				</tr>
			</table>  
			
             <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="3" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:bold;">
                    Community Health Needs Assessment 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    1<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility first licensed, registered, or similarly recognized by a State as a hospital
					facility in the current tax year or the immediately preceding tax year?.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">......................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    1
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="FirstLicensedCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="FirstLicensedCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr> 
                <!-- Part V Section B line 2 -->
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    2<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility acquired or placed into service as a tax-exempt hospital in the
					current tax year or the immediately preceding tax year?  If “Yes,” provide details of the acquisition in Section C.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    2
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TaxExemptHospitalCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TaxExemptHospitalCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <!-- Part V Section B line 3 -->
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    3<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    During the tax year or either of the two immediately preceding tax years, did the hospital facility conduct
					a community health needs assessment (CHNA)? If "No," skip to line 12.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    3
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes," indicate what the CHNA report describes (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDefinitionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDefinition</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommunityDefinitionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDefinition</xsl:with-param>
					  </xsl:call-template>
                      A definition of the community served by the hospital facility
					</label> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDemographicsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDemographics</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommunityDemographicsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDemographics</xsl:with-param>
					  </xsl:call-template>
                      Demographics of the community 
					</label> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
					<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ExistingResourcesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHExistingResources</xsl:with-param>
								  </xsl:call-template>
								</input>
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="ExistingResourcesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHExistingResources</xsl:with-param>
								  </xsl:call-template>
								  Existing health care facilities and resources within the community that are available to respond to the health needs of the community
								</label> 
							</td>
						</tr>
					</table>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="HowDataObtainedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHHowDataObtained</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="HowDataObtainedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHHowDataObtained</xsl:with-param>
					  </xsl:call-template>
                      How data was obtained 
					</label>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityHealthNeedsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityHealthNeeds</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommunityHealthNeedsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityHealthNeeds</xsl:with-param>
					  </xsl:call-template>
                      The significant health needs of the community 
					</label>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="OtherHealthIssuesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHOtherHealthIssues</xsl:with-param>
								  </xsl:call-template>
								</input>					
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="OtherHealthIssuesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHOtherHealthIssues</xsl:with-param>
								  </xsl:call-template>
								  Primary and chronic disease needs and other health issues of uninsured persons, low-income persons, and minority groups
								</label>
							</td>
						</tr>
					</table> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CommunityHlthNeedsIdProcessInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHIdentifyingProcess</xsl:with-param>
								  </xsl:call-template>
								</input>					
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CommunityHlthNeedsIdProcessInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHIdentifyingProcess</xsl:with-param>
								  </xsl:call-template>
								  The process for identifying and prioritizing community health needs and services to meet the community health needs 
								</label>
							</td>
						</tr>
					</table>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ConsultingProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHConsultingProcess</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ConsultingProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHConsultingProcess</xsl:with-param>
					  </xsl:call-template>
                      The process for consulting with persons representing the community’s interests
					</label>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InformationGapsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInformationGaps</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="InformationGapsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInformationGaps</xsl:with-param>
					  </xsl:call-template>
                      Information gaps that limit the hospital facility’s ability to assess the community’s health needs
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    j
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    4<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Indicate the tax year the hospital facility last conducted a CHNA: 20
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedYr"/>
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
                    5<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    In conducting its most recent CHNA, did the hospital facility take into account input from persons who represent the broad interests of the
                    community served by the hospital facility, including those with special knowledge of or expertise in public
                    health? If "Yes," describe in Section C how the hospital facility took into account input from
                    persons who represent the community, and identify the persons the hospital facility consulted
                    <span class="styDotLn" style="float:none">...</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    5
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccountOthersInputInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccountOthersInputInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    6a<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility’s CHNA conducted with one or more other hospital facilities? If "Yes," list the other hospital facilities in Section C<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    6a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithOtherFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithOtherFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility’s CHNA conducted with one or more organizations other than hospital
					facilities?” If “Yes,” list the other organizations in Section C.
                    <span class="styDotLn" style="float:none">......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    6b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithNonFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithNonFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    7<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility make its CHNA report widely available to the public?
                    <span class="styDotLn" style="float:none">.............</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    7
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAReportWidelyAvailableInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAReportWidelyAvailableInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes," indicate how the CHNA report was made widely available (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="RptAvailableOnOwnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOwnWebsite</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="RptAvailableOnOwnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOwnWebsite</xsl:with-param>
					  </xsl:call-template>
                      Hospital facility’s website (list url): 
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:105mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="OwnWebsiteURLTxt "/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherWebsiteInd "/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                      Other website (list url): 
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:120mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="OtherWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PaperCopyPublicInspectionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPaperCopyPublicInspectionInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PaperCopyPublicInspectionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPaperCopyPublicInspectionInd</xsl:with-param>
					  </xsl:call-template>
                      Made a paper copy available for public inspection without charge at the hospital facility
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="RptAvailableThruOtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethod</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="RptAvailableThruOtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethod</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    8<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility adopt an implementation strategy to meet the significant community health needs<br/>
					identified through its most recently conducted CHNA? If "No," skip to line 11.
                    <span class="styDotLn" style="float:none">............................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    8
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ImplementationStrategyAdoptInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ImplementationStrategyAdoptInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    9<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Indicate the tax year the hospital facility last adopted an implementation strategy: 20
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ImplementationStrategyAdptYr"/>
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
                    10<span style="width:1.5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Is the hospital facility's most recently adopted implementation strategy posted on a website?
                    <span class="styDotLn" style="float:none">.....................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    10
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyPostedWebsiteInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyPostedWebsiteInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                     If "Yes" (list url):
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:105mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="StrategyWebsiteURLTxt "/>
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
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "No," is the hospital facility’s most recently adopted implementation strategy attached to this return?
                    <span class="styDotLn" style="float:none">......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    10b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyAttachedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyAttachedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    11<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Describe in Section C how the hospital facility is addressing the significant needs identified in its
					most recently conducted CHNA and any such needs that are not being addressed together with the
					reasons why such needs are not being addressed.
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
                    12a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the organization incur an excise tax under section 4959 for the hospital facility's failure to conduct a CHNA as required by section 501(r)(3)?
                    <span class="styDotLn" style="float:none">...........................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    12a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="OrganizationIncurExciseTaxInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="OrganizationIncurExciseTaxInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes" to line 12a, did the organization file Form 4720 to report the section 4959 excise tax?
                    <span class="styDotLn" style="float:none">......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    12b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="Form4720FiledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="Form4720FiledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes" to line 12b, what is the total amount of section 4959 excise tax the organization reported on Form 4720 for all of its hospital facilities? 
                    $<span class="styIRS990ScheduleHUnderlinedText" style="width:50mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExciseReportForm4720ForAllAmt"/>
                      </xsl:call-template>
                    </span><br/><br/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
            
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
            </div>
            
            <!-- PAGE 5 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2014</div>
              <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:180mm;height:4mm;padding-bottom:1.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <table border="0" cellspacing="0" cellpadding="0" style="width:180mm;font-size:7pt;">
						<tr>
							<td style="width:82mm;">
								<span style="width:1mm;"/>
							</td>
							<td style="width:98mm;">
								<span style="width:98mm;font-weight:normal;">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td style="width:82mm;">
								<span style="font-weight:bold;">Name of hospital facility or letter of facility reporting group</span>
							</td>
							<td style="width:98mm;">
								<span class="styIRS990ScheduleHUnderlinedText" style="width:98mm;font-weight:normal;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								  </span>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:163mm;height:4mm;padding-bottom:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <span style="width:1mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:187mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Financial Assistance Policy (FAP)
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
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
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Explained eligibility criteria for financial assistance, and whether such assistance included free or discounted care?
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="EligCriteriaExplainedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="EligCriteriaExplainedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate the eligibility criteria explained in the FAP: 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;vertical-align:top;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
					<input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtFreeDscntInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFPGFamilyIncmLmtFreeDscntInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtFreeDscntInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFPGFamilyIncmLmtFreeDscntInd</xsl:with-param>
					  </xsl:call-template>
                      Federal poverty guidelines (FPG), with FPG family income limit for eligibility for free care of 
                      <span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtFreeCarePct"/>
						  </xsl:call-template>
						</span>% 
						<br/><span style="width:5mm;"/>
						and FPG family income limit for eligibility for discounted care of 
						<span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtDscntCarePct"/>
						  </xsl:call-template>
						</span>%
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IncomeLeIncomeLevelCriteriaIndvelInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHIncomeLevelCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="IncomeLeIncomeLevelCriteriaIndvelInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHIncomeLevelCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Income level other than FPG (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AssetLevelCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHAssetLevelCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="AssetLevelCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHAssetLevelCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Asset level
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicalIndigencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicalIndigencyCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="MedicalIndigencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicalIndigencyCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Medical indigency
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InsuranceStatusCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInsuranceStatusCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="InsuranceStatusCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInsuranceStatusCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Insurance status
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="UnderinsuranceStatCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUnderinsuranceStatCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="UnderinsuranceStatCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUnderinsuranceStatCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Underinsurance discount
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ResidencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHResidencyCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ResidencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHResidencyCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Residency
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Explained the basis for calculating amounts charged to patients?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainedBasisInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainedBasisInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    15
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                   Explained the method for applying for financial assistance?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    15
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AppFinancialAsstExplnInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AppFinancialAsstExplnInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate how the hospital facility’s FAP or FAP application form (including accompanying
					instructions) explained the method for applying for financial assistance (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DescribedInfoInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedInfoInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="DescribedInfoInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedInfoInd</xsl:with-param>
					  </xsl:call-template>
                      Described the information the hospital facility may require an individual to provide as part of his or her application.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DescribedSuprtDocInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedSuprtDocInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="DescribedSuprtDocInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedSuprtDocInd</xsl:with-param>
					  </xsl:call-template>
                      Described the supporting documentation the hospital facility may require an individual to submit as part of his or 
                      <br/><span style="width:5mm;"/>her application.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ProvidedHospitalContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedHospitalContactInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ProvidedHospitalContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedHospitalContactInd</xsl:with-param>
					  </xsl:call-template>
                      Provided the contact information of hospital facility staff who can provide an individual with information about the 
                      <br/><span style="width:5mm;"/>FAP and FAP application process.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ProvidedNonprofitContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedNonprofitContactInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ProvidedNonprofitContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedNonprofitContactInd</xsl:with-param>
					  </xsl:call-template>
                      Provided the contact information of nonprofit organizations or government agencies that may be sources of 
                      <br/><span style="width:5mm;"/>assistance with FAP applications.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethodInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethodInd</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Included measures to publicize the policy within the community served by the hospital facility?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    16
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasuresInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasuresInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," indicate how the hospital facility publicized the policy (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvailableOnWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvailableOnWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                     The FAP was widely available on a website (list url):
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:80mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FAPAvailableOnWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvailableOnWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvailableOnWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                      The FAP application form was widely available on a website (list url):
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:58mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPSummaryOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSummaryOnWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPSummaryOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSummaryOnWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                      A plain language summary of the FAP was widely available on a website (list url):
					  <br/><span style="width:5mm;"/><span class="styIRS990ScheduleHUnderlinedText" style="width:80mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAvlblOnRequestNoChargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvlblOnRequestNoChargeInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAvlblOnRequestNoChargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvlblOnRequestNoChargeInd</xsl:with-param>
					  </xsl:call-template>
                      The FAP was available upon request and without charge (in public locations in the hospital facility and by mail)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAppAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvlblOnRequestNoChrgInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAppAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvlblOnRequestNoChrgInd</xsl:with-param>
					  </xsl:call-template>
                      The FAP application form was available upon request and without charge (in public locations in the hospital facility 
                      <br/><span style="width:5mm;"/>and by mail)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPSumAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSumAvlblOnRequestNoChrgInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPSumAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSumAvlblOnRequestNoChrgInd</xsl:with-param>
					  </xsl:call-template>
                      A plain language summary of the FAP was available upon request and without charge (in public locations in the 
                      <br/><span style="width:5mm;"/>hospital facility and by mail)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNoticeDisplayedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPNoticeDisplayedInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNoticeDisplayedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPNoticeDisplayedInd</xsl:with-param>
					  </xsl:call-template>
                      Notice of availability of the FAP was conspicuously displayed throughout the hospital facility
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommuntityNotifiedFAPInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommuntityNotifiedFAPInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommuntityNotifiedFAPInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommuntityNotifiedFAPInd</xsl:with-param>
					  </xsl:call-template>
                      Notified members of the community who are most likely to require financial assistance about availability of the FAP
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherPublicityInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherPublicity</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherPublicityInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherPublicity</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    17
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a separate billing and collections policy, or a written financial
                    assistance policy (FAP) that explained all of the actions the hospital facility or other authorized party may take upon non-payment?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">..................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    17
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="FAPActionsOnNonpaymentInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="FAPActionsOnNonpaymentInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    18
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Check all of the following actions against an individual that were permitted under the hospital facility's policies during the tax year before making reasonable efforts to determine the individual’s eligibility under the facility’s FAP:
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitReportToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitReportToCreditAgency</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitReportToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitReportToCreditAgency</xsl:with-param>
					  </xsl:call-template>
                      Reporting to credit agency(ies)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitSellingDebtInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitSellingDebtInd</xsl:with-param>
					  </xsl:call-template>
                      Selling an individual’s debt to another party
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitLegalJudicialProcessInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitLegalJudicialProcessInd</xsl:with-param>
					  </xsl:call-template>
                      Actions that require a legal or judicial process
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitOtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitOtherActionsInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitOtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitOtherActionsInd</xsl:with-param>
					  </xsl:call-template>
                      Other similar actions (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitNoActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitNoActionsInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitNoActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitNoActionsInd</xsl:with-param>
					  </xsl:call-template>
                      None of these actions or other similar actions were permitted
					</label>
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
              </tbody>
            </table>
          
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;border-top:1px solid black;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
            </div>
            
            <!-- PAGE 6 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2014</div>
              <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:180mm;height:4mm;padding-bottom:1.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <table border="0" cellspacing="0" cellpadding="0" style="width:180mm;font-size:7pt;">
						<tr>
							<td style="width:82mm;">
								<span style="width:1mm;"/>
							</td>
							<td style="width:98mm;">
								<span style="width:98mm;font-weight:normal;">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td style="width:82mm;">
								<span style="font-weight:bold;">Name of hospital facility or letter of facility reporting group</span>
							</td>
							<td style="width:98mm;">
								<span class="styIRS990ScheduleHUnderlinedText" style="width:98mm;font-weight:normal;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								  </span>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:163mm;height:4mm;padding-bottom:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <span style="width:1mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    19
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-weight:normal;">
                    Did the hospital facility or other authorized third party perform any of the following actions
                    during the tax year before making reasonable efforts to determine the individual’s eligibility under
                    the facility’s FAP?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    19
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivitiesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivitiesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," check all actions in which the hospital facility or a third party engaged:
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ReportingToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHReportToCreditAgency</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ReportingToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHReportToCreditAgency</xsl:with-param>
					  </xsl:call-template>
                      Reporting to credit agency(ies)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EngagedSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedSellingDebtInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="EngagedSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedSellingDebtInd</xsl:with-param>
					  </xsl:call-template>
                      Selling an individual’s debt to another party
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EngagedLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedLegalJudicialProcessInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="EngagedLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedLegalJudicialProcessInd</xsl:with-param>
					  </xsl:call-template>
                      Actions that require a legal or judicial process
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsInd</xsl:with-param>
					  </xsl:call-template>
                      Other similar actions (describe in Section C)
					</label>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    20
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate which efforts the hospital facility or other authorized party made before initiating any of the actions listed (whether or not checked) in line 18. (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNotifiedUponAdmissionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyUponAdmission</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNotifiedUponAdmissionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyUponAdmission</xsl:with-param>
					  </xsl:call-template>
                      Notified individuals of the financial assistance policy on admission
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNotifiedBeforeDischargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyBeforeDischarge</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNotifiedBeforeDischargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyBeforeDischarge</xsl:with-param>
					  </xsl:call-template>
                      Notified individuals of the financial assistance policy prior to discharge
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNotifiedAllPatientsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifiedAllPatients</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNotifiedAllPatientsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifiedAllPatients</xsl:with-param>
					  </xsl:call-template>
                      Notified individuals of the financial assistance policy in communications with the individuals regarding the individuals’ bills
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="DocumentedEligDeterminationInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHDocumentedDetermination</xsl:with-param>
								  </xsl:call-template>
								</input>							
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="DocumentedEligDeterminationInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHDocumentedDetermination</xsl:with-param>
								  </xsl:call-template>
								  Documented its determination of whether individuals were eligible for financial assistance under the hospital facility’s financial assistance policy
								</label> 
							</td>
						</tr>
					</table>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActionsTakenInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsTaken</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherActionsTakenInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsTaken</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoneMadeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoneMadeInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="NoneMadeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoneMadeInd</xsl:with-param>
					  </xsl:call-template>
                      None of these efforts were made
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:187mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Policy Relating to Emergency Medical Care
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a written policy relating to emergency medical care that required the
                    hospital facility to provide, without discrimination, care for emergency medical conditions to individuals regardless of their
                    eligibility under the hospital facility’s financial assistance policy?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="NondisEmergencyCarePolicyInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="NondisEmergencyCarePolicyInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "No," indicate why:
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyCareInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyCare</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="NoEmergencyCareInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyCare</xsl:with-param>
					  </xsl:call-template>
                      The hospital facility did not provide care for any emergency medical conditions
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyCarePolicyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyPolicy</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="NoEmergencyCarePolicyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyPolicy</xsl:with-param>
					  </xsl:call-template>
                      The hospital facility’s policy was not in writing
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EmergencyCareLimitedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEmergencyCareLimited</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="EmergencyCareLimitedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEmergencyCareLimited</xsl:with-param>
					  </xsl:call-template>
                      The hospital facility limited who was eligible to receive care for emergency medical conditions (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherReasonInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherReason</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherReasonInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherReason</xsl:with-param>
					  </xsl:call-template>
                    Other (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Charges to Individuals Eligible for Assistance Under the FAP (FAP-Eligible Individuals)
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    22
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate how the hospital facility determined, during the tax year, the maximum amounts that can be charged
                    to FAP-eligible individuals for emergency or other medically necessary care.
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;"> 
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="LowestNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHLowestNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								</input>					
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="LowestNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHLowestNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								  The hospital facility used its lowest negotiated commercial insurance rate when calculating the maximum amounts that can be charged
								</label>
							</td>
						</tr>
					</table> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;"> 
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="AverageNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHAverageNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								</input>				
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="AverageNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHAverageNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								  The hospital facility used the average of its three lowest negotiated commercial insurance rates when calculating the maximum amounts that can be charged
								</label>
							</td>
						</tr>
					</table> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicareRatesInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicareRate</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="MedicareRatesInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicareRate</xsl:with-param>
					  </xsl:call-template>
					  The hospital facility used the Medicare rates when calculating the maximum amounts that can be charged
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethodUsedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUsedOtherMethod</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherMethodUsedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUsedOtherMethod</xsl:with-param>
					  </xsl:call-template>
					  Other (describe in Section C)
					</label>
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
                    23
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    During the tax year, did the hospital facility charge any FAP-eligible individual to whom the hospital facility provided emergency or other medically necessary services more than the amounts generally billed to individuals who had insurance covering such care?
                    <span class="styDotLn" style="float:none">............................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    23
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," explain in Section C.
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
                    24
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    During the tax year, did the hospital facility charge any FAP-eligible individual an amount equal to the gross charge for any service provided to that individual?
                    <span class="styDotLn" style="float:none">.........................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    24
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="GrossChargesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="GrossChargesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," explain in Section C.
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
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
            </div>
          </xsl:if>   
              
          <xsl:for-each select="$Form990ScheduleHData/HospitalFcltyPoliciesPrctcGrp">
            <!-- PAGE 4 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2014</div>
              <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
              
              <div class="styLNDesc" style="width: 187mm;padding-top:0mm;font-size:8pt;font-weight:bold;">Section  B. Facility Policies and Practices</div><br/>
              <span style="font-weight:normal;">(Complete a separate Section B for each of the hospital facilities or facility reporting groups listed in Part V, Section A)</span><br/>     
            </div>    
      
            <table border="0" cellspacing="0" cellpadding="0" style="width:186mm;font-size:7pt;">
				<tr>
					<td style="width:86mm;">
						<span style="width:1mm;"/>
					</td>
					<td style="width:100mm;">
					    <span style="width:100mm;font-weight:normal;">
						  <xsl:call-template name="PopulateText">
						    <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
						  </xsl:call-template>
					    </span>
					</td>
				</tr>
				<tr>
					<td style="width:86mm;">
						<span style="font-weight:bold;">Name of hospital facility or letter of facility reporting group</span>
					</td>
					<td style="width:100mm;">
						<span class="styIRS990ScheduleHUnderlinedText" style="width:100mm;font-weight:normal;">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						  </span>
					</td>
				</tr>
			</table>  
			<span style="height:3.5mm;"/>
			
			<table border="0" cellspacing="0" cellpadding="0" style="width:171mm;font-size:7pt;">			
				<tr>
					<td style="width:133mm;">
					    <span style="font-weight:bold;">Line number of hospital facility, or line numbers of hospital facilities in a facility </span><br/>
					    <span style="font-weight:bold;">reporting group (from Part V, Section A):</span>
					</td>
					<td style="width:38mm;">
						<span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:55mm;font-weight:normal;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FacilityNum"/>
						  </xsl:call-template>
					    </span>
				    </td>
				</tr>
			</table>  
			
             <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="3" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:bold;">
                    Community Health Needs Assessment 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    1<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility first licensed, registered, or similarly recognized by a State as a hospital
					facility in the current tax year or the immediately preceding tax year?.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">......................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    1
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="FirstLicensedCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="FirstLicensedCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr> 
                <!-- Part V Section B line 2 -->
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    2<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility acquired or placed into service as a tax-exempt hospital in the
					current tax year or the immediately preceding tax year?  If “Yes,” provide details of the acquisition in Section C.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    2
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TaxExemptHospitalCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TaxExemptHospitalCYOrPYInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <!-- Part V Section B line 3 -->
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    3<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    During the tax year or either of the two immediately preceding tax years, did the hospital facility conduct
					a community health needs assessment (CHNA)? If "No," skip to line 12.<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    3
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:159mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes," indicate what the CHNA report describes (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDefinitionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDefinition</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommunityDefinitionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDefinition</xsl:with-param>
					  </xsl:call-template>
                      A definition of the community served by the hospital facility
					</label> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityDemographicsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDemographics</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommunityDemographicsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityDemographics</xsl:with-param>
					  </xsl:call-template>
                      Demographics of the community 
					</label> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
					<table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ExistingResourcesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHExistingResources</xsl:with-param>
								  </xsl:call-template>
								</input>
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="ExistingResourcesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHExistingResources</xsl:with-param>
								  </xsl:call-template>
								  Existing health care facilities and resources within the community that are available to respond to the health needs of the community
								</label> 
							</td>
						</tr>
					</table>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="HowDataObtainedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHHowDataObtained</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="HowDataObtainedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHHowDataObtained</xsl:with-param>
					  </xsl:call-template>
                      How data was obtained 
					</label>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommunityHealthNeedsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityHealthNeeds</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommunityHealthNeedsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommunityHealthNeeds</xsl:with-param>
					  </xsl:call-template>
                      The significant health needs of the community 
					</label>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="OtherHealthIssuesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHOtherHealthIssues</xsl:with-param>
								  </xsl:call-template>
								</input>					
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="OtherHealthIssuesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHOtherHealthIssues</xsl:with-param>
								  </xsl:call-template>
								  Primary and chronic disease needs and other health issues of uninsured persons, low-income persons, and minority groups
								</label>
							</td>
						</tr>
					</table> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CommunityHlthNeedsIdProcessInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHIdentifyingProcess</xsl:with-param>
								  </xsl:call-template>
								</input>					
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CommunityHlthNeedsIdProcessInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHIdentifyingProcess</xsl:with-param>
								  </xsl:call-template>
								  The process for identifying and prioritizing community health needs and services to meet the community health needs 
								</label>
							</td>
						</tr>
					</table>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ConsultingProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHConsultingProcess</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ConsultingProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHConsultingProcess</xsl:with-param>
					  </xsl:call-template>
                      The process for consulting with persons representing the community’s interests
					</label>  
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InformationGapsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInformationGaps</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="InformationGapsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInformationGaps</xsl:with-param>
					  </xsl:call-template>
                      Information gaps that limit the hospital facility’s ability to assess the community’s health needs
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    j
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOther</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    4<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Indicate the tax year the hospital facility last conducted a CHNA: 20
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedYr"/>
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
                    5<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    In conducting its most recent CHNA, did the hospital facility take into account input from persons who represent the broad interests of the
                    community served by the hospital facility, including those with special knowledge of or expertise in public
                    health? If "Yes," describe in Section C how the hospital facility took into account input from
                    persons who represent the community, and identify the persons the hospital facility consulted
                    <span class="styDotLn" style="float:none">.................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    5
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccountOthersInputInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="TakeIntoAccountOthersInputInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    6a<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility’s CHNA conducted with one or more other hospital facilities? If "Yes," list the other hospital facilities in Section C<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    6a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithOtherFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithOtherFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Was the hospital facility’s CHNA conducted with one or more organizations other than hospital
					facilities?” If “Yes,” list the other organizations in Section C.
                    <span class="styDotLn" style="float:none">............................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    6b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithNonFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAConductedWithNonFcltsInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    7<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility make its CHNA report widely available to the public?
                    <span class="styDotLn" style="float:none">..............</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    7
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAReportWidelyAvailableInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CHNAReportWidelyAvailableInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes," indicate how the CHNA report was made widely available (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="RptAvailableOnOwnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOwnWebsite</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="RptAvailableOnOwnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOwnWebsite</xsl:with-param>
					  </xsl:call-template>
                      Hospital facility’s website (list url): 
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:105mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="OwnWebsiteURLTxt "/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherWebsiteInd "/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                      Other website (list url): 
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:120mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="OtherWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PaperCopyPublicInspectionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPaperCopyPublicInspectionIndt</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PaperCopyPublicInspectionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPaperCopyPublicInspectionInd</xsl:with-param>
					  </xsl:call-template>
                      Made a paper copy available for public inspection without charge at the hospital facility
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="RptAvailableThruOtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethod</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="RptAvailableThruOtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethod</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    8<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the hospital facility adopt an implementation strategy to meet the significant community health needs<br/>
					identified through its most recently conducted CHNA? If "No," skip to line 11.
                    <span class="styDotLn" style="float:none">.............</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    8
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ImplementationStrategyAdoptInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:top;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ImplementationStrategyAdoptInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    9<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Indicate the tax year the hospital facility last adopted an implementation strategy: 20
                    <span class="styIRS990ScheduleHUnderlinedText" style="width:5mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ImplementationStrategyAdptYr"/>
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
                    10<span style="width:1.5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Is the hospital facility's most recently adopted implementation strategy posted on a website?
                    <span class="styDotLn" style="float:none">........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    10
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyPostedWebsiteInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyPostedWebsiteInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                     If "Yes" (list url):
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:105mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="StrategyWebsiteURLTxt "/>
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
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "No," is the hospital facility’s most recently adopted implementation strategy attached to this return?
                    <span class="styDotLn" style="float:none">......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    10b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyAttachedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="StrategyAttachedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    11<span style="width:1.5mm"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Describe in Section C how the hospital facility is addressing the significant needs identified in its
					most recently conducted CHNA and any such needs that are not being addressed together with the
					reasons why such needs are not being addressed.
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
                    12a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Did the organization incur an excise tax under section 4959 for the hospital facility's failure to conduct a CHNA as required by section 501(r)(3)?
                    <span class="styDotLn" style="float:none">...........................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    12a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="OrganizationIncurExciseTaxInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="OrganizationIncurExciseTaxInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes" to line 12a, did the organization file Form 4720 to report the section 4959 excise tax?
                    <span class="styDotLn" style="float:none">......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;text-align:center;vertical-align:bottom;vertical-align:bottom;">
                    12b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="Form4720FiledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="Form4720FiledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If "Yes" to line 12b, what is the total amount of section 4959 excise tax the organization reported on Form 4720 for all of its hospital facilities? 
                    $<span class="styIRS990ScheduleHUnderlinedText" style="width:50mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExciseReportForm4720ForAllAmt"/>
                      </xsl:call-template>
                    </span><br/><br/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="styShadingCell" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                </tr>
              </tbody>
            </table>
            
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
            </div>
            
            <!-- PAGE 5 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2014</div>
              <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:180mm;height:4mm;padding-bottom:1.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <table border="0" cellspacing="0" cellpadding="0" style="width:180mm;font-size:7pt;">
						<tr>
							<td style="width:82mm;">
								<span style="width:1mm;"/>
							</td>
							<td style="width:98mm;">
								<span style="width:98mm;font-weight:normal;">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td style="width:82mm;">
								<span style="font-weight:bold;">Name of hospital facility or letter of facility reporting group</span>
							</td>
							<td style="width:98mm;">
								<span class="styIRS990ScheduleHUnderlinedText" style="width:98mm;font-weight:normal;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								  </span>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:163mm;height:4mm;padding-bottom:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <span style="width:1mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:187mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Financial Assistance Policy (FAP)
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-size:7pt;font-weight:normal;">
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
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    Explained eligibility criteria for financial assistance, and whether such assistance included free or discounted care?
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    13
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="EligCriteriaExplainedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="EligCriteriaExplainedInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-size:7pt;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    If “Yes,” indicate the eligibility criteria explained in the FAP: 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;vertical-align:top;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
					<input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtFreeDscntInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFPGFamilyIncmLmtFreeDscntInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtFreeDscntInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFPGFamilyIncmLmtFreeDscntInd</xsl:with-param>
					  </xsl:call-template>
                      Federal poverty guidelines (FPG), with FPG family income limit for eligibility for free care of 
                      <span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtFreeCarePct"/>
						  </xsl:call-template>
						</span>% 
						<br/><span style="width:5mm;"/>
						and FPG family income limit for eligibility for discounted care of 
						<span class="styIRS990ScheduleHUnderlinedText" style="width:3mm;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FPGFamilyIncmLmtDscntCarePct"/>
						  </xsl:call-template>
						</span>%
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="IncomeLeIncomeLevelCriteriaIndvelInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHIncomeLevelCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="IncomeLeIncomeLevelCriteriaIndvelInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHIncomeLevelCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Income level other than FPG (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="AssetLevelCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHAssetLevelCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="AssetLevelCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHAssetLevelCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Asset level
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicalIndigencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicalIndigencyCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="MedicalIndigencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicalIndigencyCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Medical indigency
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="InsuranceStatusCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInsuranceStatusCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="InsuranceStatusCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHInsuranceStatusCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Insurance status
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="UnderinsuranceStatCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUnderinsuranceStatCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="UnderinsuranceStatCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUnderinsuranceStatCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Underinsurance discount
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ResidencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHResidencyCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ResidencyCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHResidencyCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Residency
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherCriteriaInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherCriteriaInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherCriteriaInd</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Explained the basis for calculating amounts charged to patients?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    14
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainedBasisInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="ExplainedBasisInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    15
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                   Explained the method for applying for financial assistance?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">...................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    15
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AppFinancialAsstExplnInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AppFinancialAsstExplnInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If “Yes,” indicate how the hospital facility’s FAP or FAP application form (including accompanying
					instructions) explained the method for applying for financial assistance (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DescribedInfoInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedInfoInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="DescribedInfoInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedInfoInd</xsl:with-param>
					  </xsl:call-template>
                      Described the information the hospital facility may require an individual to provide as part of his or her application.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="DescribedSuprtDocInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedSuprtDocInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="DescribedSuprtDocInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHDescribedSuprtDocInd</xsl:with-param>
					  </xsl:call-template>
                      Described the supporting documentation the hospital facility may require an individual to submit as part of his or 
                      <br/><span style="width:5mm;"/>her application.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ProvidedHospitalContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedHospitalContactInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ProvidedHospitalContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedHospitalContactInd</xsl:with-param>
					  </xsl:call-template>
                      Provided the contact information of hospital facility staff who can provide an individual with information about the 
                      <br/><span style="width:5mm;"/>FAP and FAP application process.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ProvidedNonprofitContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedNonprofitContactInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ProvidedNonprofitContactInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHProvidedNonprofitContactInd</xsl:with-param>
					  </xsl:call-template>
                      Provided the contact information of nonprofit organizations or government agencies that may be sources of 
                      <br/><span style="width:5mm;"/>assistance with FAP applications.
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethodInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherMethodInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherMethodInd</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Included measures to publicize the policy within the community served by the hospital facility?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.......</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    16
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasuresInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="IncludesPublicityMeasuresInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," indicate how the hospital facility publicized the policy (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvailableOnWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvailableOnWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                     The FAP was widely available on a website (list url):
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:80mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FAPAvailableOnWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvailableOnWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvailableOnWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                      The FAP application form was widely available on a website (list url):
					  <span class="styIRS990ScheduleHUnderlinedText" style="width:58mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPSummaryOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSummaryOnWebsiteInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPSummaryOnWebsiteInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSummaryOnWebsiteInd</xsl:with-param>
					  </xsl:call-template>
                      A plain language summary of the FAP was widely available on a website (list url):
					  <br/><span style="width:5mm;"/><span class="styIRS990ScheduleHUnderlinedText" style="width:80mm;">
						  <xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="FAPAppAvailableOnWebsiteURLTxt"/>
						  </xsl:call-template>
					  </span>
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAvlblOnRequestNoChargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvlblOnRequestNoChargeInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAvlblOnRequestNoChargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAvlblOnRequestNoChargeInd</xsl:with-param>
					  </xsl:call-template>
                      The FAP was available upon request and without charge (in public locations in the hospital facility and by mail)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPAppAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvlblOnRequestNoChrgInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPAppAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPAppAvlblOnRequestNoChrgInd</xsl:with-param>
					  </xsl:call-template>
                      The FAP application form was available upon request and without charge (in public locations in the hospital facility 
                      <br/><span style="width:5mm;"/>and by mail)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPSumAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSumAvlblOnRequestNoChrgInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPSumAvlblOnRequestNoChrgInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPSumAvlblOnRequestNoChrgInd</xsl:with-param>
					  </xsl:call-template>
                      A plain language summary of the FAP was available upon request and without charge (in public locations in the 
                      <br/><span style="width:5mm;"/>hospital facility and by mail)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    g
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNoticeDisplayedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPNoticeDisplayedInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNoticeDisplayedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHFAPNoticeDisplayedInd</xsl:with-param>
					  </xsl:call-template>
                      Notice of availability of the FAP was conspicuously displayed throughout the hospital facility
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    h
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="CommuntityNotifiedFAPInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommuntityNotifiedFAPInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="CommuntityNotifiedFAPInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHCommuntityNotifiedFAPInd</xsl:with-param>
					  </xsl:call-template>
                      Notified members of the community who are most likely to require financial assistance about availability of the FAP
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    i
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherPublicityInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherPublicity</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherPublicityInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherPublicity</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                    17
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a separate billing and collections policy, or a written financial
                    assistance policy (FAP) that explained all of the actions the hospital facility or other authorized party may take upon non-payment?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">..................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    17
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="FAPActionsOnNonpaymentInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="FAPActionsOnNonpaymentInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    18
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Check all of the following actions against an individual that were permitted under the hospital facility's policies during the tax year before making reasonable efforts to determine the individual’s eligibility under the facility’s FAP:
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitReportToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitReportToCreditAgency</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitReportToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitReportToCreditAgency</xsl:with-param>
					  </xsl:call-template>
                      Reporting to credit agency(ies)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitSellingDebtInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitSellingDebtInd</xsl:with-param>
					  </xsl:call-template>
                      Selling an individual’s debt to another party
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitLegalJudicialProcessInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitLegalJudicialProcessInd</xsl:with-param>
					  </xsl:call-template>
                      Actions that require a legal or judicial process
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitOtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitOtherActionsInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitOtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitOtherActionsInd</xsl:with-param>
					  </xsl:call-template>
                      Other similar actions (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="PermitNoActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitNoActionsInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="PermitNoActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHPermitNoActionsInd</xsl:with-param>
					  </xsl:call-template>
                      None of these actions or other similar actions were permitted
					</label>
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
              </tbody>
            </table>
          
            <!-- footer line -->
            <div style="width:187mm;float:none;clear:both;padding-top:.5mm;border-top:1px solid black;" class="pageend">
              <div style="font-weight:bold;width:95mm;font-size:6pt;float:left;border-bottom-width:1px;"/>
              <div style="width:33mm;padding-left:9mm;font-size:6pt;float:left;"/>
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
            </div>
            
            <!-- PAGE 6 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule H (Form 990) 2014</div>
              <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:180mm;height:4mm;padding-bottom:1.5mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <table border="0" cellspacing="0" cellpadding="0" style="width:180mm;font-size:7pt;">
						<tr>
							<td style="width:82mm;">
								<span style="width:1mm;"/>
							</td>
							<td style="width:98mm;">
								<span style="width:98mm;font-weight:normal;">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine1Txt"/>
								  </xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td style="width:82mm;">
								<span style="font-weight:bold;">Name of hospital facility or letter of facility reporting group</span>
							</td>
							<td style="width:98mm;">
								<span class="styIRS990ScheduleHUnderlinedText" style="width:98mm;font-weight:normal;">
									<xsl:call-template name="PopulateText">
									  <xsl:with-param name="TargetNode" select="HospitalFacilityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								  </span>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="2" style="width:163mm;height:4mm;padding-bottom:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    <span style="width:1mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;font-size:7pt;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    Yes
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;border-top-width:1px;font-size:7pt;font-weight:bold;text-align:bottom;">
                    No
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    19
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;font-weight:normal;">
                    Did the hospital facility or other authorized third party perform any of the following actions
                    during the tax year before making reasonable efforts to determine the individual’s eligibility under
                    the facility’s FAP?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">.........</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    19
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivitiesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:1px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="CollectionActivitiesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," check all actions in which the hospital facility or a third party engaged:
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="ReportingToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHReportToCreditAgency</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="ReportingToCreditAgencyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHReportToCreditAgency</xsl:with-param>
					  </xsl:call-template>
                      Reporting to credit agency(ies)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EngagedSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedSellingDebtInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="EngagedSellingDebtInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedSellingDebtInd</xsl:with-param>
					  </xsl:call-template>
                      Selling an individual’s debt to another party
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EngagedLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedLegalJudicialProcessInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="EngagedLegalJudicialProcessInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEngagedLegalJudicialProcessInd</xsl:with-param>
					  </xsl:call-template>
                      Actions that require a legal or judicial process
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherActionsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsInd</xsl:with-param>
					  </xsl:call-template>
                      Other similar actions (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate which efforts the hospital facility or other authorized party made before initiating any of the actions listed (whether or not checked) in line 18. (check all that apply):
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNotifiedUponAdmissionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyUponAdmission</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNotifiedUponAdmissionInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyUponAdmission</xsl:with-param>
					  </xsl:call-template>
                      Notified individuals of the financial assistance policy on admission
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNotifiedBeforeDischargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyBeforeDischarge</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNotifiedBeforeDischargeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifyBeforeDischarge</xsl:with-param>
					  </xsl:call-template>
                      Notified individuals of the financial assistance policy prior to discharge
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="FAPNotifiedAllPatientsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifiedAllPatients</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="FAPNotifiedAllPatientsInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNotifiedAllPatients</xsl:with-param>
					  </xsl:call-template>
                      Notified individuals of the financial assistance policy in communications with the individuals regarding the individuals’ bills
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;">
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="DocumentedEligDeterminationInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHDocumentedDetermination</xsl:with-param>
								  </xsl:call-template>
								</input>							
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="DocumentedEligDeterminationInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHDocumentedDetermination</xsl:with-param>
								  </xsl:call-template>
								  Documented its determination of whether individuals were eligible for financial assistance under the hospital facility’s financial assistance policy
								</label> 
							</td>
						</tr>
					</table>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    e
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherActionsTakenInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsTaken</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherActionsTakenInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherActionsTaken</xsl:with-param>
					  </xsl:call-template>
                      Other (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    f
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoneMadeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoneMadeInd</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="NoneMadeInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoneMadeInd</xsl:with-param>
					  </xsl:call-template>
                      None of these efforts were made
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:187mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Policy Relating to Emergency Medical Care
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Did the hospital facility have in place during the tax year a written policy relating to emergency medical care that required the
                    hospital facility to provide, without discrimination, care for emergency medical conditions to individuals regardless of their
                    eligibility under the hospital facility’s financial assistance policy?<span style="width:2mm;"/>
                    <span class="styDotLn" style="float:none">................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    21
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="NondisEmergencyCarePolicyInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="NondisEmergencyCarePolicyInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "No," indicate why:
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyCareInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyCare</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="NoEmergencyCareInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyCare</xsl:with-param>
					  </xsl:call-template>
                      The hospital facility did not provide care for any emergency medical conditions
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="NoEmergencyCarePolicyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyPolicy</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="NoEmergencyCarePolicyInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHNoEmergencyPolicy</xsl:with-param>
					  </xsl:call-template>
                      The hospital facility’s policy was not in writing
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-size:7pt;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="EmergencyCareLimitedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEmergencyCareLimited</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="EmergencyCareLimitedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHEmergencyCareLimited</xsl:with-param>
					  </xsl:call-template>
                      The hospital facility limited who was eligible to receive care for emergency medical conditions (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-size:7pt;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-size:7pt;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherReasonInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherReason</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherReasonInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHOtherReason</xsl:with-param>
					  </xsl:call-template>
                    Other (describe in Section C)
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" colspan="5" style="width:171mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:1px;text-align:left;padding-left:1mm;font-size:7pt;font-weight:bold;">
                    Charges to Individuals Eligible for Assistance Under the FAP (FAP-Eligible Individuals)
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    22
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    Indicate how the hospital facility determined, during the tax year, the maximum amounts that can be charged
                    to FAP-eligible individuals for emergency or other medically necessary care.
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    a
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;"> 
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="LowestNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHLowestNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								</input>					
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="LowestNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHLowestNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								  The hospital facility used its lowest negotiated commercial insurance rate when calculating the maximum amounts that can be charged
								</label>
							</td>
						</tr>
					</table> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;font-weight:bold;">
                    b
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
						<tr>
							<td style="text-align:left;vertical-align:top;"> 
								<input type="checkbox" class="IRS990ScheduleH_Checkbox">
								  <xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="AverageNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHAverageNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								</input>				
							</td>
							<td style="padding-left:0.5mm;">
								<label>
								  <xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="AverageNegotiatedRatesInd"/>
									<xsl:with-param name="BackupName">Form990ScheduleHAverageNegotiatedRates</xsl:with-param>
								  </xsl:call-template>
								  The hospital facility used the average of its three lowest negotiated commercial insurance rates when calculating the maximum amounts that can be charged
								</label>
							</td>
						</tr>
					</table> 
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    c
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="MedicareRatesInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicareRate</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="MedicareRatesInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHMedicareRate</xsl:with-param>
					  </xsl:call-template>
					  The hospital facility used the Medicare rates when calculating the maximum amounts that can be charged
					</label>
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
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;font-weight:bold;">
                    d
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:163mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    <input type="checkbox" class="IRS990ScheduleH_Checkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="OtherMethodUsedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUsedOtherMethod</xsl:with-param>
                      </xsl:call-template>
                    </input>
					<label>
					  <xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="OtherMethodUsedInd"/>
						<xsl:with-param name="BackupName">Form990ScheduleHUsedOtherMethod</xsl:with-param>
					  </xsl:call-template>
					  Other (describe in Section C)
					</label>
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
                    23
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    During the tax year, did the hospital facility charge any FAP-eligible individual to whom the hospital facility provided emergency or other medically necessary services more than the amounts generally billed to individuals who had insurance covering such care?
                    <span class="styDotLn" style="float:none">................................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    23
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="AmountsGenerallyBilledInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:normal;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," explain in Section C.
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
                    24
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    During the tax year, did the hospital facility charge any FAP-eligible individual an amount equal to the gross charge for any service provided to that individual?
                    <span class="styDotLn" style="float:none">...........................</span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-size:7pt;font-weight:bold;">
                    24
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateYesBoxText">
                        <xsl:with-param name="TargetNode" select="GrossChargesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:1px;border-right-width:0px;border-top-width:0px;text-align:center;vertical-align:bottom;font-weight:normal;">
                    <span>
                      <xsl:call-template name="PopulateNoBoxText">
                        <xsl:with-param name="TargetNode" select="GrossChargesInd"/>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:4mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:right;vertical-align:top;padding-right:1mm;font-weight:bold;">
                    <span style="width:5mm;"/>
                  </td>
                  <td class="IRS990ScheduleH_LineIndexMid" style="width:167mm;height:4mm;padding-top:.25mm;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-top-width:0px;text-align:left;font-weight:normal;">
                    If "Yes," explain in Section C.
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
              <div style="width:58mm;font-size:6pt;text-align:right;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
            </div>
          </xsl:for-each>

		  <!-- PAGE 6 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2014</div>
            <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!-- Part V Section C  -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName">Part V</div>
            <span style="width:168mm;" class="styPartDesc">Facility Information
              <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
            </span>
          </div>
          
          <!-- PART V Section C   Supplemental Information -->
          <table border="0" cellspacing="0" cellpadding="0" style="width:182mm;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;border-right-width:0px;">
                <tr>
                  <th colspan="3" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:187mm;border-style:solid;border-color:black;border-bottom-width:1px; border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:187mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  C.  Supplemental Information for Part V, Section B. </b>
						<span style="font-weight:normal;">Provide descriptions required for Part V, Section B, lines 2, 3j, 5, 6a, 6b, 7d, 11, 13b, 13h, 15e,
							16i, 18d, 19d, 20e, 21c, 21d, 22d, 23, and 24. If applicable, provide separate descriptions for each
							hospital facility in a facility reporting group, designated by facility reporting group letter and hospital
							facility line number from Part V, Section A (“A, 1,” “A, 4,” “B, 2,” “B, 3,” etc.) and name of hospital
							facility.
						</span>
                    </div>
                  </th>
                </tr>
                <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-left-width:0px;border-color:black;">Form and Line Reference </th>
                    <th class="styDepTblCell" scope="col" style="width:137mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-left-width:0px;border-color:black;border-right:none;">Explanation  </th>
                  </tr>
              </thead>  
              <tbody>
                <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/SupplementalInformationGrp) &lt; 20)">
                <xsl:for-each select="$Form990ScheduleHData/SupplementalInformationGrp">
				  <tr>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:50mm;text-align:left;padding-top:1mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:87mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                    </tr>
				</xsl:for-each>
				<!-- Render out the rest of the empty rows if less than $RowsToShow data items present for consistency with PDF display. -->
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="$RowsToShow - $SupplementalSize"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/SupplementalInformationGrp) &gt; 20) ">
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="20"/>
                      <xsl:with-param name="IsSeparated" select="'yes' "/>
                    </xsl:call-template>
                  </xsl:if> 
			 </tbody>
          </table>
          
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;border-top-width:0px;border-bottom-width:0px;border-left-width:0px;border-right-width:0px;border-color:black;border-style:solid;">
            <!--<div class="styNBB" style="width:187mm;float:none;clear:both;">-->
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
          </div>
          <!-- END Part V Section C -->
          
          <!-- PAGE 7 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2014</div>
            <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
            </div>
          </div>
          <!-- END Page Header  -->
          
          <!-- BEGIN Part V  Section D -->
          <div class="styLNDesc" style="width:187mm;height:2mm;padding-top:0mm;padding-bottom:0mm;font-size:8pt;font-weight:bold;border-style:solid;border-color:black;border-top-width:1px;border-left-width:0px;border-right-width:0px;border-bottom-width:1px;">
            <span class="styPartName">Part V</span>
            <span style="width:168mm;" class="styPartDesc">Facility Information
              <span class="styItalicText" style="width:15mm;font-weight:normal;"> (continued) </span>
            </span>
            <!-- Table expand/collapse toggle button-->
			  <div style="width:187mmfloat:right;clear:none;">
				<xsl:call-template name="SetDynamicTableToggleButton">
				  <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp"/>
				  <xsl:with-param name="containerHeight" select="10"/>
				  <xsl:with-param name="containerID" select=" 'PartVSecCctn' "/>
				</xsl:call-template>
			  </div>
			  <!--Table expand/collapse toggle button end-->
          </div><br/>
              
          
            
          <div class="styTableContainer" id="PartVSecCctn" style="height:100mm;border-bottom-width:0;">
          
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;border-right-width:0px;">
                <tr>
                  <th colspan="3" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:187mm;border-style:solid;border-color:black;border-bottom-width:1px; border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:187mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  D.  Other Health Care Facilities That Are Not Licensed, Registered, or Similarly Recognized as a Hospital Facility</b>
                    </div>
                    <span style="font-weight:normal;">(list in order of size, from largest to smallest)</span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">How many non-hospital health care facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:40mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/FacilityNum"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:5mm;"/>
                  </th>
                </tr>
                <tr style="height:8mm;">
                  <th colspan="2" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:bottom;padding-top:2mm;width:102mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;">
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:bottom;width:85mm;border-bottom-width:1px; border-left-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:8pt;">
                    <span style="font-weight:normal">Type of Facility (describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp">
                
                  <xsl:if test="($Print != $Separated) or (count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt; 11 )">
                    <tr>
                      <td style="width:7mm;vertical-align:top;border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-style:solid;border-color:black; border-right-width:0px;">
                        <span style="width:3mm;font-weight:bold;">
                          <xsl:value-of select="position()"/>
                        </span>
                      </td>
                      <td class="styTableCellText" style="width:90mm;padding-left:1mm;border-bottom-width:1px; border-left-width:0px; border-style:solid;border-color:black; border-right-width:0px;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="USAddress"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:85mm;vertical-align:top;padding-left:1mm;text-align:left;border-bottom-width:1px; border-left-width:1px; border-style:solid;border-color:black; border-right-width:0px;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FacilityTxt"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt; 1 or (count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10 and ($Print = $Separated))">
                  <tr>
                      <td style="width:7mm;border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-style:solid;border-color:black; border-right-width:0px;">
                        <span style="width:3mm;font-weight:bold;">
                          <xsl:value-of select="position()"/>
                        </span>
                      </td>
                    <td class="styTableCell" style="width:90mm;border-bottom-width:1px; border-left-width:0px; border-style:solid;border-color:black; border-right-width:0px;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp"/>
                      </xsl:call-template>
                      <br/>
                      <span style="width:1px"/>
                    </td>
                    <td class="styTableCell" style="border-bottom-width:1px; border-left-width:1px; border-style:solid;border-color:black; border-right-width:0px;width:85mm;text-align:left;">
                      <span style="width:2px;"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;2 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">2</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;3 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">3</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;4 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">4</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;5 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">5</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;6 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">6</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;7 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">7</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;8 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">8</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;9 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">9</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="count ($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &lt;10 or ((count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt; 10) and ($Print = $Separated))">
                  <xsl:call-template name="IRS990SchHPartVSecCTableFillerRow">
                    <xsl:with-param name="index">10</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
              </tbody>
            </table>
          </div> 
          
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="containerID" select=" 'PartVSecCctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          <!-- END PART V  Section D   -->
          
          <!-- footer line -->
          <div style="width:187mm;float:none;clear:both;padding-top:.5mm;" class="pageend">
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:0px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
          </div>
          
          <!-- PAGE 8 HEADER  -->
          <div class="styBB" style="width:187mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule H (Form 990) 2014</div>
            <div style="float:right;">Page 
              <span style="font-weight:bold;font-size:8pt;">
                <script language="JavaScript" type="text/javascript">
                  nextPage();
                </script>
              </span>
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
            Provide the following information.
          </div>
          
          <span style="height:2mm;"/>
          
          <table style="width:187mm;font-size:7pt;">
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">1</td>
                  <td style="width:177mm;">
                      <b>Required descriptions.</b> Provide the descriptions required for Part I, lines 3c, 6a, and 7; Part II and Part III, lines 2, 3, 4, 8 and 9b.
                  </td>
                </tr>
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">2</td>
                  <td style="width:177mm;">
                    <b>Needs assessment.</b> Describe how the organization assesses the health care needs of the communities it
                    serves, in addition to any CHNAs reported in Part V, Section B.
                  </td>
                </tr> 
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">3</td>
                  <td style="width:177mm;">
                    <b>Patient education of eligibility for assistance.</b> Describe how the organization informs and educates patients and persons
                    who may be billed for patient care about their eligibility for assistance under federal, state, or local government programs or
                    under the organization’s financial assistance policy.
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">4</td>
                  <td style="width:177mm;">
                    <b>Community information.</b> Describe the community the organization serves, taking into account the geographic area and
                    demographic constituents it serves.
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">5</td>
                  <td style="width:177mm;">
                    <b>Promotion of community health.</b> Provide any other information important to describing how the organization’s hospital facilities or
                    other health care facilities further its exempt purpose by promoting the health of the community (e.g., open medical staff, community
                    board, use of surplus funds, etc.).
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">6</td>
                  <td style="width:177mm;">
                    <b>Affiliated health care system.</b> If the organization is part of an affiliated health care system, describe the respective roles of the
                    organization and its affiliates in promoting the health of the communities served.
                  </td>
                </tr>    
                <tr>
                  <td style="width:10mm;font-weight:bold;text-align:center;vertical-align:top;">7</td>
                  <td style="width:177mm;">
                    <b>State filing of community benefit report.</b> If applicable, identify all states with which the organization, or a related
                    organization, files a community benefit report.
                  </td>
                </tr>              
          </table>
          
          <span style="height:4mm;"/>
          <xsl:if test="(count($Form990ScheduleHData/SupplementalInformationDetail) &gt; 0)">
			  <table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
				  <thead class="styTableThead">
					<tr class="styDepTblHdr">
					  <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Form and Line Reference </th>
					  <th class="styDepTblCell" scope="col" style="width:137mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Explanation  </th>
					</tr>
				  </thead>
				  <tbody>
					<xsl:for-each select="$Form990ScheduleHData/SupplementalInformationDetail">
					  <tr>
						<xsl:attribute name="class">
						  <xsl:choose>
							<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						  </xsl:choose>
						</xsl:attribute>
						<td class="styTableCell" style="font-size:7pt;border-color:black;width:50mm;text-align:left;padding-top:1mm;vertical-align:top;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
						  </xsl:call-template>
						  <span class="styTableCellPad "/>
						</td>
						<td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:137mm;text-align:left;vertical-align:top;">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
						  </xsl:call-template>
						  <span class="styTableCellPad "/>
						</td>
					  </tr>
					</xsl:for-each>
				  </tbody>
				</table>
			</xsl:if>
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <!--<div class="styNBB" style="width:187mm;float:none;clear:both;">-->
            <div style="font-weight:bold;width:95mm;font-size:6pt;padding-top:1mm;float:left;border-bottom-width:1px;"/>
            <div style="width:33mm;padding-left:9mm;padding-top:1mm;font-size:6pt;float:left;"/>
            <div style="width:58mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">Schedule H (Form 990) 2014</div>
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
          <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/ManagementCoAndJntVenturesGrp) &gt; 14)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part IV -  Management Companies and Joint Ventures (see instructions)</span>
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
                <xsl:for-each select="$Form990ScheduleHData/ManagementCoAndJntVenturesGrp">
                  <tr style="height:6mm;">
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:50mm;vertical-align:top;text-align:left;">
                      <span style="width:5mm;font-weight:bold;">
                        <xsl:number value="position()" format="1"/>
                      </span>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
                      </xsl:call-template>
                      <xsl:if test="EntityName/BusinessNameLine2Txt !=''">
                        <br/>
                        <span style="width:5mm;"/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>
                    <td class="styDepTblCell" style="width:60mm;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="width:27mm;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="OrgProfitOrOwnershipPct"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="width:28mm;text-align:right;vertical-align:top;border-left-width:1px;">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="OfcrEtcProfitOrOwnershipPct"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="width:22mm;text-align:right;vertical-align:top;">
                      <xsl:call-template name="PopulatePercent">
                        <xsl:with-param name="TargetNode" select="PhysiciansProfitOrOwnershipPct"/>
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
          <xsl:if test="($Print = $Separated)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part V Section  A. Hospital Facilities</span>
            <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:7pt;clear:both;">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;">
                <tr>
                  <th class="styTableCellHeader" colspan="2" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:69mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;padding-bottom:1mm;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:69mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  A. Hospital Facilities</b>
                    </div>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">(list in order of size from largest to smallest—see instructions)</span><br/>                    
                    <span style="font-weight:normal;">How many hospital facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:20mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/HospitalFacilitiesCnt"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">Name, address, primary website address, and state license number (and if a group return, the name and EIN of the subordinate hospital organization that operates the hospital facility)</span>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="width:7mm;border-style:solid;border-color:black;border-left-width:1px;vertical-align:top;padding-top:.5mm;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col" valign="middle">
                    <img src="{$ImagePath}/990SchH_LicHosp.gif" alt="Licensed Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top; padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_GenMedSurg.gif" alt="General-Medical-Surgical"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ChildHosp.gif" alt="Children's Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px; border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_TeachHosp.gif" alt="Teaching Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;width:7mm;border-style:solid;border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px;" scope="col">
                    <img src="{$ImagePath}/990SchH_CriticalHosp.gif" alt="Critical Hospital"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid; border-color:black;border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ResearchFac.gif" alt="ResearchGrp Facility"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ER-24hrs.gif" alt="ER-24Hours"/>
                  </th>
                  <th class="styIRS990SchHVTImageBox" style="vertical-align:top;padding-top:.5mm;width:7mm;border-style:solid;border-color:black; border-left-width:0px;border-right-width:1px;border-top-width:0px;border-bottom-width:1px; " scope="col">
                    <img src="{$ImagePath}/990SchH_ER-Other.gif" alt="ER-Other"/>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;padding-bottom:1mm;width:29mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:1px;padding-left:1mm;font-size:7pt;">
                    <span style="font-weight:normal">Other (describe)</span>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="vertical-align:bottom;padding-bottom:1mm;width:33mm;border-bottom-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:7pt;">
                    <span style="font-weight:normal">Facility reporting group</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/HospitalFacilitiesGrp">
                
                  <!-- Adding the separator section -->
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styTableCellCtr " style="width:12mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FacilityNum"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellText" style="width:57mm;border-color:black;text-align:left;">
                      <xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                        </xsl:call-template>
                      </xsl:if>
                      <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                        </xsl:call-template>
                      </xsl:if>
                      <br/>
                      <xsl:if test="USAddress != ''">
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="USAddress"/>
                        </xsl:call-template>
                      </xsl:if>
                        <xsl:if test="WebsiteAddressTxt != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="WebsiteAddressTxt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="StateLicenseNum != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="StateLicenseNum"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="SubordinateHospitalName != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="SubordinateHospitalName"/>
                          </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="SubordinateHospitalEIN != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="SubordinateHospitalEIN"/>
                          </xsl:call-template>
                        </xsl:if>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="LicensedHospitalInd"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GeneralMedicalAndSurgicalInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ChildrensHospitalInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TeachingHospitalInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CriticalAccessHospitalInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ResearchFacilityInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="EmergencyRoom24HrsInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr " style="width:7mm;border-color:black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="EmergencyRoomOtherInd"/>
                      </xsl:call-template>
                      <span style="width:2px"/>
                    </td>
                    <td class="styTableCellCtr" style="width:29mm;border-color:black;text-align:left;padding-right:1px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="OtherDesc"/>
                      </xsl:call-template>
                      <span style="width:1px;"/>
                    </td>
                      <td class="styTableCell" style="width:33mm;border-color:black;padding-left:1mm;text-align:left;border-right-width:0px">
						<xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FacilityReportingGroupCd"/>
                        </xsl:call-template>
                        <span style="width:1px;"/>
                      </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          
          <!-- Begin SRD for first part -->
            <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/SupplementalInformationGrp) &gt;=20)">
             <span class="styRepeatingDataTitle">Form 990 Part V Section  C Supplemental Information for Part V, Section B.
			  </span>
              <table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
                <thead class="styTableThead" style="font-size:7pt;">
                <tr class="styDepTblHdr">
                   <th colspan="3" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:187mm;border-style:solid;border-color:black;border-bottom-width:1px; border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:187mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section  C.  Supplemental Information for Part V, Section B.</b>
						<span style="font-weight:normal;">Provide descriptions required for Part V, Section B, lines
							1j, 3, 4, 5d, 6i, 7, 10, 11, 12i, 14g, 16e, 17e, 18e, 19c, 19d, 20d, 21, and 22. If applicable, provide separate descriptions
							for each facility in a facility reporting group, designated by &quot;Facility A,&quot; &quot;Facility B,&quot; etc.
						</span>
                    </div>
                  </th>
                </tr>
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Form and Line Reference </th>
                    <th class="styDepTblCell" scope="col" style="width:137mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Explanation  </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$Form990ScheduleHData/SupplementalInformationGrp">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:50mm;text-align:left;padding-top:1mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:137mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            <!-- End SRD for PART V Section C   -->
            
          <!-- BEGIN Part V Section D Repeating Table -->
          <xsl:if test="($Print = $Separated) and (count($Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp) &gt;10)">
            <span class="styRepeatingDataTitle">Form 990 Schedule H, Part V Section  D.  Other Facilities That Are Not Licensed, Registered, or Similarly Recognized as a Hospital Facility</span>
            <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
              <thead class="styTableThead" style="font-size:7pt;">
                <tr class="styDepTblHdr">
                  <th colspan="3" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:top;padding-top:2mm;width:187mm;border-style:solid;border-color:black;border-bottom-width:1px; border-right-width:0px;font-size:8pt;">
                    <div class="IRS990ScheduleH_LineDesc" style="width:182mm;height:4mm;border-right-width:0px;border-top-width:0px;">
                      <b>Section D. Other Health Care Facilities That Are Not Licensed, Registered, or Similarly Recognized as a Hospital Facility</b>
                    </div>
                    <span style="font-weight:normal;">(list in order of size, from largest to smallest)</span><br/>                    
                    <span style="height:10mm;"/>
                    <span style="font-weight:normal;">How many non-hospital health care facilities did the organization operate during the tax year?</span>
                    <span class="styIRS990ScheduleHUnderlinedText" style="text-align:center;width:45mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/FacilityNum"/>
                      </xsl:call-template>
                    </span><br/>                    
                    <span style="height:5mm;"/>
                  </th>
                </tr>
                <tr class="styDepTblHdr" style="height:8mm;">
                  <th colspan="2" class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:bottom;padding-top:2mm;width:102mm;border-bottom-width:1px; border-style:solid;border-color:black;border-right-width:0px;font-size:8pt;">
                    <span style="font-weight:normal;">Name and address</span>
                  </th>
                  <th class="styTableCellHeader" scope="col" style="text-align:left;vertical-align:bottom;width:85mm;border-bottom-width:1px; border-left-width:1px; border-style:solid;border-color:black; border-right-width:0px;padding-left:1mm;font-size:8pt;">
                    <span style="font-weight:normal">Type of Facility (describe)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp">
                
                  <!-- Adding the separator section -->
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                    <xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				    <td style="width:7mm;vertical-align:top;">
				      <span style="width:3mm;font-weight:bold;">
					    <xsl:value-of select="position()"/>
					  </span>
				    </td>
                    <td class="styTableCellText" style="width:102mm;padding-left:1mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="USAddress"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:85mm;padding-left:1mm;text-align:left;vertical-align:top;border-right-width:0px">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp/FacilityTxt"/>
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
              <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/ManagementCoAndJntVenturesGrp"/>
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
      <td class="styTableCell" style="width:12mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCellText" style="width:58mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:7mm;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:29mm;border-right-width:0px;height:4mm;border-bottom-width:1px;border-right-width:1px;border-color:black;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="width:33mm;border-right-width:0px;height:4mm;border-bottom-width:1px;border-right-width:0px;border-color:black;">
        <span style="width:1px"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template name="IRS990SchHPartVSecCTableFillerRow">
    <xsl:param name="index"/>
    
    <tr>
      <td style="width:7mm;vertical-align:top;border-top-width:0px; border-bottom-width:1px; border-left-width:0px; border-style:solid;border-color:black; border-right-width:0px;">
        <span style="width:3mm;font-weight:bold;">
          <xsl:value-of select="$index"/>
        </span>
      </td>
      <td class="styTableCellText" style="width:95mm;height:4mm;border-bottom-width:1px; border-left-width:0px; border-style:solid;border-color:black; border-right-width:0px;">
        <span style="width:1px"/>
      </td>
      <td class="styTableCell" style="border-bottom-width:1px; border-left-width:1px; border-style:solid;border-color:black; border-right-width:0px;width:85mm;height:4mm;">
        <span style="width:1px"/>
      </td>
    </tr>
  </xsl:template>
  
    <!--  PART V  Section C TEMP DATA  -->
  <xsl:template name="SupplementalTemp">
    <xsl:param name="IsSeparated">no</xsl:param>
    <tr>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:50mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
        </xsl:call-template>
        <xsl:if test="$IsSeparated = 'yes' ">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleHData/SupplementalInformationGrp"/>
            <xsl:with-param name="ShortMessage" select="'true'"/>
          </xsl:call-template>
        </xsl:if>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:137mm;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template name="EmptyIteratorTemp">
    <xsl:param name="NumEmptyRows"/>
    <xsl:param name="CalledTemplate" select="$Form990ScheduleHData"/>
    <xsl:param name="IsSeparated">no</xsl:param>
    <xsl:if test="$IsSeparated = 'no' ">
      <xsl:if test="$NumEmptyRows &gt; 0">
	    <xsl:call-template name="SupplementalTemp"/>
        <xsl:call-template name="EmptyIteratorTemp">
          <xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$IsSeparated = 'yes' ">
	  <xsl:call-template name="SupplementalTemp">
		<xsl:with-param name="IsSeparated">yes</xsl:with-param>
		<xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
	  </xsl:call-template>
      <xsl:call-template name="EmptyIteratorTemp">
        <xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>