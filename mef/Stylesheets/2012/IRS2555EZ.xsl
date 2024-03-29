<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS2555EZStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS2555EZ"/>
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
        <meta name="Description" content="IRS Form 2555-EZ"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS2555EZStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form2555EZ">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;height:22mm;">
            <div class="styFNBox" style="width:40mm;height:22mm;">
              <div style="padding-top:1mm;">
                Form <span class="styFormNumber" style="font-size:18pt;">2555-EZ</span><br/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData" />
                </xsl:call-template>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Claiming Foreign Earned Income Waiver Code</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/@ClaimFrgnEarnIncWaiverCd"/>
                </xsl:call-template>
              </div>
              <div style="padding-top:1mm;">
                <span class="styAgency" style="font-size:8pt;">Department of the Treasury</span>
                <br/>
                <span class="styAgency" style="font-size:8pt;">Internal Revenue Service(99)</span>
              </div>
            </div>
            <div class="styFTBox" style="width:103mm;height:22mm;">
              <div style="padding-top:2mm;" class="styMainTitle">
              Foreign Earned Income Exclusion
              </div>
              <div class="styFBT" style="height:4mm;width:90mm">
                <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" /> Information about Form 2555-EZ and its separate instructions is available at www.irs.gov/form2555.<br/>
                <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" /> See separate instructions.
                <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin-left:5mm;"/> Attach to Form 1040.
              </div>
            </div>
            <div class="styTYBox" style="width:36mm;height:22mm;">
              <div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
              <div class="styTY" style="height:7mm;font-size:22pt;">2012</div>
              <div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">
                Attachment<br/>
                Sequence No. <span class="styBoldText">34A</span>
              </div>
            </div>
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
              <span style="width: 40mm; text-align: left;font-weight:normal;">
                <xsl:call-template name="PopulateSSN">
                 <xsl:with-param name="TargetNode" select="$FormData/SSN"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- You may use this form line -->
          <div style="width:187mm;clear:none;height:20mm;padding-top:3mm;border-bottom:1px solid black">
			  <div style="float:left;clear:none;width:30mm;height:20mm;font-size:9pt;text-align:center;padding-top:4mm">
				  <b>You May Use This Form If You:</b>
			   </div>
			   <div style="float:left;clear:none;width:60mm;height:20mm;">
				   <div style="width:60mm;">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;"> Are a U.S. citizen or a resident alien.</div>
					</div>
					
					<div style="width:60mm;padding-top:1px">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;">Earned wages/salaries in a foreign country.</div>
					</div>
					
					<div style="width:60mm;padding-top:1px">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;">Had total foreign earned income of $95,100 or less.</div>
					</div>
					
					<div style="width:60mm;padding-top:1px">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;">Are filing a calendar year return that covers a 12-month period.</div>
					</div>
			   </div>
			   <span style="width:7mm;height:20mm;float:left;clear:none;"/>
			   <div style="float:left;clear:none;width:30mm;height:20mm;font-size:9pt;text-align:center;padding-top:6mm">
				   <b>And You:</b>
			   </div>
			   <div style="float:left;clear:none;width:60mm;height:20mm"> 
				   <div style="width:60mm">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;">Do not have self-employment income.</div>
					</div>
					
					<div style="width:60mm;padding-top:5px">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;">Do not have business/moving expenses.</div>
					</div>
					
					<div style="width:60mm;padding-top:5px">
						<div style="float:left;clear:none;width:3mm;"><li/></div><div style="width:50mm;float:left;clear:none;">Do not claim the foreign housing exclusion or deduction.</div>
				   </div>
			   </div>
          </div>
          <!-- BEGIN PART I TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part I</div>
            <div class="styPartDesc">Tests To See If You Can Take the Foreign Earned Income Exclusion</div>
          </div>
          <!-- END PART I TITLE -->
          <!-- Line 1 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">1</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              <b>Bona Fide Residence Test</b>
            </div>
          </div>
          <!-- Line 1a -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:156mm;height:8mm;padding-right:1mm;">
              Were you a bona fide resident of a foreign country or countries for a period that includes an entire tax year (see page 2 of the instructions)?
              <span style="font-weight:bold;letter-spacing:3mm;">..................................</span>
            </div>
            <div style="float:left;width:20mm;">
              <div style="height:4mm;"/>
              <div style="height:5mm;text-align:right;">
                <input type="checkbox" style="padding:0;margin:0;height:15px;width:15px;">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/BonaFideResidentInd"/>
                    <xsl:with-param name="BackupName">IRS2555BonaFideResidentInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="height:3mm;padding-bottom:1.15mm;">
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$FormData/BonaFideResidentInd"/>
                    <xsl:with-param name="BackupName">IRS2555BonaFideResidentInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                </span>
                <input type="checkbox" style="padding:0;margin:0;height:15px;width:15px;">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/BonaFideResidentInd"/>
                    <xsl:with-param name="BackupName">IRS2555BonaFideResidentInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="height:3mm;padding-bottom:1.15mm;">
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$FormData/BonaFideResidentInd"/>
                    <xsl:with-param name="BackupName">IRS2555BonaFideResidentInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
                </span>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;height:8mm;padding-right:1mm;">
              <li>If you answered "Yes," you meet this test. Fill in line 1b and then go to line 3.</li>
              <li>If you answered "No," you <b>do not</b> meet this test. Go to line 2 to see if you meet the Physical Presence Test.</li>
            </div>
          </div>
          <!-- Line 1b -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;height:8mm;padding-right:1mm;">
              Enter the date your bona fide residence began <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:25mm;border-bottom:1px solid black">
              <xsl:call-template name="PopulateMonthDayYear">
				  <xsl:with-param name="TargetNode" select="$FormData/TaxpayerBonaFideResGrp/BonaFideResidenceBeginDt"/>
              </xsl:call-template>
              </span>
              , and ended (see instructions) <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:25mm;border-bottom:1px solid black">
                <xsl:choose>
                  <xsl:when test="$FormData/TaxpayerBonaFideResGrp/BonaFideResidenceEndDt">
					  <xsl:call-template name="PopulateMonthDayYear">
						  <xsl:with-param name="TargetNode" select="$FormData/TaxpayerBonaFideResGrp/BonaFideResidenceEndDt"/>
					  </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$FormData/TaxpayerBonaFideResGrp/BonaFideResidenceContinuedCd">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxpayerBonaFideResGrp/BonaFideResidenceContinuedCd"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
              </span>
              .
            </div>
          </div>
          <!-- Line 2 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">2</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              <b>Physical Presence Test</b>
            </div>
          </div>
          <!-- Line 2a -->
          <div style="width:187mm;margin-top:1mm;height:5mm">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:156mm;height:8mm;padding-right:1mm;">
              Were you physically present in a foreign country or countries for at least 330 full days during -
              <div style="width:100mm;float:left;">
                <img src="{$ImagePath}/2555EZ_sm_lft_bracket.gif" alt="left bracket" style="float:right;"/>
                <img src="{$ImagePath}/2555EZ_sm_rt_bracket.gif" alt="left bracket" style="float:left;"/>
                2012 <b>or</b><br/>
                any other period of 12 months in a row starting or ending in 2012?
              </div>
              <div style="float:left;letter-spacing:3mm;font-weight:bold;line-height:4mm;">
                ..............
              </div>
            </div>
            <div style="float:left;width:20mm;">
              <div style="height:4mm;"/>
              <div style="height:5mm;text-align:right;">
                <input type="checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceInd"/>
                    <xsl:with-param name="BackupName">IRS2555PhysicalPresenceInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="height:3mm;padding-bottom:1.15mm;">
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceInd"/>
                    <xsl:with-param name="BackupName">IRS2555PhysicalPresenceInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                </span>
                <input type="checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceInd"/>
                    <xsl:with-param name="BackupName">IRS2555PhysicalPresenceInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="height:3mm;padding-bottom:1.15mm;">
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$FormData/PhysicalPresenceInd"/>
                    <xsl:with-param name="BackupName">IRS2555PhysicalPresenceInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
                </span>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;height:8mm;padding-right:1mm;">
              <li>If you answered "Yes," you meet this test. Fill in line 2b and then go to line 3.</li>
              <li>If you answered "No," you <b>do not</b> meet this test. You <b>cannot</b> take the exclusion unless you meet the Bona Fide Residence Test above.</li>
            </div>
          </div>
          <!-- Line 2b -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;height:8mm;padding-right:1mm;">
              The physical presence test is based on the 12-month period from <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:25mm;border-bottom:1px solid black">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$FormData/TaxpayerPhysicalPresenceGrp/PhysicalPresenceBeginDt"/>
                </xsl:call-template>
              </span>
              through <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="width:25mm;border-bottom:1px solid black">
                <xsl:choose>
                  <xsl:when test="$FormData/TaxpayerPhysicalPresenceGrp/PhysicalPresenceEndDt">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxpayerPhysicalPresenceGrp/PhysicalPresenceEndDt"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:when test="$FormData/TaxpayerPhysicalPresenceGrp/PhysicalPresenceContinuedCd">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxpayerPhysicalPresenceGrp/PhysicalPresenceContinuedCd"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise></xsl:otherwise>
                </xsl:choose>
              </span>
              .
            </div>
          </div>
          <!-- Line 3 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">3</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:156mm;height:8mm;padding-right:1mm;">
              <b>Tax Home Test.</b> Was your tax home in a foreign country or countries throughout your period of bona fide residence or physical presence, whichever applies?
              <span style="font-weight:bold;letter-spacing:3mm;">............................</span>
            </div>
            <div style="float:left;width:20mm;">
              <div style="height:4mm;"/>
              <div style="height:5mm;text-align:right;">
                <input type="checkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxHomeTestInd"/>
                    <xsl:with-param name="BackupName">IRS2555TaxHomeTestInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="height:3mm;padding-bottom:1.15mm;">
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxHomeTestInd"/>
                    <xsl:with-param name="BackupName">IRS2555TaxHomeTestInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                </span>
                <input type="checkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxHomeTestInd"/>
                    <xsl:with-param name="BackupName">IRS2555TaxHomeTestInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <span style="height:3mm;padding-bottom:1.15mm;">
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$FormData/TaxHomeTestInd"/>
                    <xsl:with-param name="BackupName">IRS2555TaxHomeTestInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
                </span>
              </div>
            </div>
          </div>
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;height:8mm;padding-right:1mm;">
              <li>If you answered "Yes," you can take the exclusion. Complete Part II below and then go to page 2.</li>
              <li>If you answered "No," you <b>cannot</b> take the exclusion. <b>Do not</b> file this form.</li>
            </div>
          </div>
          <!-- BEGIN PART II TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;border-top:1px solid black;">
            <div class="styPartName" style="font-family:sans-serif;">Part II</div>
            <div class="styPartDesc">General Information</div>
          </div>
          <!-- END PART II TITLE -->
          <!-- Line 4,5 container -->
          <div style="width:187mm;border-bottom:1px solid black;">
            <!-- Line 4 -->
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">4</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:137mm;border-right:1px solid black;">
              Your foreign address (including country)<br/>
              <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignAddress"/>
              </xsl:call-template>
            </div>
            <!-- Line 5 -->
             <div style="float:left;width:30mm;padding-left:1mm;">
             <b style="margin-right:3mm;">5</b>Your occupation<br/>	
               <div style="margin-left:5mm">
               	  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/Occupation"/>
				  </xsl:call-template>
				</div>
            </div>
          </div>
          <!-- Line 6,7,8 container -->
          <div style="height:18mm;width:187mm;border-bottom:1px solid black;">
            <!-- Line 6 -->
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">6</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:35mm;">
              Employer's name<br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine1"/>
              </xsl:call-template>
              <xsl:if test="$FormData/EmployerName/BusinessNameLine2">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine2"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            <!-- Line 7 -->
            <div style="height:100%;float:left;width:71mm;padding-left:1mm;border-left:1px solid black;">
              <b style="margin-right:3mm;">7</b>Employer's U.S. address (including ZIP code)<br/>
              <div style="padding-left:5mm;">
				  <xsl:call-template name="PopulateUSAddressTemplate">
					<xsl:with-param name="TargetNode" select="$FormData/EmployerUSAddress"/>
				  </xsl:call-template>
			   </div>
            </div>
            <!-- Line 8 -->
            <div style="height:100%;float:left;width:71mm;padding-left:1mm;border-left:1px solid black;">
              <b style="margin-right:3mm;">8</b>Employer's foreign address<br/>
               <div style="margin-left:5mm">
				  <xsl:call-template name="PopulateForeignAddressTemplate">
					<xsl:with-param name="TargetNode" select="$FormData/EmployerForeignAddress"/>
				  </xsl:call-template>
				</div>
            </div>
          </div>
          <!-- Line 9 -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">9</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div style="float:left;width:176mm;">
              Employer is (check any that apply):
            </div>
          </div>
          <!-- Line 9a -->
          <div style="width:187mm;">
            <div style="float:left;width:7mm;padding-left:5mm;padding-top:1mm;font-weight:bold;">a</div>
            <div style="float:left;width:173.5mm;height:4mm;padding-top:1mm;padding-left:3.5mm">A U.S. business
				<span style="font-weight:bold;letter-spacing:3mm;">.......................................</span>
				</div>
			<div class="styGenericDiv" style="">
              <input type="checkbox"  style="height:4mm;width:4mm">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerUnitedStatesCompanyInd"/>
                  <xsl:with-param name="BackupName">IRS2555EZEmployerUnitedStatesCompanyInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
				  <xsl:call-template name="PopulateLabel">
				  <xsl:with-param name="TargetNode" select="$FormData/EmployerUnitedStatesCompanyInd"/>
				  <xsl:with-param name="BackupName">IRS2555EZEmployerUnitedStatesCompanyInd</xsl:with-param>
				  </xsl:call-template>
				  
				</label>
            </div>
          </div>
          <!-- Line 9b -->
          <div style="width:187mm;">
            <div style="float:left;width:7mm;padding-top:1mm;padding-left:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:173.5mm;padding-top:1mm;padding-left:3.5mm">
				A foreign business
				<span style="font-weight:bold;letter-spacing:3mm;">......................................</span>
			</div>
			<div class="styGenericDiv" style="width:4mm;height:4mm">
              <input type="checkbox" style="height:4mm;width:4mm">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerForeignEntityInd"/>
                  <xsl:with-param name="BackupName">IRS2555EZEmployerForeignEntityInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/EmployerForeignEntityInd"/>
					<xsl:with-param name="BackupName">IRS2555EZEmployerForeignEntityInd</xsl:with-param>
				  </xsl:call-template>
				
				</label>
            </div>
          </div>
          <!-- Line 9c -->
          <div style="width:187mm;">
            <div style="float:left;width:7mm;padding-top:1mm;padding-left:5mm;font-weight:bold;">c</div>
            <div style="float:left;width:173.5mm;padding-top:0.75mm;padding-left:3.5mm;height:4mm">
				Other (specify)
				<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
				<span style="border-bottom:1px solid black;width:140mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/OtherEmployerTypeGroup/OtherEmployerTypeDescTxt"/>
              </xsl:call-template>
              </span>
            </div>
            <div class="styGenericDiv" style="height:4mm;width:4mm">
              <input type="checkbox" style="height:4mm;width:4mm">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/OtherEmployerTypeGroup/OtherEmployerTypeInd"/>
                  <xsl:with-param name="BackupName">IRS2555EZOtherEmployerTypeInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
				  <xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/OtherEmployerTypeGroup/OtherEmployerTypeInd"/>
					<xsl:with-param name="BackupName">IRS2555EZOtherEmployerTypeInd</xsl:with-param>
				  </xsl:call-template>
				</label>
            </div>
          </div>
          <!-- Line 10a -->
          <div style="width:187mm;">
            <div style="float:left;width:7mm;padding-left:1.75mm;font-weight:bold;">10a</div>
            <div style="float:left;width:176mm;padding-left:3.5mm;">
              If you previously filed Form 2555 or 2555-EZ, enter the last year you filed the form.
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="border-bottom:1px solid black;width:48.5mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/LastFrgnEarnIncExclClaimedYr"/>
              </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 10b -->
          <div style="width:187mm">
            <div style="float:left;width:7mm;padding-left:5mm;font-weight:bold;height:3.5mm;padding-top:1mm;">b</div>
            <div style="float:left;width:95.5mm;padding-left:3.5mm;padding-top:1mm">
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/NoFrgnEarnIncExclPrevFiledInd"/>
						<xsl:with-param name="BackupName">IRS2555NoFrgnEarnIncExclPrevFiledInd</xsl:with-param>
					</xsl:call-template>
					If you did not previously file Form 2555 or 2555-EZ, check here
					<span style="width:5px"/>
					<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet"/>
				</label>
            </div>
            <div class="styGenericDiv" style="padding-top:0.5mm;padding-left:0.5mm">
              <input type="checkbox" style="height:4mm;width:4mm">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/NoFrgnEarnIncExclPrevFiledInd"/>
                  <xsl:with-param name="BackupName">IRS2555NoFrgnEarnIncExclPrevFiledInd</xsl:with-param>
                </xsl:call-template>
              </input>
            </div>
            <div class="styGenericDiv" style="padding-top:1mm;padding-left:0.5mm">and go to line 11a now.</div>
          </div>
          <!-- Line 10c -->
          <div style="width:187mm;height:3mm;">
            <div class="styLNLeftNumBox" style="width:10mm;padding-left:5mm">c</div>
            <div class="styGenericDiv" style="width:156mm;height:3mm;padding-top:1mm;">
              Have you ever revoked the foreign earned income exclusion?<span style="letter-spacing:3mm;">.....................</span>
              </div>
              <div class="styGenericDiv" style="width:20mm;margin-bottom:0.5mm;height:3mm" >
              <input type="checkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
                  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="height:3mm;padding-bottom:1.15mm;">
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
                  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              </span>
              <input type="checkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
                  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <span style="height:3mm;padding-bottom:1.15mm;">
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokedInd"/>
                  <xsl:with-param name="BackupName">IRS2555ForeignEarnIncExclRevokedInd</xsl:with-param>
                </xsl:call-template>
                <b>No</b>
              </label>
              </span>
            </div>
          </div>
          <!-- Line 10d -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">d</div>
            <div style="float:left;width:176mm;">
              If you answered "Yes," enter the tax year for which the revocation was effective.<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="border-bottom:1px solid black;width:57mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncExclRevokeTaxYr"/>
              </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Line 11a -->
          <div style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">11</div>
            <div style="float:left;width:5mm;font-weight:bold;">a</div>
            <div style="float:left;width:176mm;">
				<span style="float:left;">
              List your tax home(s) during 2012 and date(s) established.<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              </span>
			  
              <xsl:for-each select="$FormData/TaxHomeGroup">
              
			  <xsl:if test="position() != 1">
				  <span style="float:left;width:83mm"/>
              </xsl:if>
			  
			  
			  <span style="width:93mm;float:right;">
              <span style="border-bottom:1px solid black;width:84.5mm;">
                <xsl:call-template name="PopulateText"> 
                  <xsl:with-param name="TargetNode" select="TaxHomeDescriptionTxt"/>
                </xsl:call-template>
                <span style="width:2mm;"/>
                <xsl:call-template name="PopulateMonth"><xsl:with-param name="TargetNode" select="EstablishedDt"/></xsl:call-template>-
                <xsl:call-template name="PopulateDay"><xsl:with-param name="TargetNode" select="EstablishedDt"/></xsl:call-template>-
                <xsl:call-template name="PopulateYear"><xsl:with-param name="TargetNode" select="EstablishedDt"/></xsl:call-template>
                </span>
				</span>
                <!--<br/>-->
              </xsl:for-each>
              
            </div>
          </div>
          <!-- Line 11b -->
          <div class="styTBB" style="width:187mm;margin-top:1mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;"/>
            <div style="float:left;width:5mm;font-weight:bold;">b</div>
            <div style="float:left;width:176mm;">
              Of what country are you a citizen/national?<img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
              <span style="border-bottom:1px solid black;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/CitizenCountryNm"/>
              </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">For Paperwork Reduction Act Notice, see the Form 1040 instructions.</span>
              <span style="width:13mm;"/>                        
                Cat. No. 13272W
            </div>
            <div style="float:right;">  
              <span style="width:40px;"/>  
              Form <span class="styBoldText" style="font-size:8pt;">2555-EZ</span> (2012)
            </div>
          </div>
          <!-- Page 2 Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Form 2555-EZ (2012)</div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
          </div>
          <!-- BEGIN PART III TITLE -->
          <div style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part III</div>
            <div class="styPartDesc">Days Present in the United States - <span style="font-weight:normal;">Complete this part if you were in the United States or its possessions during 2012.</span></div>
          </div>
          <!-- END PART III TITLE -->
          <!-- Line 12 -->
          <div class="styGenericDiv" style="text-align:right;width:187mm;height:4mm;clear:none;">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup"/>
              <xsl:with-param name="containerHeight" select="9"/>
              <xsl:with-param name="containerID" select="'line12divctr'"/>
            </xsl:call-template>
          </div>
          <div class="styTableContainer" id="line12divctr">
            <xsl:call-template name="SetInitialState"/>
            <table style="border-collapse:collapse;font-size:7pt;">
              <thead style="vertical-align:top;">
                <tr>
                <th scope="col" style="border:1px solid black;border-left:none;font-weight:normal;width:46mm;"><b style="margin-left:3mm;">12</b> <b style="margin-left:5mm;">(a)</b> Date arrived in U.S.</th>
                <th scope="col" style="border:1px solid black;font-weight:normal;width:46mm;"><b>(b)</b> Date left U.S.</th>
                <th scope="col" style="border:1px solid black;font-weight:normal;width:46mm;"><b>(c)</b> Number of days in U.S. on business</th>
                <th scope="col" style="border:1px solid black;border-right:none;font-weight:normal;width:49mm;"><b>(d)</b> Income earned in U.S. on business (attach computation)</th>
                </tr>
              </thead>
              <tbody style="text-align:center;">
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:choose>
                      <xsl:when test="$Print = $Separated and count($FormData/PresenceInTheUSGroup) &gt; 9">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:if test="$FormData/PresenceInTheUSGroup[1]">
                          <xsl:call-template name="PopulateMonth">
                            <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/ArrivedInUSDt"/>
                          </xsl:call-template>-<xsl:call-template name="PopulateDay">
                            <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/ArrivedInUSDt"/>
                          </xsl:call-template>-<xsl:call-template name="PopulateYear">
                            <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/ArrivedInUSDt"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[1]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[1]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[2]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[2]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[2]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[3]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[3]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[3]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[4]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[4]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[4]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[5]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[5]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[5]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[6]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[6]">
                    <xsl:call-template name="PopulateMonth">                    
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[6]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[7]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[7]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[7]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[8]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[8]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[8]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <tr>
                  <td style="border:1px solid black;border-left:none;">&nbsp;
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[9]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/ArrivedInUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/ArrivedInUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:if test="$FormData/PresenceInTheUSGroup[9]">
                    <xsl:call-template name="PopulateMonth">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateDay">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/DepartedUSDt"/>
                    </xsl:call-template>-<xsl:call-template name="PopulateYear">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/DepartedUSDt"/>
                    </xsl:call-template></xsl:if></xsl:if>
                  </td>
                  <td style="border:1px solid black;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/BusinessDaysCnt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                  <td style="border:1px solid black;border-right:none;">
                  <xsl:if test="$Print != $Separated or ($Print = $Separated and count($FormData/PresenceInTheUSGroup) &lt; 10)">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup[9]/BusinessIncomeEarnedAmt"/>
                    </xsl:call-template></xsl:if>
                  </td>
                </tr>
                <xsl:if test="$Print != $Separated">
                  <xsl:for-each select="$FormData/PresenceInTheUSGroup[position() &gt; 9]">
                    <tr>
                      <td style="border:1px solid black;border-left:none;">&nbsp;
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
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="BusinessIncomeEarnedAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr> 
                  </xsl:for-each>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/PresenceInTheUSGroup"/>
            <xsl:with-param name="containerHeight" select="9"/>
            <xsl:with-param name="containerID" select="'line12divctr'"/>
          </xsl:call-template>
          <!-- BEGIN PART IV TITLE -->
          <div class="styBB" style="width:187mm;padding:1mm 0mm;">
            <div class="styPartName" style="font-family:sans-serif;">Part IV</div>
            <div class="styPartDesc">Figure Your Foreign Earned Income Exclusion</div>
          </div>
          <!-- END PART IV TITLE -->
          <!-- Line 13 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">13</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Maximum foreign earned income exclusion
              <span style="letter-spacing:3mm;font-weight:bold;">...................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">13</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">$95,100</div>
            </div>
          </div>
          <!-- Line 14 -->
          <div style="width:187mm;">
            <div style="float:left;width:10mm;padding-top:5mm;">
              <div style="float:left;width:5mm;font-weight:bold;text-align:right;">14</div>
            </div>
            <div style="float:left;height:9mm;width:101mm;">
              <div style="height:4.5mm;"/>
              <div class="styLNDesc" style="width:100mm;">
                Enter the number of days in your qualifying period that fall within 2012<span style="letter-spacing:3mm;font-weight:bold;">..</span>
              </div>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">14</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="float:none;height:4.5mm;width:17mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="float:none;height:4.5mm;width:17mm;position:relative;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnIncmExclQlfyDaysCnt"/>
                </xsl:call-template><b style="margin-right:1mm;"> days</b>
              </div>
            </div>
            <div style="float:left;width:8mm;height:9mm;background-color:lightgrey;border-left:1px solid black;"/>
            <div style="float:left;width:42mm;height:9mm;border-left:1px solid black;"/>
          </div>
          <!-- Line 15 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">15</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Did you enter 366 on line 14?
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
            </div>
          </div>
          <div class="styGenericDiv" style="width:187mm;">
			  <div class="styGenericDiv" style="height:10mm;width:9mm;"/>
			  <div class="styGenericDiv" style="height:10mm;width 90mm">
				  <div class="styGenericDiv" style="height:5mm;width:90mm">
					  <div class="styGenericDiv" style="height:5mm;width:5mm;">
						   <input type="checkbox">
							  <xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnEarnIncExclQlfy366DaysInd"/>
								<xsl:with-param name="BackupName">IRS2555EZFrgnEarnIncExclQlfy366DaysInd</xsl:with-param>
							  </xsl:call-template>
							</input>
						</div>
						<div class="styGenericDiv" style="width:83mm;padding-top:1mm;height:5mm;">
							<label>
							  <xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnEarnIncExclQlfy366DaysInd"/>
							  </xsl:call-template>
							  <b>Yes.</b>
							  </label> 
							  <span style="width:8px"/>Enter "1.000."
						</div>
				   </div>
				   <div class="styGenericDiv" style="height:5mm;width:90mm;">
					   <div class="styGenericDiv" style="height:5mm;width:5mm">
						   <input type="checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
								  <xsl:with-param name="TargetNode" select="$FormData/FrgnEarnIncExclQlfy366DaysInd"/>
								  <xsl:with-param name="BackupName">IRS2555EZFrgnEarnIncExclQlfy366DaysInd</xsl:with-param>
								</xsl:call-template>
							  </input>
						  </div>
						  <div class="styGenericDiv" style="width:5mm;padding-top:1mm;height:5mm;">
							  <label>
								<xsl:call-template name="PopulateLabelNo">
								  <xsl:with-param name="TargetNode" select="$FormData/FrgnEarnIncExclQlfy366DaysInd"/>
								</xsl:call-template>
								<b>No.</b> 
							  </label>
						  </div>
						  <div class="styGenericDiv" style="width:78mm;padding-top:1mm;padding-left:8px;height:5mm;">
							  Divide line 14 by 366 and enter the result as a decimal (rounded to at least three places).
						  </div>
				   </div>
			  </div>
			   <div class="styGenericDiv" style="heigth:10mm;width:10mm">
					  <img src="{$ImagePath}/2555EZ_lg_rt_bracket.gif" alt="left bracket"/>
			   </div>
			   <div class="styGenericDiv" style="height:10mm;padding-top:3.5mm;width:27mm;letter-spacing:3mm;font-weight:bold">......
			   </div>
			   <div class="styGenericDiv" style="height:13.3mm;width:50mm">
				  <div class="styGenericDiv" style="height:13.3mm;width:8mm;font-weight:bold;text-align:center;padding-top:9mm;border-bottom:1px solid black;border-left:1px solid black;">15</div>
				  <div class="styLNAmountBox" style="height:13.3mm;padding-top:9mm;width:42mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedIncExclusionPct"/>
					</xsl:call-template>
				  </div>
            </div>
		   </div>
            
          <!-- Line 16 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">16</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Multiply line 13 by line 15
              <span style="letter-spacing:3mm;font-weight:bold;">........................</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">16</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TentForeignEarnedIncomeExclAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 17 -->
          <div style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">17</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              Enter, in U.S. dollars, the total foreign earned income you earned and received in 2012 (see instructions). Be sure to include this amount on Form 1040, line 7
              <span style="font-weight:bold;letter-spacing:3mm;">...........</span>
            </div>
            <div style="float:left;">
              <div style="height:4.5mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;">17</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;position:relative;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalForeignEarnedIncomeAmt" />
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 18 -->
          <div class="styTBB" style="width:187mm;">
            <div style="float:left;width:5mm;font-weight:bold;text-align:right;">18</div>
            <div style="float:left;width:5mm;font-weight:bold;"/>
            <div class="styLNDesc" style="width:126mm;">
              <b>Foreign earned income exclusion.</b> Enter the <b>smaller</b> of line 16 or line 17 here and in parentheses on <b>Form 1040, line 21.</b> Next to the amount enter "2555-EZ." On Form 1040, subtract this amount from your income to arrive at total income on Form 1040, line 22
              <span style="font-weight:bold;letter-spacing:3mm;">......</span>
              <img src="{$ImagePath}/2106EZ_Bullet.gif" width="9" height="9" alt="Bullet" style="margin:0mm 1mm;"/>
            </div>
            <div style="float:left;">
              <div style="height:7mm;width:8mm;border-left:1px solid black;"/>
              <div style="height:4.5mm;width:8mm;text-align:center;font-weight:bold;border-left:1px solid black;">18</div>
            </div>
            <div style="float:left;">
              <div class="styLNAmountBox" style="height:7mm;width:42mm;border-bottom:none;"/>
              <div class="styLNAmountBox" style="height:4.5mm;width:42mm;border-bottom:none;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignEarnedIncExclusionAmt" />
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;text-align:right;">
            Form <span class="styBoldText" style="font-size:8pt;">2555-EZ</span> (2012)
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
              <xsl:with-param name="Desc">Claiming Foreign Earned Income Waiver</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/@ClaimFrgnEarnIncWaiverCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          
          <xsl:if test="$Print = $Separated and  count($FormData/PresenceInTheUSGroup) &gt; 9">
            <br/>
            <span class="styRepeatingDataTitle">Form 2555-EZ - Part 3, Lines 12a-12d</span>
            <table class="styDepTbl" style="font-size:7pt;border-collapse:collapse;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" style="border:1px solid black;border-left:none;font-weight:normal;width:46mm;"><b style="margin-left:3mm;">12</b> <b style="margin-left:5mm;">(a)</b> Date arrived in U.S.</th>
                  <th scope="col" style="border:1px solid black;font-weight:normal;width:46mm;"><b>(b)</b> Date left U.S.</th>
                  <th scope="col" style="border:1px solid black;font-weight:normal;width:46mm;"><b>(c)</b> Number of days in U.S. on business</th>
                  <th scope="col" style="border:1px solid black;border-right:none;font-weight:normal;width:49mm;"><b>(d)</b> Income earned in U.S. on business (attach computation)</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormData/PresenceInTheUSGroup">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                     </xsl:attribute>
                    <td style="border:1px solid black;border-left:none;">
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
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
