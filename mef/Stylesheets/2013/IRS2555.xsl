<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS2555Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS2555"/>
  <xsl:template match="/">
    <html>
      <head>
        <META http-equiv="Content-Type" content="text/html"/>
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
        <meta name="Description" content="IRS Form 2555"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS2555Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form2555">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;height:22mm;">
            <div class="styFNBox" style="width:35mm;height:22mm;">
              <div style="padding-top:1mm;">
                Form <span class="styFormNumber">2555</span>
                <br/>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Top Left Margin - Claiming Foreign Earned Income Waiver Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/@claimFrgnEarnIncWaiverCd"/>
                </xsl:call-template>
              </div>
              <div style="padding-top:1mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:108mm;height:22mm;">
              <div style="padding-top:2mm;" class="styMainTitle">
              Foreign Earned Income
              </div>
              <div class="styFBT" style="height:4mm;">
                <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Attach to Form 1040.<br />
                <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/> Information about Form 2555 and its separate instructions is at www.irs.gov/form2555.
              </div>
            </div>
            <div class="styTYBox" style="width:36mm;height:22mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
              <div class="styTY" style="height:7mm;font-size:22pt;">20<span class="styTYColor">13</span></div>
              <div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">
                Attachment<br/>
                Sequence No. <span class="styBoldText">34</span>
              </div>
            </div>
          </div>
          <div class="styTBB" style="width:187mm;font-size:8pt;text-align:center;font-weight:bold;">
          For Use by U.S. Citizens and Resident Aliens Only
          </div>
          <!--Name Line -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:139mm;height:8mm;font-size:7pt;font-weight:normal;">
              Name shown on Form 1040<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/Name"/>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style="width:48mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
              Your social security number<br/>
              <span style="width: 40mm; text-align:center;font-weight:normal;">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$FormData/SSN"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- BEGIN PART I TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part I</div>
            <div class="styPartDesc">General Information</div>
          </div>
          <!-- END PART I TITLE -->
          <!-- Foreign Address Lines 1, 2-->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:139mm;height:8mm;font-size:7pt;font-weight:normal;">
			  
              <b style="margin-right:2mm;height:100%;float:left;">1</b> Your foreign address (including country)
              <br/>
              <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignAddress"/>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style="width:48mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
              <b style="margin-right:2mm;height:100%;float:left;">2</b> Your occupation<br/>
              <span style="width: 40mm; text-align:left;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/Occupation"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 3 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">3</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              Employer's name <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine1"/>
              </xsl:call-template><br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 4a -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">4</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:176mm;">
              Employer's U.S. address <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="$FormData/EmployerUSAddress"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 4b -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;">
              Employer's foreign address <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="$FormData/EmployerForeignAddress"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 5 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">5</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:30mm;margin-right:3mm;">
              <img alt="right arrow" src="{$ImagePath}/2555_med_rt_arrow.gif" style="float:right;"/>
              Employer is (check<br/>
              any that apply):
            </div>
            <div style="float:left;width:144mm;">
              <span style="width:60mm;padding:.5mm 0mm;">
                <b>a</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerForeignEntityInd"/>
                    <xsl:with-param name="BackupName">IRS2555EmployerForeignEntityInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerForeignEntityInd"/>
                    <xsl:with-param name="BackupName">IRS2555EmployerForeignEntityInd</xsl:with-param>
                  </xsl:call-template>
              A foreign entity
              </label>
              </span>
              <span style="width:45mm;padding:.5mm 0mm;">
                <b>b</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerUnitedStatesCompanyInd"/>
                    <xsl:with-param name="BackupName">IRS2555EmployerUnitedStatesCompanyInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerUnitedStatesCompanyInd"/>
                    <xsl:with-param name="BackupName">IRS2555EmployerUnitedStatesCompanyInd</xsl:with-param>
                  </xsl:call-template>
              A U.S. company</label>
              </span>
              <span style="width:39mm;padding:.5mm 0mm;">
                <b>c</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentInd"/>
                    <xsl:with-param name="BackupName">IRS2555SelfEmploymentInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentInd"/>
                    <xsl:with-param name="BackupName">IRS2555SelfEmploymentInd</xsl:with-param>
                  </xsl:call-template>
              Self
              </label>
              </span>
              <br/>
              <span style="width:60mm;padding:.5mm 0mm;">
                <b>d</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ForeignAffiliateEmployerInd"/>
                    <xsl:with-param name="BackupName">IRS2555ForeignAffiliateEmployerInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/ForeignAffiliateEmployerInd"/>
                    <xsl:with-param name="BackupName">IRS2555ForeignAffiliateEmployerInd</xsl:with-param>
                  </xsl:call-template>
              A foreign affiliate of a U.S. company
              </label>
              </span>
              <span style="width:84mm;padding:.5mm 0mm;">
                <b>e</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/OtherEmployerTypeGroup/OtherEmployerInd"/>
                    <xsl:with-param name="BackupName">IRS2555OtherEmployerTypeGroupOtherEmployerInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/OtherEmployerTypeGroup/OtherEmployerInd"/>
                    <xsl:with-param name="BackupName">IRS2555OtherEmployerTypeGroupOtherEmployerInd</xsl:with-param>
                  </xsl:call-template>
              Other (specify)</label>
                <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/OtherEmployerTypeGroup/OtherEmployerDescriptionTxt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 6a -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">6</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:176mm;">
              If you previously filed Form 2555 or Form 2555-EZ, enter the last year you filed the form. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/LastFrgnEarnIncExclClaimedYr"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 6b -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:132.5mm;">
            <label>
			  <xsl:call-template name="PopulateLabel">
				<xsl:with-param name="TargetNode" select="$FormData/NoFrgnEarnIncExclPrevFiledInd" />
				<xsl:with-param name="BackupName">IRS2555NoFrgnEarnIncExclPrevFiledInd</xsl:with-param>
			  </xsl:call-template>
              If you did not file Form 2555 or 2555-EZ after 1981 to claim either of the exclusions, check here 
              </label>
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin-right:0.5mm;"/>
            </div>
            <div style="float:left;width:5mm;text-align:center;">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/NoFrgnEarnIncExclPrevFiledInd"/>
                  <xsl:with-param name="BackupName">IRS2555NoFrgnEarnIncExclPrevFiledInd</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
            <div style="float:left;width:30mm;">and go to line 7.</div>
          </div>
          <!-- Line 6c -->
          <div class="styGenericDiv" style="height:4mm;width:187mm;padding-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">c</div>
            <div style="float:left;width:156mm;height:4.5mm">
              Have you ever revoked either of the exclusions?<span style="letter-spacing:3mm;">........................</span>
            </div>
            <div style="float:left;width:20mm;">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
					  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
					  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
					</xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
					  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
					  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
					</xsl:call-template>
                <b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
					  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
					</xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
					  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
					  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
					</xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- Line 6d -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">d</div>
            <div style="float:left;width:176mm;">
              If you answered "Yes," enter the type of exclusion and the tax year for which the revocation was effective.
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:for-each select="$FormData/ForeignEarnIncExclRevokeGrp">
				  <br/>
				  <span style="width:105mm;">
				    <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignEarnIncExclRevokeTypeCd"/>
				    </xsl:call-template>
				  </span>
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="ForeignEarnIncExclRevokeTaxYr"/>
				  </xsl:call-template>
              </xsl:for-each>
            </div>
          </div>
          <!-- Line 7 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">7</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              Of what country are you a citizen/national? <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/CitizenCountryNm"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 8a -->
          <div class="styGenericDiv" style="width:187mm;height:9mm;padding-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">8</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:156mm;">
              Did you maintain a separate foreign residence for your family because of adverse living conditions at your<br/>
              tax home? See <b>Second foreign household</b> in the instructions
              <span style="letter-spacing:3mm;">................</span>
            </div>
            <div style="float:left;width:20mm;margin-top:3mm">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateForeignResidenceInd"/>
                  <xsl:with-param name="BackupName">IRS2555SeparateForeignResidenceInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateForeignResidenceInd"/>
                  <xsl:with-param name="BackupName">IRS2555SeparateForeignResidenceInd</xsl:with-param>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateForeignResidenceInd"/>
                  <xsl:with-param name="BackupName">IRS2555SeparateForeignResidenceInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/SeparateForeignResidenceInd"/>
                  <xsl:with-param name="BackupName">IRS2555SeparateForeignResidenceInd</xsl:with-param>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- Line 8b -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;">
              If "Yes," enter city and country of the separate foreign residence. Also, enter the number of days during your tax year that you
              maintained a second household at that address. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/SeparateForeignResLocationTxt"/>
              </xsl:call-template>
              &nbsp; - &nbsp;
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/SeparateForeignResidenceDayCnt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 9 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">9</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              List your tax home(s) during your tax year and date(s) established. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:for-each select="$FormData/TaxHomeGroup">
                <b>
                  <xsl:value-of select="position()"/>) </b>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TaxHomeDescriptionTxt"/>
                </xsl:call-template> : 
                <xsl:call-template name="PopulateMonth">
                  <xsl:with-param name="TargetNode" select="EstablishedDt"/>
                </xsl:call-template>-
                <xsl:call-template name="PopulateDay">
                  <xsl:with-param name="TargetNode" select="EstablishedDt"/>
                </xsl:call-template>-
                <xsl:call-template name="PopulateYear">
                  <xsl:with-param name="TargetNode" select="EstablishedDt"/>
                </xsl:call-template>
                <xsl:if test="position() != last()">
                  <span style="width:10px"/> 
                </xsl:if>
              </xsl:for-each>
            </div>
          </div>
          <div class="styBB" style="width:187mm;font-size:8pt;text-align:center;font-weight:bold;border-top:1px solid black;margin-top:3mm;padding:1mm 0mm;">
            Next, complete either Part II or Part III. If an item does not apply, enter "NA." If you do not give<br/>
            the information asked for, any exclusion or deduction you claim may be disallowed.
          </div>
          <!-- BEGIN PART II TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part II</div>
            <div class="styPartDesc">Taxpayers Qualifying Under Bona Fide Residence Test <span style="font-weight:normal;">(see instructions)</span>
            </div>
          </div>
          <!-- END PART II TITLE -->
          <xsl:variable name="Part2Data" select="$FormData/TaxpayerBonaFideResGrp"/>
          <!-- Line 10 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">10</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              Date bona fide residence began <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:50mm">
                <xsl:if test="$Part2Data/BonaFideResidenceBeginDt">
                  <xsl:call-template name="PopulateMonth">
                    <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceBeginDt"/>
                  </xsl:call-template>-<xsl:call-template name="PopulateDay">
                    <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceBeginDt"/>
                  </xsl:call-template>-<xsl:call-template name="PopulateYear">
                    <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceBeginDt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              , and ended <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:50mm">
                <xsl:choose>
                  <xsl:when test="$Part2Data/BonaFideResidenceEndDt">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceEndDt"/>
                    </xsl:call-template>-
                    <xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceEndDt"/>
                    </xsl:call-template>-
                    <xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceEndDt"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$Part2Data/BonaFideResidenceContinuedCd">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Part2Data/BonaFideResidenceContinuedCd"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise/>
                </xsl:choose>
              </span>
            </div>
          </div>
          <!-- Line 11 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">11</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:58mm;margin-right:3mm;">
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;float:right;"/>
              Kind of living quarters in foreign country
            </div>
            <div style="float:left;width:116mm;clear:none;">
              <span style="width:35mm;padding:.5mm 0mm;">
                <b>a</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/PurchasedHouseInd"/>
                    <xsl:with-param name="BackupName">IRS2555PurchasedHouseInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/PurchasedHouseInd"/>
                    <xsl:with-param name="BackupName">IRS2555PurchasedHouseInd</xsl:with-param>
                  </xsl:call-template>
                Purchased house
                </label>
              </span>
              <span style="width:45mm;padding:.5mm 0mm;">
                <b>b</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/RentedHouseInd"/>
                    <xsl:with-param name="BackupName">IRS2555RentedHouseInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/RentedHouseInd"/>
                    <xsl:with-param name="BackupName">IRS2555RentedHouseInd</xsl:with-param>
                  </xsl:call-template>
                Rented house or apartment
                </label>
              </span>
              <span style="width:35mm;padding:.5mm 0mm;">
                <b>c</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/RentedRoomInd"/>
                    <xsl:with-param name="BackupName">IRS2555RentedRoomInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/RentedRoomInd"/>
                    <xsl:with-param name="BackupName">IRS2555RentedRoomInd</xsl:with-param>
                  </xsl:call-template>
                Rented room
                </label>
              </span>
              <br/>
              <span style="width:80mm;padding:.5mm 0mm;">
                <b>d</b>
                <input type="checkbox" style="height:3.5mm;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerFurnishedQuartersInd"/>
                    <xsl:with-param name="BackupName">IRS2555EmployerFurnishedQuartersInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerFurnishedQuartersInd"/>
                    <xsl:with-param name="BackupName">IRS2555EmployerFurnishedQuartersInd</xsl:with-param>
                  </xsl:call-template>
                Quarters furnished by employer
                </label>
              </span>
            </div>
          </div>
          <!-- Line 12a -->
          <div class="styGenericDiv" style="width:187mm;height:8mm;padding-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">12</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:156mm;">
              Did any of your family live with you abroad during any part of the tax year?<span style="letter-spacing:3mm;">...............</span>
            </div>
            <div style="float:left;width:20mm;margin-top:.75mm">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
					  <xsl:with-param name="TargetNode" select="$FormData/FamilyLivedAbroadInd"/>
					  <xsl:with-param name="BackupName">IRS2555FamilyLivedAbroadInd</xsl:with-param>
					</xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
					  <xsl:with-param name="TargetNode" select="$FormData/FamilyLivedAbroadInd"/>
					  <xsl:with-param name="BackupName">IRS2555FamilyLivedAbroadInd</xsl:with-param>
					</xsl:call-template>
					<b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
					  <xsl:with-param name="TargetNode" select="$FormData/FamilyLivedAbroadInd"/>
					  <xsl:with-param name="BackupName">IRS2555FamilyLivedAbroadInd</xsl:with-param>
					</xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
					  <xsl:with-param name="TargetNode" select="$FormData/FamilyLivedAbroadInd"/>
					  <xsl:with-param name="BackupName">IRS2555FamilyLivedAbroadInd</xsl:with-param>
					</xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- Line 12b -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;">
              If "Yes," who and for what period? <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:for-each select="$FormData/FamilyLivingWithTaxpayerAbroad">
                <b><xsl:value-of select="position()"/>) </b>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="FamilyRelationshipCd"/>
                </xsl:call-template>
                 : 
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="FamilyLivingWithYouTimePeriod"/>
                </xsl:call-template>
                <xsl:if test="position() != last()">
					<span style="width:10px"/>
                </xsl:if>
              </xsl:for-each>
            </div>
          </div>
          <!-- Line 13a -->
          <div class="styGenericDiv" style="width:187mm;height:9mm;padding-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">13</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:156mm;">
              Have you submitted a statement to the authorities of the foreign country where you claim bona fide
              residence that you are not a resident of that country? See instructions
              <span style="letter-spacing:3mm;">.......................</span>
            </div>
            <div style="float:left;width:20mm;margin-top:3mm">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/SubmittedNonResidentStmtInd"/>
                  <xsl:with-param name="BackupName">IRS2555SubmittedNonResidentStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/SubmittedNonResidentStmtInd"/>
                  <xsl:with-param name="BackupName">IRS2555SubmittedNonResidentStmtInd</xsl:with-param>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/SubmittedNonResidentStmtInd"/>
                  <xsl:with-param name="BackupName">IRS2555SubmittedNonResidentStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/SubmittedNonResidentStmtInd"/>
                  <xsl:with-param name="BackupName">IRS2555SubmittedNonResidentStmtInd</xsl:with-param>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- Line 13b -->
          <div class="styGenericDiv" style="width:187mm;height:6mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:156mm;">
              Are you required to pay income tax to the country where you claim bona fide residence? See instructions<span style="letter-spacing:3mm;">.....</span>
            </div>
            <div style="float:left;width:20mm;margin-top:1mm;">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/RequiredToPayIncomeTaxInd"/>
                  <xsl:with-param name="BackupName">IRS2555RequiredToPayIncomeTaxInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/RequiredToPayIncomeTaxInd"/>
                  <xsl:with-param name="BackupName">IRS2555RequiredToPayIncomeTaxInd</xsl:with-param>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/RequiredToPayIncomeTaxInd"/>
                  <xsl:with-param name="BackupName">IRS2555RequiredToPayIncomeTaxInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/RequiredToPayIncomeTaxInd"/>
                  <xsl:with-param name="BackupName">IRS2555RequiredToPayIncomeTaxInd</xsl:with-param>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;font-weight:bold;font-size:8pt;">
              If you answered "Yes" to 13a and "No" to 13b, you do not qualify as a bona fide resident. Do not complete the rest of this part.
            </div>
          </div>
          
		<!-- Line 14 -->
		<div class="styGenericDiv" style="width:187mm;margin-top:1mm;">
		<div style="float:left;width:5mm;font-weight:bold;text-align:right;">14</div>
		<div style="float:left;width:5mm;font-weight:bold;"/>
		<div style="float:left;width:176mm;">
			If you were present in the United States or its possessions during the tax year, complete columns <b>(a)-(d)</b> below. <b>Do not</b>
			include the income from column <b>(d)</b> in Part IV, but report it on Form 1040.
		</div>
		<xsl:choose>
			<xsl:when test="count($FormData/PresenceInTheUSGroup) &lt; 1 
				or ((count($FormData/PresenceInTheUSGroup) &gt;8 ) and ($Print=$Separated))">
		<!-- Left/Right Tables -->
		<div class="styGenericDiv" width="93mm;margin-top:1mm">
			<table style="width:186mm;font-size:7pt;border-collapse:collapse;border-left:3px solid black;border-right:3px solid black;text-align:center;margin-top:3mm">
				<thead style="vertical-align:top;">
					<tr>
						<th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;width:19mm;"><b>(a)</b> Date
							arrived in U.S.</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;width:19.5mm;"><b>(b)</b> Date left
							U.S.</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;width:20mm;"><b>(c)</b> Number of
							days in U.S. on business</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;width:35.5mm;"><b>(d)</b> Income earned in
							U.S. on business (attach computation)</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;border-left:5px solid black;width:19mm;"><b>(a)</b> Date
							arrived in U.S.</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;width:19.5mm;"><b>(b)</b> Date left
							U.S.</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;width:20mm;"><b>(c)</b> Number of
							days in U.S. on business</th>
						<th scope="col" style="font-weight:normal;border:1px solid black;width:35.5mm;"><b>(d)</b> Income earned in
							U.S. on business (attach computation)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td  style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:center;">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup"/>
								<xsl:with-param name="ShortMessage" select="true()"/>
							</xsl:call-template>
						</td>
						<td  style="border:1px solid black;border-left:5px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
					</tr>
					<tr>
						<td  style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
						<td  style="border:1px solid black;border-left:5px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
					</tr>
					<tr>
						<td  style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
						<td  style="border:1px solid black;border-left:5px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
					</tr>
					<tr>
						<td  style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
						<td  style="border:1px solid black;border-left:5px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
					</tr>
				</tbody>
			</table>
		</div>
		</xsl:when>
		<xsl:otherwise>			
		<!-- Left Table -->
		<div class="styGenericDiv" width="93mm;margin-top:1mm">
			<table style="width:93mm;font-size:7pt;border-collapse:collapse;border-left:3px solid black;border-right:3px solid black;text-align:center;margin-top:3mm">
				<xsl:for-each select="$FormData/PresenceInTheUSGroup">
					<xsl:if test="position()=1">
						<thead style="vertical-align:top;">
							<tr>
								<th scope="col" style="font-weight:normal;border:1px solid black;border-
									left:none;width:19mm;"><b>(a)</b> Date arrived in U.S.</th>
								<th scope="col" style="font-weight:normal;border:1px solid black;width:19.5mm;"><b>(b)</b> Date left
									U.S.</th>
								<th scope="col" style="font-weight:normal;border:1px solid black;width:20mm;"><b>(c)</b> Number of
									days in U.S. on business</th>
								<th scope="col" style="font-weight:normal;border:1px solid black;width:35.5mm;"><b>(d)</b> Income earned 
									in U.S. on business (attach computation)</th>
							</tr>
						</thead>
					</xsl:if>
				<xsl:if test="(position() &lt;= (count($FormData/PresenceInTheUSGroup) div 2)+0.5) or (position() &lt;= 4)">
					<tbody>
						<tr>
							<td  style="border:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="ArrivedInUSDt"/>
								</xsl:call-template>
							</td>
							<td style="border:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
								</xsl:call-template>
							</td>
							<td style="border:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessDaysCnt"/>
								</xsl:call-template>
							</td>
							<td style="border:1px solid black;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
								</xsl:call-template>
								<span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
								</xsl:call-template>
							</td>
						</tr>
					</tbody>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 4)">
				<tbody>
					<tr>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;">&nbsp;</td>
						<td style="border:1px solid black;text-align:right;">&nbsp;</td>
					</tr>
				</tbody>
				<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 3)">
					<tbody>
						<tr>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;text-align:right;">&nbsp;</td>
						</tr>
					</tbody>
					<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 2)">
						<tbody>
							<tr>
								<td style="border:1px solid black;">&nbsp;</td>
								<td style="border:1px solid black;">&nbsp;</td>
								<td style="border:1px solid black;">&nbsp;</td>
								<td style="border:1px solid black;text-align:right;">&nbsp;</td>
							</tr>
						</tbody>
					</xsl:if>
				</xsl:if>
			</xsl:if>
		</table>
	</div>
	<!-- Right Table -->
		<div class="styGenericDiv" width="93mm;margin-top:1mm;">
			<table style="width:93mm;font-size:7pt;border-collapse:collapse;border-left:2px solid black;border-right:3px solid black;text-align:center;margin-top:3mm">
				<xsl:for-each select="$FormData/PresenceInTheUSGroup">
					<xsl:if test="position()=1">
						<thead style="vertical-align:top;">
							<tr>
								<th scope="col" style="font-weight:normal;border:1px solid black;border-
									left:none;width:19mm;"><b>(a)</b> Date arrived in U.S.</th>
								<th scope="col" style="font-weight:normal;border:1px solid black;width:19.5mm;"><b>(b)</b> Date left
									U.S.</th>
								<th scope="col" style="font-weight:normal;border:1px solid black;width:20mm;"><b>(c)</b> Number of
									days in U.S. on business</th>
								<th scope="col" style="font-weight:normal;border:1px solid black;width:35.5mm;"><b>(d)</b> Income earned 
									in U.S. on business (attach computation)</th>
							</tr>
						</thead>
					</xsl:if>
					<xsl:if test="(position() &gt; (count($FormData/PresenceInTheUSGroup) div 2)+0.5) and (position() &gt; 4)">
						<tbody>
							<tr>
								<td  style="border:1px solid black;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="ArrivedInUSDt"/>
									</xsl:call-template>
								</td>
								<td style="border:1px solid black;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
									</xsl:call-template>
								</td>
								<td style="border:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessDaysCnt"/>
									</xsl:call-template>
								</td>
								<td style="border:1px solid black;text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
									</xsl:call-template>
									<span style="width:2px;"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 8)">
					<tbody>
						<tr>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;text-align:right;">&nbsp;</td>
						</tr>
					</tbody>
					<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 7)">
						<tbody>
							<tr>
								<td style="border:1px solid black;">&nbsp;</td>
								<td style="border:1px solid black;">&nbsp;</td>
								<td style="border:1px solid black;">&nbsp;</td>
								<td style="border:1px solid black;text-align:right;">&nbsp;</td>
							</tr>
						</tbody>
						<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 6)">
							<tbody>
								<tr>
									<td style="border:1px solid black;">&nbsp;</td>
									<td style="border:1px solid black;">&nbsp;</td>
									<td style="border:1px solid black;">&nbsp;</td>
									<td style="border:1px solid black;text-align:right;">&nbsp;</td>
								</tr>
							</tbody>
							<xsl:if test="(count($FormData/PresenceInTheUSGroup) &lt; 5)">
								<tbody>
									<tr>
										<td style="border:1px solid black;">&nbsp;</td>
										<td style="border:1px solid black;">&nbsp;</td>
										<td style="border:1px solid black;">&nbsp;</td>
										<td style="border:1px solid black;text-align:right;">&nbsp;</td>
									</tr>
								</tbody>
							</xsl:if>
						</xsl:if>
					</xsl:if>
				</xsl:if>
				<xsl:if test="(count($FormData/PresenceInTheUSGroup) mod 2 != 0) and (count($FormData/PresenceInTheUSGroup) &gt; 8)">
					<tbody>
						<tr>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;">&nbsp;</td>
							<td style="border:1px solid black;text-align:right;">&nbsp;</td>
						</tr>
					</tbody>
				</xsl:if>
			</table>
		</div>
		</xsl:otherwise>
		</xsl:choose>
	</div>

		
         <!-- Line 15a -->
         <div class="styGenericDiv" style="height:3mm;width:187mm"/>
          <div class="styGenericDiv" style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;margin-left:2mm">15a</div>
            <div style="float:left;width:176mm;padding-left:3mm">
              List any contractual terms or other conditions relating to the length of your employment abroad. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/EmploymentContractTermsDesc"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 15b -->
          <div class="styGenericDiv" style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;">
              Enter the type of visa under which you entered the foreign country. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/VisaTypeDesc"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 15c -->
          <div class="styGenericDiv" style="width:187mm;height:5mm;padding-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">c</div>
            <div style="float:left;padding-top:1mm;width:156mm;">
              Did your visa limit the length of your stay or employment in a foreign country? If “Yes,” attach explanation
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/VisaLimitStayOrEmploymentInd"/>
              </xsl:call-template>
              <span style="letter-spacing:3mm;">...</span>
            </div>
            <div style="float:left;width:20mm;margin-top:0.5mm">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/VisaLimitStayOrEmploymentInd"/>
                  <xsl:with-param name="BackupName">IRS2555VisaLimitStayOrEmploymentInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/VisaLimitStayOrEmploymentInd"/>
                  <xsl:with-param name="BackupName">IRS2555VisaLimitStayOrEmploymentInd</xsl:with-param>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/VisaLimitStayOrEmploymentInd"/>
                  <xsl:with-param name="BackupName">IRS2555VisaLimitStayOrEmploymentInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/VisaLimitStayOrEmploymentInd"/>
                  <xsl:with-param name="BackupName">IRS2555VisaLimitStayOrEmploymentInd</xsl:with-param>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- Line 15d -->
          <div class="styGenericDiv" style="width:187mm;height:5mm;padding-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">d</div>
            <div style="float:left;width:156mm;">
              Did you maintain a home in the United States while living abroad?<span style="letter-spacing:3mm;">.................</span>
            </div>
            <div style="float:left;width:20mm;margin-top:.5mm">
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/MaintainedHouseInUSInd"/>
                  <xsl:with-param name="BackupName">IRS2555MaintainedHouseInUSInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/MaintainedHouseInUSInd"/>
                  <xsl:with-param name="BackupName">IRS2555MaintainedHouseInUSInd</xsl:with-param>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <input type="checkbox" style="height:3.5mm;">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/MaintainedHouseInUSInd"/>
                  <xsl:with-param name="BackupName">IRS2555MaintainedHouseInUSInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/MaintainedHouseInUSInd"/>
                  <xsl:with-param name="BackupName">IRS2555MaintainedHouseInUSInd</xsl:with-param>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- Line 15e -->
          <div  style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">e</div>
            <div style="float:left;width:176mm;">
              If "Yes," enter address of your home, whether it was rented, the names of the occupants, and their relationship<br/>
              to you. 
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              </div>
              </div>
              <xsl:for-each select="$FormData/USHomeWhileLivingAbroad">
                <div style="padding-left:14mm;width:187mm">
					  <b><xsl:value-of select="position()"/>) </b>
					  <xsl:call-template name="PopulateUSAddressTemplate">
						<xsl:with-param name="TargetNode" select="USAddress"/>
					  </xsl:call-template>
                 </div>
                  <div style="padding-left:14mm;width:187mm">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="HomeRentedStatusCd"/>
					  </xsl:call-template>
                  </div>
                  <div style="padding-left:14mm;width:187mm">
					  <xsl:for-each select="USHomeOccupant">
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OccupantName"/>
						  </xsl:call-template>
						   : 
						  <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OccupantRelationshipCd"/>
						  </xsl:call-template>
						  <xsl:if test="position() != last()">, <span style="width:6px;"/></xsl:if>
					  </xsl:for-each>
				  </div>
                <xsl:if test="position() != last()">
                 <br/><br/>
                </xsl:if>
              </xsl:for-each>

          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:0mm;border-top:1px solid black">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see the Form 1040 instructions.</span>
              <span style="width:13mm;"/>                        
                Cat. No. 11900P
            </div>
            <div style="float:right;">
              <span style="width:40px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">2555</span> (2013)
            </div>
          </div>
          <!-- Page 2 Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 2555 (2013)</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- BEGIN PART III TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part III</div>
            <div class="styPartDesc">Taxpayers Qualifying Under Physical Presence Test <span style="font-weight:normal;">(see instructions)</span>
            </div>
          </div>
          <!-- END PART III TITLE -->
          <xsl:variable name="Part3Data" select="$FormData/TaxpayerPhysicalPresenceGrp"/>
          <!-- Line 16 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">16</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              The physical presence test is based on the 12-month period from <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:40mm">
                <xsl:if test="$Part3Data/PhysicalPresenceBeginDt">
                  <xsl:call-template name="PopulateMonth">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceBeginDt"/>
                  </xsl:call-template>-<xsl:call-template name="PopulateDay">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceBeginDt"/>
                  </xsl:call-template>-<xsl:call-template name="PopulateYear">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceBeginDt"/>
                  </xsl:call-template>
                </xsl:if>
              </span>
              through <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:choose>
                <xsl:when test="$Part3Data/PhysicalPresenceEndDt">
                  <xsl:call-template name="PopulateMonth">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceEndDt"/>
                  </xsl:call-template>-
                  <xsl:call-template name="PopulateDay">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceEndDt"/>
                  </xsl:call-template>-
                  <xsl:call-template name="PopulateYear">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceEndDt"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:when test="$Part3Data/PhysicalPresenceContinuedCd">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Part3Data/PhysicalPresenceContinuedCd"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise/>
              </xsl:choose>
            </div>
          </div>
          <!-- Line 17 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">17</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              Enter your principal country of employment during your tax year. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/PrincipalEmploymentCountryNm"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Line 18 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">18</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              If you traveled abroad during the 12-month period entered on line 16, complete columns <b>(a)-(f)</b> below. Exclude travel between
              foreign countries that did not involve travel on or over international waters, or in or over the United States, for 24 hours or
              more. If you have no travel to report during the period, enter "Physically present in a foreign country or countries for the entire
              12-month period." <b>Do not</b> include the income from column <b>(f)</b> below in Part IV, but report it on Form 1040.
            </div>
          </div>
          <div class="styGenericDiv" style="text-align:right;width:187mm;height:4mm;clear:none;">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup"/>
              <xsl:with-param name="containerHeight" select="4"/>
              <xsl:with-param name="containerID" select="'line18divctn'"/>
            </xsl:call-template>
          </div>
          <div class="styTableContainer" id="line18divctn">
            <xsl:call-template name="SetInitialState"/>
            <table style="width:187mm;font-size:7pt;border-collapse:collapse;">
              <thead style="text-align:center;vertical-align:top;">
                <tr>
                  <th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;">
                    <b>(a)</b> Name of country <br/>(including U.S.)</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(b)</b> Date arrived</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(c)</b> Date left</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(d)</b> Full days <br/>present in <br/>country</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(e)</b> Number of <br/>days in U.S. <br/>on business</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;border-right:none;">
                    <b>(f)</b> Income earned in U.S. <br/>on business (attach <br/>computation)</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                    <xsl:choose>
                      <xsl:when test="$Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &gt; 4">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/CountryName"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Line 18a(1) - No Travel Explanation Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/NoTravelExplanationCd"/>
                    </xsl:call-template>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[1]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/ArrivalDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[1]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/DepartureDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/DaysPresentInCountryInd"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/BusinessDaysInUSCnt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;text-align:right;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[1]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/CountryName"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[2]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/ArrivalDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[2]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/DepartureDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/DaysPresentInCountryInd"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/BusinessDaysInUSCnt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;text-align:right;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[2]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/CountryName"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[3]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/ArrivalDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[3]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/DepartureDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/DaysPresentInCountryInd"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/BusinessDaysInUSCnt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;text-align:right;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[3]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/CountryName"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[4]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/ArrivalDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:if test="$FormData/PhysicalPresenceCountryGroup[4]">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/DepartureDt"/>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/DaysPresentInCountryInd"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;text-align:center;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/BusinessDaysInUSCnt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;text-align:right;">
                    <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PhysicalPresenceCountryGroup) &lt; 5)">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                      <xsl:call-template name="SetFormLinkInline">
                        <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup[4]/USBusinessIncomeAmt"/>
                      </xsl:call-template>
                    </xsl:if>
                  </td>
                </tr>
                <xsl:if test="$Print != $Separated">
                  <xsl:for-each select="$FormData/PhysicalPresenceCountryGroup[position() &gt; 4]">
                    <tr>
                      <td style="border:1px solid black;border-left:none;">&nbsp;
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CountryName"/>
                        </xsl:call-template>
                      </td>
                      <td style="border:1px solid black;text-align:center;">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="ArrivalDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="ArrivalDt"/>
                        </xsl:call-template>
                      </td>
                      <td style="border:1px solid black;text-align:center;">
                        <xsl:call-template name="PopulateMonth">
                          <xsl:with-param name="TargetNode" select="DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateDay">
                          <xsl:with-param name="TargetNode" select="DepartureDt"/>
                        </xsl:call-template>-<xsl:call-template name="PopulateYear">
                          <xsl:with-param name="TargetNode" select="DepartureDt"/>
                        </xsl:call-template>
                      </td>
                      <td style="border:1px solid black;text-align:center;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DaysPresentInCountryInd"/>
                        </xsl:call-template>
                      </td>
                      <td style="border:1px solid black;text-align:center;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessDaysInUSCnt"/>
                        </xsl:call-template>
                      </td>
                      <td style="border:1px solid black;border-right:none;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="USBusinessIncomeAmt"/>
                        </xsl:call-template>
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="USBusinessIncomeAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceCountryGroup"/>
            <xsl:with-param name="containerHeight" select="4"/>
            <xsl:with-param name="containerID" select="'line18divctn'"/>
          </xsl:call-template>
          <!-- BEGIN PART IV TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part IV</div>
            <div class="styPartDesc">All Taxpayers</div>
          </div>
          <!-- END PART IV TITLE -->
          <div class="styBB" style="width:187mm;font-style:italic;">
            <b>Note:</b> Enter on lines 19 through 23 all income, including noncash income, you earned and actually or constructively received during
            your 2013 tax year for services you performed in a foreign country. If any of the foreign earned income received this tax year was
            earned in a prior tax year, or will be earned in a later tax year (such as a bonus), see the instructions. <b>Do not</b> include income from line
            14, column <b>(d)</b>, or line 18, column <b>(f)</b>. Report amounts in U.S. dollars, using the exchange rates in effect when you actually or
            constructively received the income.
            <p style="font-weight:bold;padding-left:10mm;font-style:normal;margin-top:2mm;padding-bottom:0.8mm">
              If you are a cash basis taxpayer, report on Form 1040 all income you received in 2013, no matter when you performed
              the service.
            </p>
          </div>
          <div style="width:187mm;height:8mm;font-size:9pt;text-align:center;font-weight:bold;border-bottom:1px solid black;">
            <div style="width:136mm;float:left;line-height:8mm;">2013 Foreign Earned Income</div>
            <div style="width:50mm;float:left;height:8mm;border-left:1px solid black;">Amount<br/>(in U.S. dollars)</div>
          </div>
          <!-- Line 19 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">19</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Total wages, salaries, bonuses, commissions, etc
              <span style="letter-spacing:3mm;font-weight:bold;">................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">19</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedTotalWagesIncAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 20 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">20</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Allowable share of income for personal services performed (see instructions):
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-bottom:none;border-left:1px solid black;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <!-- Line 20a -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div class="styLNDesc" style="width:126mm;">
              In a business (including farming) or profession
              <span style="letter-spacing:3mm;font-weight:bold;">.................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">20a</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignBusinessIncomeShareAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 20b -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div class="styLNDesc" style="width:126mm;">
              In a partnership. List partnership’s name and address and type of income. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipIncShareAmt"/>
              </xsl:call-template>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">20b</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipIncShareAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 21 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">21</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;padding-right:1mm;">
              Noncash income (market value of property or facilities furnished by employer-attach statement
              showing how it was determined):
            </div>
            <div style="float:left;">
              <div style="height:8mm;width:8mm;border-bottom:none;border-left:1px solid black;background-color:lightgrey;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:8mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <!-- Line 21a -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div class="styLNDesc" style="width:126mm;">
              Home (lodging)<span style="letter-spacing:3mm;font-weight:bold;">............................</span>
            </div>
            <div style="float:left;">
              <div style="height:5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">21a</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/NonCashLodgingIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 21b -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div class="styLNDesc" style="width:126mm;">
              Meals<span style="letter-spacing:3mm;font-weight:bold;">.............................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">21b</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/NonCashMealIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 21c -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">c</div>
            <div class="styLNDesc" style="width:126mm;">
              Car
              <span style="letter-spacing:3mm;font-weight:bold;">..............................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">21c</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/NonCashCarIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 21d -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">d</div>
            <div class="styLNDesc" style="width:126mm;">
              Other property or facilities. List type and amount. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">21d</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalNonCashOtherPropertyAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 22 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">22</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Allowances, reimbursements, or expenses paid on your behalf for services you performed:
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-bottom:none;border-left:1px solid black;background-color:lightgrey;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <!-- Line 22a -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div class="styLNDesc" style="width:76mm;">
              Cost of living and overseas differential<span style="letter-spacing:3mm;font-weight:bold;">.......</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">22a</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CostOfLivingAndOverseasDiffAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="height:4.5mm;width:8mm;float:left;border-left:1px solid black;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
          </div>
          <!-- Line 22b -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div class="styLNDesc" style="width:76mm;">
              Family<span style="letter-spacing:3mm;font-weight:bold;">..................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">22b</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/FamilyAllowanceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="height:4.5mm;width:8mm;float:left;border-left:1px solid black;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
          </div>
          <!-- Line 22c -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">c</div>
            <div class="styLNDesc" style="width:76mm;">
              Education
              <span style="letter-spacing:3mm;font-weight:bold;">................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">22c</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EducationAllowanceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="height:4.5mm;width:8mm;float:left;border-left:1px solid black;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
          </div>
          <!-- Line 22d -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">d</div>
            <div class="styLNDesc" style="width:76mm;">
              Home leave
              <span style="letter-spacing:3mm;font-weight:bold;">................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">22d</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HomeLeaveAllowanceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="height:4.5mm;width:8mm;float:left;border-left:1px solid black;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
          </div>
          <!-- Line 22e -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">e</div>
            <div class="styLNDesc" style="width:76mm;">
              Quarters<span style="letter-spacing:3mm;font-weight:bold;">.................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">22e</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QuartersAllowanceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="height:4.5mm;width:8mm;float:left;border-left:1px solid black;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
          </div>
          <!-- Line 22f -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">f</div>
            <div class="styLNDesc" style="width:76mm;">
              For any other purpose. List type and amount.<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
				<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 22f - Other Purpose Allowance Type and Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OtherPurposeAllowanceTypeAmt"/>
				</xsl:call-template>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">22f</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="float:none;height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="float:none;height:4.5mm;width:42mm;position:relative;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalOtherPurposeAllowanceAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="float:left;width:8mm;height:9mm;background-color:lightgrey;border-left:1px solid black;"/>
            <div style="float:left;width:42mm;height:9mm;border-left:1px solid black;"/>
          </div>
          <!-- Line 22g -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">g</div>
            <div class="styLNDesc" style="width:126mm;">
              Add lines 22a through 22f<span style="letter-spacing:3mm;font-weight:bold;">.....................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">22g</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalAllowancesPaidOnBehalfAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 23 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">23</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Other foreign earned income. List type and amount. <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
				<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Line 23 - Other Foreign Income Type and Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OtherForeignIncomeTypeAmt"/>
				</xsl:call-template>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">23</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalOtherForeignIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 24 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">24</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Add lines 19 through 21d, line 22g, and line 23
              <span style="letter-spacing:3mm;font-weight:bold;">.................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">24</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalForeignEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 25 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">25</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Total amount of meals and lodging included on line 24 that is excludable (see instructions)
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">25</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalForeignEarnedIncmExclAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 26 -->
          <div style="width:187mm;height:8mm;border-bottom:2px solid black;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">26</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Subtract line 25 from line 24. Enter the result here and on line 27 on page 3. This is your <b>2013
              foreign earned income</b>
              <span style="letter-spacing:3mm;font-weight:bold;">......................</span>
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;">26</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:0mm;text-align:right;">
            Form <span class="styBoldText" style="font-size:8pt;">2555</span> (2013)
          </div>
          <!-- Page 3 Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 2555 (2013)</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
            </div>
          </div>
          <!-- BEGIN PART V TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part V</div>
            <div class="styPartDesc">All Taxpayers</div>
          </div>
          <!-- END PART V TITLE -->
          <!-- Line 27 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">27</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Enter the amount from line 26<span style="letter-spacing:3mm;font-weight:bold;">.......................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">27</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedIncomeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:187mm;border-bottom:1px solid black;padding-left:10mm;">
            Are you claiming the housing exclusion or housing deduction?
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/ClaimingHousingExclOrDedInd"/>
            </xsl:call-template>
            <br/>
            <input type="checkbox" style="height:3.5mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ClaimingHousingExclOrDedInd"/>
                <xsl:with-param name="BackupName">IRS2555ClaimingHousingExclOrDedInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$FormData/ClaimingHousingExclOrDedInd"/>
                <xsl:with-param name="BackupName">IRS2555ClaimingHousingExclOrDedInd</xsl:with-param>
              </xsl:call-template>
              <b>Yes</b>
            </label> Complete Part VI.<br/>
            <input type="checkbox" style="height:3mm;margin-bottom:0.4mm;margin-top:1mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ClaimingHousingExclOrDedInd"/>
                <xsl:with-param name="BackupName">IRS2555ClaimingHousingExclOrDedInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label style="margin-bottom:0.4mm;margin-top:1mm;">
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$FormData/ClaimingHousingExclOrDedInd"/>
                <xsl:with-param name="BackupName">IRS2555ClaimingHousingExclOrDedInd</xsl:with-param>
              </xsl:call-template>
              <b>No</b>
            </label> Go to Part VII.
          </div>
          <!-- BEGIN PART VI TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part VI</div>
            <div class="styPartDesc">Taxpayers Claiming the Housing Exclusion and/or Deduction</div>
          </div>
          <!-- END PART VI TITLE -->
          <!-- Line 28 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">28</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Qualified housing expenses for the tax year (see instructions)
              <span style="letter-spacing:3mm;font-weight:bold;">............</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">28</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingQualifiedExpenseAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 29a -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">29</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div class="styLNDesc" style="width:126mm;">
              Enter location where housing expenses incurred (see instructions)<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 2px;"/>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$FormData/HousingExpenseLocation"/>
				</xsl:call-template>
				<span style="width:2px;"/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/HousingExpenseLocation"/>
				</xsl:call-template>
            </div>
            <div style="float:left;">
              <div style="height:8mm;width:8mm;border-bottom:none;border-left:1px solid black;background-color:lightgrey;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:8mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <!-- Line 29b -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div class="styLNDesc" style="width:126mm;">
              Enter limit on housing expenses (see instructions)
              <span style="letter-spacing:3mm;font-weight:bold;">................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-bottom:1px solid black;border-left:1px solid black;font-weight:bold;text-align:center;">29b</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingExpenseLimitAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 30 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">30</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Enter the <b>smaller</b> of line 28 or line 29b<span style="letter-spacing:3mm;font-weight:bold;">....................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">30</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/SmallerQualifiedOrLimitAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 31 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">31</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:76mm;">
              Number of days in your qualifying period that fall within your 2013 tax
              year (see instructions)<span style="letter-spacing:3mm;font-weight:bold;">.......</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">31</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="float:none;height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="float:none;height:4.5mm;width:42mm;position:relative;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingQualifiedDaysCnt"/>
                </xsl:call-template>
                <b style="margin-right:1mm;"> days</b>
              </div>
            </div>
            <div style="float:left;width:8mm;height:9mm;background-color:lightgrey;border-left:1px solid black;"/>
            <div style="float:left;width:42mm;height:9mm;border-left:1px solid black;"/>
          </div>
          <!-- Line 32 -->
          <div style="width:187mm;height:8mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">32</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Multiply $42.78 by the number of days on line 31. If 365 is entered on line 31, enter $15,616.00 here<span style="letter-spacing:3mm;font-weight:bold;">............................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;border-bottom:1px solid black;">32</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;border-bottom:1px solid black;;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingMaximumAllowedAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 33 -->
          <div style="width:187mm;height:8mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">33</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Subtract line 32 from line 30. If the result is zero or less, do not complete the rest of this part or any of Part IX
              <span style="letter-spacing:3mm;font-weight:bold;">............................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;border-bottom:1px solid black;">33</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingExpensesOverMaxAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 34 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">34</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:76mm;">
              Enter employer-provided amounts (see instructions)<span style="letter-spacing:3mm;font-weight:bold;">..</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">34</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerProvidedHousingAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="height:4.5mm;width:8mm;float:left;border-left:1px solid black;background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
          </div>
          <!-- Line 35 -->
          <div style="width:187mm;height:8mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">35</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Divide line 34 by line 27. Enter the result as a decimal (rounded to at least three places), but do not enter more than "1.000"
              <span style="letter-spacing:3mm;font-weight:bold;">......................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;border-bottom:1px solid black;">35</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;border-bottom:1px solid black;color:darkblue;">
                <span style="float:left;padding-left:22mm;">x</span>
				<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerProvHousingExclPct"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 36 -->
          <div style="width:187mm;height:8mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">36</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              <b>Housing exclusion.</b> Multiply line 33 by line 35. Enter the result but do not enter more than the
              amount on line 34. Also, complete Part VIII
              <span style="letter-spacing:3mm;font-weight:bold;">.................</span>
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;border-bottom:1px solid black;">36</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingExclusionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:137mm;clear:left;padding-left:10mm;">
            <b>Note:</b>
            <i>The housing deduction is figured in Part IX. If you choose to claim the foreign earned
            income exclusion, complete Parts VII and VIII before Part IX.</i>
          </div>
          <!-- BEGIN PART VII TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;border-top:1px solid black;">
            <div class="styPartName" style="font-family:sans-serif;">Part VII</div>
            <div class="styPartDesc">Taxpayers Claiming the Foreign Earned Income Exclusion</div>
          </div>
          <!-- END PART VII TITLE -->
          <!-- Line 37 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">37</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Maximum foreign earned income exclusion
              <span style="letter-spacing:3mm;font-weight:bold;">...................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">37</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">$97,600.00</div>
            </div>
          </div>
          <!-- Line 38 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">38</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;position:relative;">
              <div style="position:absolute;top:2mm;;right:0mm;">
                <img alt="right bracket" src="{$ImagePath}/2555_sm_lft_bracket.gif" style="float:right;"/>
              </div>
              <div class="styLNDesc" style="font-size:7pt;width:76mm;height:3mm;padding-right:4mm;">
                <li>If you completed Part VI, enter the number from line 31.</li>
                <li>All others, enter the number of days in your qualifying period that fall within your 2013 tax year (see the instructions for line 31).</li>
              </div>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;"/>
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">38</div>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:42mm;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncmExclQlfyDaysCnt"/>
                </xsl:call-template>
                <b style="margin-right:1mm;"> days</b>
              </div>
            </div>
            <div style="float:left;">
              <div style="height:9mm;width:8mm;border-left:1px solid black;background-color:lightgrey;"/>
              <div style="height:9mm;width:8mm;border-left:1px solid black;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:9mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:9mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <!-- Line 39 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">39</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;position:relative;">
              <div style="position:absolute;top:2mm;;right:0mm;">
                <img alt="right bracket" src="{$ImagePath}/2555_sm_lft_bracket.gif" style="float:right;"/>
              </div>
              <div class="styLNDesc" style="font-size:7pt;width:126mm;height:3mm;padding-right:4mm;">
                <li>If line 38 and the number of days in your 2013 tax year (usually 365) are the same, enter "1.000."</li>
                <li>Otherwise, divide line 38 by the number of days in your 2013 tax year and enter the result as a decimal (rounded to at least three places).</li>
              </div>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">39</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;color:darkblue;">
                <span style="float:left;padding-left:22mm;">x</span>
				<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedIncExclusionPct"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="float:left;">
              <div style="height:5mm;width:8mm;border-left:1px solid black;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:5mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <!-- Line 40 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">40</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Multiply line 37 by line 39
              <span style="letter-spacing:3mm;font-weight:bold;">.......................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">40</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentForeignEarnedIncomeExclAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 41 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">41</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Subtract line 36 from line 27
              <span style="letter-spacing:3mm;font-weight:bold;">......................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">41</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignIncLessHousingExclAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 42 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">42</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              <b>Foreign earned income exclusion.</b> Enter the <b>smaller</b> of line 40 or line 41. Also, complete Part VIII
              <span style="letter-spacing:3mm;font-weight:bold;">.............................</span>
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
            </div>
            <div style="float:left;">
              <div style="height:7.6mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;padding-top:4mm;">42</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:7.6mm;width:42mm;position:relative;border-bottom:none;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedIncExclusionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- BEGIN PART VIII TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;border-top:1px solid black;">
            <div class="styPartName" style="font-family:sans-serif;">Part VIII</div>
            <div class="styPartDesc">Taxpayers Claiming the Housing Exclusion, Foreign Earned Income Exclusion, or Both</div>
          </div>
          <!-- END PART VIII TITLE -->
          <!-- Line 43 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">43</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Add lines 36 and 42
              <span style="letter-spacing:3mm;font-weight:bold;">.........................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">43</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentativeIncomeExclusionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 44 -->
          <div style="width:187mm;height:8mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">44</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Deductions allowed in figuring your adjusted gross income (Form 1040, line 37) that are allocable
              to the excluded income. See instructions and attach computation
              <span style="letter-spacing:3mm;font-weight:bold;">.......</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;border-bottom:1px solid black;">44</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:5mm;width:42mm;position:relative;">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData/DeductionAllocToExcludedIncAmt"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/DeductionAllocToExcludedIncAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 45 -->
          <div style="width:187mm;height:11mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">45</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Subtract line 44 from line 43. Enter the result here and in parentheses on <b>Form 1040, line 21.</b>
              Next to the amount enter "Form 2555." On Form 1040, subtract this amount from your income
              to arrive at total income on Form 1040, line 22
              <span style="letter-spacing:3mm;font-weight:bold;">.................</span>
            </div>
            <div style="float:left;">
              <div style="height:6mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;">45</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:6mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:5mm;width:42mm;border-bottom:none;">
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Line 45 - Foreign Earned Income PY Exclusion Amount</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt/@foreignEarnedIncPYExclusionAmt"/>
                </xsl:call-template>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Line 45 - Foreign Earned Income PY Exclusion Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt/@foreignEarnedIncPYExclusionCd"/>
                </xsl:call-template>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- BEGIN PART IX TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;border-top:1px solid black;">
            <div class="styPartName" style="font-family:sans-serif;line-height:7mm;">Part IX</div>
            <div class="styPartDesc" style="font-weight:normal">
              <b>Taxpayers Claiming the Housing Deduction -</b> Complete this part only if <b>(a)</b> line 33 is more than line 36 and
            <b>(b)</b> line 27 is more than line 43.</div>
          </div>
          <!-- END PART IX TITLE -->
          <!-- Line 46 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">46</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Subtract line 36 from line 33
              <span style="letter-spacing:3mm;font-weight:bold;">......................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">46</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingDeductionExpenseAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 47 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">47</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Subtract line 43 from line 27
              <span style="letter-spacing:3mm;font-weight:bold;">......................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">47</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingDeductionExclusionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 48 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">48</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Enter the <b>smaller</b> of line 46 or line 47
              <span style="letter-spacing:3mm;font-weight:bold;">...................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">48</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingDeductionTentativeAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div style="width:135.3mm;height:10mm;float:left;padding-left:10mm;">
            <b>Note: </b>
            <i>If line 47 is <b>more than</b> line 48 and you could not deduct all of your 2012 housing deduction
            because of the 2012 limit, use the worksheet in the instructions to figure the amount
            to enter on<br/>line 49. Otherwise, go to line 50.</i>
          </div>
          <div style="width:8.25mm;height:10mm;background-color:lightgrey;border-left:1px solid black;border-right:1px solid black;"/>
          <!--<div style="width:1mm;height:10mm;border-left:1px solid black;"/>-->
          <!-- Line 49 -->
          <div style="width:187mm;clear:left;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">49</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Housing deduction carryover from 2012 (from the housing deduction carryover worksheet in the instructions)
              <span style="letter-spacing:3mm;font-weight:bold;">...........................</span>
            </div>
            <div style="float:left;">
              <div style="height:7.4mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;background-color:lightgrey;padding-top:2.6mm;"><div style="height:4.5mm;background-color:white;">49</div></div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:7.4mm;width:42mm;border-bottom:1px solid black;padding-top:2.6mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingDeductionCarryoverAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 50 -->
          <div class="styTBB" style="width:187mm;height:11mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">50</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              <b>Housing deduction.</b> Add lines 48 and 49. Enter the total here and on Form 1040 to the left of
              line 36. Next to the amount on Form 1040, enter "Form 2555." Add it to the total adjustments
              reported on that line
              <span style="letter-spacing:3mm;font-weight:bold;">..........................</span>
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
            </div>
            <div style="float:left;">
              <div style="height:6mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;">50</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:6mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:5mm;width:42mm;border-bottom:none;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/HousingDeductionAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:0mm;text-align:right;">
            Form <span class="styBoldText" style="font-size:8pt;">2555</span> (2013)
          </div>
          <!--END Page Footer-->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Top Left Margin - Claiming Foreign Earned Income Waiver</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/@claimFrgnEarnIncWaiverCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="TargetNode" select="$FormData/Country"/>
              <xsl:with-param name="Desc">Line 1 - Country</xsl:with-param>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="TargetNode" select="$FormData/NoTravelExplanationCd"/>
              <xsl:with-param name="Desc">Line 18a(1) - No Travel Explanation Code</xsl:with-param>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt/@foreignEarnedIncPYExclusionAmt"/>
              <xsl:with-param name="Desc">Line 45 - Foreign Earned Income PY Exclusion Amount</xsl:with-param>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt/@foreignEarnedIncPYExclusionCd"/>
              <xsl:with-param name="Desc">Line 45 - Foreign Earned Income PY Exclusion Code</xsl:with-param>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- Separated data for Part I Line 14 -->
         <xsl:if test="$Print=$Separated and count($FormData/PresenceInTheUSGroup) &gt; 8">
			<br/>
			<span class="styRepeatingDataTitle">
				Form 2555, Part II - Line 14 - Presence In The US Group
			</span>
			<xsl:variable name="CellStyle">border-color:black;border-style:solid;border-width:0px 1px;font-size:6.5pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
              <table class="styDepTbl" cellspacing="0">
                <thead>
                  <tr class="styDepTblHdr">
                    <th scope="col">
                      <xsl:attribute name="style">width:25%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      <b>(a)</b>
                      Date 
                      arrived in U.S.
                    </th>
                    <th scope="col">
                      <xsl:attribute name="style">width:25%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      <b>(b)</b>
                      Date left 
                      U.S.
                    </th>
                    <th scope="col">
                      <xsl:attribute name="style">width:25%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      <b>(c)</b>
                      Number of 
                      days in U.S. on 
                      business
                    </th>
                    <th scope="col">
                      <xsl:attribute name="style">width:25%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      <b>(d)</b>
                      Income earned in 
                      U.S. on business 
                      (attach computation)
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/PresenceInTheUSGroup">
                    <tr style="font-size:7pt;font-family:arial;">
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:25%;text-align:center;
							border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
                          <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
						</xsl:attribute>
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="ArrivedInUSDt"/>
                        </xsl:call-template>
                      </td>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:25%;text-align:center;
                          border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
						  <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="DepartedUSDt"/>
                        </xsl:call-template>
                      </td>
                       <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:25%;text-align:center;
                          border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
						  <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="BusinessDaysCnt"/>
                        </xsl:call-template>
                      </td>
                       <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:25%;text-align:right;
                          border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
						  <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
         </xsl:if> 
          <!-- end of separated data for part I line 14 -->
		  <xsl:if test="$FormData/OtherPurposeAllowanceTypeAmt">
			<br/>
			<span class="styRepeatingDataTitle">
				Form 2555, Part IV - Line 22f - Other Purpose Allowance Type and Amount
			</span>
			<xsl:variable name="CellStyle">border-color:black;border-style:solid;border-width:0px 1px;font-size:6.5pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
              <table class="styDepTbl" cellspacing="0">
                <thead>
                  <tr class="styDepTblHdr">
                    <th scope="col">
                      <xsl:attribute name="style">width:70%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Allowance Type
                    </th>
                    <th scope="col">
                      <xsl:attribute name="style">width:30%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Allowance Amount
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/OtherPurposeAllowanceTypeAmt">
                    <tr style="font-size:7pt;font-family:arial;">
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:70%;text-align:left;
							border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
                          <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
						</xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Description"/>
                        </xsl:call-template>
                      </td>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:30%;text-align:right;
                          border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
						  <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
		  </xsl:if>
		  <xsl:if test="$FormData/OtherForeignIncomeTypeAmt">
			<br/>
			<span class="styRepeatingDataTitle">
				Form 2555, Part IV - Line 23 - Other Foreign Earned Income Type and Amount
			</span>
			<xsl:variable name="CellStyle">border-color:black;border-style:solid;border-width:0px 1px;font-size:6.5pt;text-align:center;font-family:arial;padding-left:0px;padding-right:0px;</xsl:variable>
              <table class="styDepTbl" cellspacing="0">
                <thead>
                  <tr class="styDepTblHdr">
                    <th scope="col">
                      <xsl:attribute name="style">width:70%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Foreign Earned Income Type
                    </th>
                    <th scope="col">
                      <xsl:attribute name="style">width:30%;<xsl:value-of select="$CellStyle"/></xsl:attribute>
                      Other Foreign Earned Income Amount
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/OtherForeignIncomeTypeAmt">
                    <tr style="font-size:7pt;font-family:arial;">
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:70%;text-align:left;
							border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
                          <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
						</xsl:attribute>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Description"/>
                        </xsl:call-template>
                      </td>
                      <!-- ++++++++++++++++++++++++++++++++++ -->
                      <td>
                        <xsl:attribute name="style">
                          width:30%;text-align:right;
                          border-style:solid;border-color:black;border-right-width:1px;border-top-width:0px;border-left-width:0px;
						  <xsl:choose>
						    <xsl:when test="position() = last()">border-bottom-width:0px;</xsl:when>
						    <xsl:otherwise>border-bottom-width:1px;</xsl:otherwise>
						  </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
		  </xsl:if>
          <xsl:if test="$Print = $Separated and  count($Part2Data/PresenceInTheUSGroup) &gt; 8">
            <br/>
            <span class="styRepeatingDataTitle">Form 2555 - Part 2, Line 14</span>
            <table class="styDepTbl" style="font-size:7pt;border-collapse:collapse;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" style="font-weight:normal;border:1px solid black;width:24mm;">
                      <b>(a)</b> Date arrived in U.S.</th>
                    <th scope="col" style="font-weight:normal;border:1px solid black;width:24mm;">
                      <b>(b)</b> Date left U.S.</th>
                    <th scope="col" style="font-weight:normal;border:1px solid black;width:15mm;">
                      <b>(c)</b> Number of days in U.S. on business</th>
                    <th scope="col" style="font-weight:normal;border:1px solid black;border-right:none;width:30mm;">
                      <b>(d)</b> Income earned in U.S. on business (attach computation)</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Part2Data/PresenceInTheUSGroup">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                     </xsl:attribute>
                        <td style="border:1px solid black;">
                          <xsl:call-template name="PopulateMonth">
                            <xsl:with-param name="TargetNode" select="ArrivedInUSDt"/>
                          </xsl:call-template>-<xsl:call-template name="PopulateDay">
                            <xsl:with-param name="TargetNode" select="ArrivedInUSDt"/>
                          </xsl:call-template>-<xsl:call-template name="PopulateYear">
                            <xsl:with-param name="TargetNode" select="ArrivedInUSDt"/>
                          </xsl:call-template>
                        </td>
                        <td style="border:1px solid black;">
                          <xsl:call-template name="PopulateMonth">
                            <xsl:with-param name="TargetNode" select="DepartedUSDt"/>
                          </xsl:call-template>-<xsl:call-template name="PopulateDay">
                            <xsl:with-param name="TargetNode" select="DepartedUSDt"/>
                          </xsl:call-template>-<xsl:call-template name="PopulateYear">
                            <xsl:with-param name="TargetNode" select="DepartedUSDt"/>
                          </xsl:call-template>
                        </td>
                        <td style="border:1px solid black;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="BusinessDaysCnt"/>
                          </xsl:call-template>
                        </td>
                        <td style="border:1px solid black;border-right:none;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
                          </xsl:call-template>
                        </td>
                      
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          
          <xsl:if test="$Print = $Separated and  count($FormData/PhysicalPresenceCountryGroup) &gt; 4">
            <br/>
            <span class="styRepeatingDataTitle">Form 2555 - Part 3, Line 18</span>
            <table class="styDepTbl" style="font-size:7pt;border-collapse:collapse;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" style="font-weight:normal;border:1px solid black;border-left:none;">
                    <b>(a)</b> Name of country (including U.S.)</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(b)</b> Date arrived</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(c)</b> Date left</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(d)</b> Full days present in country</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;">
                    <b>(e)</b> Number of days in U.S. on business</th>
                  <th scope="col" style="font-weight:normal;border:1px solid black;border-right:none;">
                    <b>(f)</b> Income earned in U.S. on business (attach computation)</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormData/PhysicalPresenceCountryGroup">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                     </xsl:attribute>
                    <td style="border:1px solid black;border-left:none;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="CountryName"/>
                      </xsl:call-template>
                    </td>
                    <td style="border:1px solid black;">
                      <xsl:call-template name="PopulateMonth">
                        <xsl:with-param name="TargetNode" select="ArrivalDt"/>
                      </xsl:call-template>-<xsl:call-template name="PopulateDay">
                        <xsl:with-param name="TargetNode" select="ArrivalDt"/>
                      </xsl:call-template>-<xsl:call-template name="PopulateYear">
                        <xsl:with-param name="TargetNode" select="ArrivalDt"/>
                      </xsl:call-template>
                    </td>
                    <td style="border:1px solid black;">
                      <xsl:call-template name="PopulateMonth">
                        <xsl:with-param name="TargetNode" select="DepartureDt"/>
                      </xsl:call-template>-<xsl:call-template name="PopulateDay">
                        <xsl:with-param name="TargetNode" select="DepartureDt"/>
                      </xsl:call-template>-<xsl:call-template name="PopulateYear">
                        <xsl:with-param name="TargetNode" select="DepartureDt"/>
                      </xsl:call-template>
                    </td>
                    <td style="border:1px solid black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="DaysPresentInCountryInd"/>
                      </xsl:call-template>
                    </td>
                    <td style="border:1px solid black;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessDaysInUSCnt"/>
                      </xsl:call-template>
                    </td>
                    <td style="border:1px solid black;border-right:none;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="USBusinessIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- Additional Data Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
