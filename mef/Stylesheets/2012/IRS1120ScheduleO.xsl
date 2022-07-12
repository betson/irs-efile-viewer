<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120ScheduleOStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1120ScheduleO" select="$RtnDoc/IRS1120ScheduleO"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1120ScheduleO)"/>
          </xsl:call-template>
        </title>
        <!--  No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching  -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1120 Schedule O"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
        <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120ScheduleOStyle"/>
            <xsl:call-template name="AddOnStyle"/>
      </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1120ScheduleO">
          <xsl:call-template name="DocumentHeader"/>
          <!-- Header - Form1120SchO Number, Title, and Year -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:20.5mm;border-right-width:2px;">
              <span class="styFormNumber" style="font-size:10pt;">SCHEDULE O<br/>(Form 1120)  
              </span>
              <!-- Form to Form Link (Push Pin plus pen and ink) -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleO"/>
              </xsl:call-template>
              <div style="font-size:7pt">
                 Rev. December 2012
              </div>
              <div style="height:4mm">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <div class="styMainTitle">Consent Plan and Apportionment Schedule<br/>
                             for a Controlled Group</div>
              <div class="styFST" style="font-size:6pt;">
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4"  alt="Bullet"/>Attach to Form 1120, 1120-C, 1120-F, 1120-FSC, 1120-L, 1120-PC, 1120-REIT, or 1120-RIC.<br/>
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" width="4"  alt="Bullet"/>See separate instructions
              </div>
              <div class="styFST" style="height:5mm;font-size:5.6pt;">
                <img src="{$ImagePath}/1120SchN_Bullet_Title.gif" alt="bullet image"/>
                 Information about Schedule O (Form 1120) and its separate instructions is at  
                 <a href="http://www.irs.gov/form1120" title="Link to irs.gov">
                    <i>www.irs.gov/form1120 </i>

            </a>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;border-left-width:2px;height:20.5mm">
              <div class="styOMBNBB" style="padding-top:10mm;">
              OMB No. 1545-0123
               <!--<div class="styTY" style="height:14mm;">2012</div>-->
              </div>
         </div>
          </div>
          <!-- End Header - Form Number, Title, and Year -->
          <!--  Component member Name and Employer identification number -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;">
      Name <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Name/BusinessNameLine1"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Name/BusinessNameLine2"/>
              </xsl:call-template>
            </div>
            <div class="styEINBox" style=" padding-left:2mm;">
              <span class="BoldText">Employer identification number</span>
              <br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/EIN"/>
                </xsl:call-template>
                <xsl:if test="$Form1120ScheduleO/MissingEINReason !=' '">
                  <span style="font-weight:normal;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/MissingEINReason"/>
                    </xsl:call-template>
                  </span>
                </xsl:if>
              </span>
            </div>
          </div>
          <!--  End Component member Name and Employer indentification number  -->
          <!-- Part I - Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
            <span class="styPartName" style="height:1mm;width:12mm;">Part I</span>
            <span style="width:130mm;" class="styPartDesc">
          Apportionment Plan Information
        </span>
          </div>
          <!-- Line 1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">1</div>
            <div class="styLNDesc" style="width:179mm;">Type of controlled group:</div>
          </div>
          <!-- Line 1a Parent-subsidiary group -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:177mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsParentSubsidiaryGroup"/> 
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsParentSubsidiaryGroup"/>
                    <xsl:with-param name="BackupName">IsParentSubsidiaryGroup</xsl:with-param>                    
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsParentSubsidiaryGroup"/>
                  <xsl:with-param name="BackupName">IsParentSubsidiaryGroup</xsl:with-param>               
                </xsl:call-template>
              </label> 
          Parent-subsidiary group
        </div>
          </div>
          <!-- Line 1b Brother-sister group  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsBrotherSisterGroup"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsBrotherSisterGroup"/>
                    <xsl:with-param name="BackupName">IsBrotherSisterGroup</xsl:with-param>               
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsBrotherSisterGroup"/>
                  <xsl:with-param name="BackupName">IsBrotherSisterGroup</xsl:with-param> 
                </xsl:call-template>
              </label>
          Brother-sister group
        </div>
          </div>
          <!-- Line 1c - Combined group -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">c</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsCombinedGroup"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsCombinedGroup"/>
                    <xsl:with-param name="BackupName">IsCombinedGroup</xsl:with-param> 
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsCombinedGroup"/>
                  <xsl:with-param name="BackupName">IsCombinedGroup</xsl:with-param> 
                </xsl:call-template>
              </label>  
          Combined group
        </div>
          </div>
          <!-- Line 1d Life insurance companies -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">d</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsLifeInsuranceCompaniesOnly"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsLifeInsuranceCompaniesOnly"/>
                    <xsl:with-param name="BackupName">IsLifeInsuranceCompaniesOnly</xsl:with-param> 
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IsLifeInsuranceCompaniesOnly"/>
                   <xsl:with-param name="BackupName">IsLifeInsuranceCompaniesOnly</xsl:with-param> 
                </xsl:call-template>
              </label>
          Life insurance companies only
        </div>
          </div>
          <!--blank line -->
          <div style="width:187mm;"/>
          <!-- Line 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">2</div>
            <div class="styLNDesc" style="width:179mm;">
           This corporation has been a member of this group:
        </div>
          </div>
          <!-- Line 2a  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorpMemberForEntireYear"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorpMemberForEntireYear"/>
                     <xsl:with-param name="BackupName">CorpMemberForEntireYear</xsl:with-param> 
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorpMemberForEntireYear"/>
                  <xsl:with-param name="BackupName">CorpMemberForEntireYear</xsl:with-param>
                </xsl:call-template>
              </label>
          For the entire year.
        </div>
          </div>
          <!-- Line 2b -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorpGroupMemberIndicator"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorpGroupMemberIndicator"/>
                    <xsl:with-param name="BackupName">CorpMemberForEntireYear</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorpGroupMemberIndicator"/>
                  <xsl:with-param name="BackupName">CorpMemberForEntireYear</xsl:with-param>
                </xsl:call-template>
              </label>       
            From <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorporationMemberFromDate"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>, until <span style="width:1mm;"/>
              <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorporationMemberToDate"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>.
        </div>
          </div>
          <!--blank line -->
          <div style="width:187mm;"/>
          <!-- Line 3 -->
          <div style="width:187mm;">
                      <div class="styLNLeftNumBox">3</div>
            <div class="styLNDesc" style="width:179mm;">This corporation consents and represents to:</div>
          </div>
          <!-- Line 3a Adopt an apportionment plan. -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AdoptApportionmentPlan"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AdoptApportionmentPlan"/>
                    <xsl:with-param name="BackupName">AdoptApportionmentPlan</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AdoptApportionmentPlan"/>
                 <xsl:with-param name="BackupName">AdoptApportionmentPlan</xsl:with-param>
                </xsl:call-template>
              </label>          
              Adopt an apportionment plan. All the other members of this group are adopting an 
              apportionment plan effective for the current tax<br/>
              <span style="padding-left:4.5mm"/>
              year which ends on
                <span style="width:1mm;"/>
              <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AdoptingApportionmentPlanTYEnd"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>,  and for all succeeding tax years.
        </div>
          </div>
          <!-- Line 3b Amend the current apportionment plan.  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AmendCurrApportionmentPlan"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AmendCurrApportionmentPlan"/>
                    <xsl:with-param name="BackupName">AmendCurrApportionmentPlan</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                              <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AmendCurrApportionmentPlan"/>
                  <xsl:with-param name="BackupName">AmendCurrApportionmentPlan</xsl:with-param>
                </xsl:call-template>
              </label>
         Amend the current apportionment plan. All the other members of this group are currently 
         amending a previously adopted plan, <br/>
              <span style="padding-left:4.5mm"/>
         which was in effect for the tax year ending
         <span style="width:1mm;"/>
              <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AmendingPrevAdoptedPlanTYEnd"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>,  and for all succeeding tax years.
        </div>
          </div>
          <!-- Line 3c - Terminate the current apportionment plan. -->
		  <!-- Define the base ID for TerminateCurrApportionmentPlan -->
		  <xsl:variable name="TerminateCurrApportionmentPlanID">
			  <xsl:call-template name="PopulateID">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
               </xsl:call-template>
		  </xsl:variable>
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">c</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
                    <xsl:with-param name="BackupName">TerminateCurrApportionmentPlan</xsl:with-param>
                  </xsl:call-template>
				  <xsl:attribute name="id">
					  <xsl:choose>
							<xsl:when test="TerminateCurrApportionmentPlanID != ''">
								<xsl:value-of select="concat($TerminateCurrApportionmentPlanID, '[1]')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('IRS1120ScheduleOTerminateCurrApportionmentPlanID', '[1]')"/>
							</xsl:otherwise>
					  </xsl:choose>
				  </xsl:attribute>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
                  <xsl:with-param name="BackupName">TerminateCurrApportionmentPlan</xsl:with-param>
                </xsl:call-template>
				<xsl:attribute name="for">
					  <xsl:choose>
							<xsl:when test="TerminateCurrApportionmentPlanID != ''">
								<xsl:value-of select="concat($TerminateCurrApportionmentPlanID, '[1]')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('IRS1120ScheduleOTerminateCurrApportionmentPlanID', '[1]')"/>
							</xsl:otherwise>
					  </xsl:choose>
				  </xsl:attribute>
              </label>  
          Terminate the current apportionment plan and not adopt a new plan. 
          All the other members of this group are not adopting <br/>
              <span style="padding-left:4mm"/> an apportionment plan.
      </div>
          </div>
          <!-- Line 3d - Terminate the current apportionment plan. -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">d</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
                    <xsl:with-param name="BackupName">TerminateCurrApportionmentPlan</xsl:with-param>
                  </xsl:call-template>
				  <xsl:attribute name="id">
					  <xsl:choose>
							<xsl:when test="TerminateCurrApportionmentPlanID != ''">
								<xsl:value-of select="concat($TerminateCurrApportionmentPlanID, '[2]')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('IRS1120ScheduleOTerminateCurrApportionmentPlanID', '[2]')"/>
							</xsl:otherwise>
					  </xsl:choose>
				  </xsl:attribute>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TerminateCurrApportionmentPlan"/>
                 <xsl:with-param name="BackupName">TerminateCurrApportionmentPlan</xsl:with-param>
                </xsl:call-template>
				<xsl:attribute name="for">
					  <xsl:choose>
							<xsl:when test="TerminateCurrApportionmentPlanID != ''">
								<xsl:value-of select="concat($TerminateCurrApportionmentPlanID, '[2]')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat('IRS1120ScheduleOTerminateCurrApportionmentPlanID', '[2]')"/>
							</xsl:otherwise>
					  </xsl:choose>
				  </xsl:attribute>
              </label>         
          Terminate the current apportionment plan and adopt a new plan.  All the other members of the group are 
          adopting an apportionment <br/>
              <span style="padding-left:5mm"/>plan effective for the current tax year which ends on
            <span style="width:1mm;"/>
              <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
              <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/CorporationMemberToDate"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>,  and for all succeeding tax years.
      </div>
          </div>
          <!--blank line -->
          <div style="width:187mm;"/>
          <!-- Line 4 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">4</div>
            <div class="styLNDesc" style="width:179mm;">
          If you checked box 3c or 3d above, check the applicable box below to indicate if the 
          termination of the current apportionment plan was:
        </div>
          </div>
          <!-- Line 4a   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TermCurrApportionPlanElected"/>
                 </xsl:call-template>                
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TermCurrApportionPlanElected"/>
									  <xsl:with-param name="BackupName">TermCurrApportionPlanElected</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TermCurrApportionPlanElected"/>
									<xsl:with-param name="BackupName">TermCurrApportionPlanElected</xsl:with-param>
                </xsl:call-template>
              </label>
          Elected by the component members of the group.
      </div>
          </div>
          <!-- Line 4b line1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TermCurrApportionPlanRequired"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TermCurrApportionPlanRequired"/>
                    <xsl:with-param name="BackupName">TermCurrApportionPlanRequired</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/TermCurrApportionPlanRequired"/>
                  <xsl:with-param name="BackupName">TermCurrApportionPlanRequired</xsl:with-param>
                </xsl:call-template>
              </label>   
        Required for the component members of the group.
         </div>
          </div>
          <!-- *****************************************************************************************   -->
          <!--blank line -->
          <div style="width:187mm;"/>
          <!-- Line 5 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">5</div>
            <div class="styLNDesc" style="width:179mm;">
          If you did not check a box on line 3 above, check the applicable box below concerning the
           status of the group’s apportionment plan (see instructions).
        </div>
          </div>
          <!-- Line 5a   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/NoApportionmentPlan"/>
                </xsl:call-template>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/NoApportionmentPlan"/>
                    <xsl:with-param name="BackupName">NoApportionmentPlan</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/NoApportionmentPlan"/>
                   <xsl:with-param name="BackupName">NoApportionmentPlan</xsl:with-param>
                </xsl:call-template>
              </label>
            No apportionment plan is in effect and none is being adopted.
      </div>
          </div>
          <!-- Line 5b line1 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ApportionmentPlanInEffect"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ApportionmentPlanInEffect"/>
                     <xsl:with-param name="BackupName">ApportionmentPlanInEffect</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ApportionmentPlanInEffect"/>
                   <xsl:with-param name="BackupName">ApportionmentPlanInEffect</xsl:with-param>
                </xsl:call-template>
              </label>   
          An apportionment plan is already in effect. It was adopted for the tax year ending
         <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ApportionmentPlanAdoptedTYEnd"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>, and for all succeeding tax 
         </div>
          </div>
          <!-- Line 5b line 2   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;padding-left:5mm;">
      	years.
        </div>
          </div>
          <!-- *****************************************************************************************   -->
          <div style="width:187mm;"/>
          <!-- Line 6 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">6</div>
            <div class="styLNDesc" style="width:179mm;">
        	If all the members of this group are adopting a plan or amending the current plan for a tax year after the due date
		(including extensions) of the tax return for this corporation, is there at least one year remaining on the statute of limitations
		from the date this corporation filed its amended return for such tax year for assessing any resulting deficiency? See
		instructions.
	 </div>
          </div>
          <!-- Line 6a  -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Is1YearRemainingOnStatuteOfLmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Is1YearRemainingOnStatuteOfLmt"/>
                     <xsl:with-param name="BackupName">Is1YearRemainingOnStatuteOfLmt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Is1YearRemainingOnStatuteOfLmt"/>
                  <xsl:with-param name="BackupName">Is1YearRemainingOnStatuteOfLmt</xsl:with-param>
                </xsl:call-template>
              </label>          
          Yes. 
         </div>
          </div>
                    <!-- Line 6a(i) -->
          <div style="width:187mm;">
                      <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;padding-left:1mm;">
              <i>(i)</i>
              <span style="width:2.25mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/StatuteLimitationsDtForThisYr"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/StatuteLimitationsDtForThisYr"/>
                    <xsl:with-param name="BackupName">StatuteLimitationsDtForThisYr</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/StatuteLimitationsDtForThisYr"/>
                   <xsl:with-param name="BackupName">StatuteLimitationsDtForThisYr</xsl:with-param>
                </xsl:call-template>
              </label> 
          The statute of limitations for this year will expire on
          <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/StatuteLimitationsExpirationDt"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>.
        </div>
          </div>
          <!-- Line 6a(ii) -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="width:7.25mm;"/>
            <div class="styLNDesc" style="width:179mm;padding-left:1mm;">
              <i>(ii)</i>
              <span style="width:1.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AgrmtToExtendStatuteOfLmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AgrmtToExtendStatuteOfLmt"/>
                     <xsl:with-param name="BackupName">AgrmtToExtendStatuteOfLmt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AgrmtToExtendStatuteOfLmt"/>
                  <xsl:with-param name="BackupName">AgrmtToExtendStatuteOfLmt</xsl:with-param>
                </xsl:call-template>
              </label>  
          On <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/AgrmtDateToExtendStatuteOfLmt"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>, this corporation entered into an agreement with the Internal Revenue Service to extend the statute of 
		<span style="width:9mm;"/>limitations for purposes of assessment until <span style="width:25mm;border-bottom:solid 1px;text-align:center;">
                <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/StatuteLmtPurposesOfAssmntDate"/>
                </xsl:call-template>
              </span>
              <span style="width:1mm;"/>.
        </div>
          </div>
          <!-- Line 6b   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Is1YearRemainingOnStatuteOfLmt"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Is1YearRemainingOnStatuteOfLmt"/>
                    <xsl:with-param name="BackupName">Is1YearRemainingOnStatuteOfLmt</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/Is1YearRemainingOnStatuteOfLmt"/>
                  <xsl:with-param name="BackupName">Is1YearRemainingOnStatuteOfLmt</xsl:with-param>
                </xsl:call-template>
              </label>
          No. The members may not adopt or amend an apportionment plan.
        </div>
          </div>
          <!-- Line 7 -->
          <div style="width:187mm;"/>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">7</div>
            <div class="styLNDesc" style="width:179mm;">
        Required information and elections for component members. Check the applicable box(es) (see instructions).
           </div>
          </div>
          <!-- Line 7a   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">a</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/MaximumTaxRate"/>
                </xsl:call-template>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/MaximumTaxRate"/>
                  <xsl:with-param name="BackupName">MaximumTaxRate</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/MaximumTaxRate"/>
                   <xsl:with-param name="BackupName">MaximumTaxRate</xsl:with-param>
                </xsl:call-template>
              </label>
           The corporation will determine its tax liability by applying the maximum tax rate imposed by  
              section 11 to the entire amount of its   <span style="padding-left:5mm"/>taxable income.
      </div>
          </div>
          <!-- Line 7b   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">b</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/FIFOMethod"/>
                </xsl:call-template>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/FIFOMethod"/>
                     <xsl:with-param name="BackupName">FIFOMethod</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/FIFOMethod"/>
                  <xsl:with-param name="BackupName">FIFOMethod</xsl:with-param>
                </xsl:call-template>
              </label>
         The corporation and the other members of the group elect the FIFO method
          (rather than defaulting to the proportionate method) for<br/>
              <span style="padding-left:4.5mm"/> allocating the additional taxes for the group imposed by section 11(b)(1).
          </div>
          </div>
          <!-- Line 7c   -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="padding-left:4mm;font-size:8.5pt;">c</div>
            <div class="styLNDesc" style="width:179mm;">
              <span style="width:.5mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ShortTaxYearExcludeDec31"/>
                </xsl:call-template>
                <input type="checkbox" alt="alt" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ShortTaxYearExcludeDec31"/>
                     <xsl:with-param name="BackupName">ShortTaxYearExcludeDec31</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/ShortTaxYearExcludeDec31"/>
                  <xsl:with-param name="BackupName">ShortTaxYearExcludeDec31</xsl:with-param>
                </xsl:call-template>
              </label>
         The corporation has a short tax year that does not include December 31.
      </div>
          </div>
          <!--blank line -->
          <div class="styBB" style="width:187mm;border-bottom:2px solid black;"/>
          <!-- Page 1 Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="width:97mm;float:left;">For Paperwork Reduction Act Notice,see Instructions for Form 1120.</div>
            <div style="width:33mm;float:left;">Cat. No. 48100N</div>
            <div class="styBoldText" style="float:right;">Schedule O (Form 1120)(Rev. 12-2012)</div>
           <!-- <div class="styBoldText" style="width:80mm;float:left;">see Instructions for Forms 1120.</div>-->
          </div>
          <!-- Page 2 -->
          <!-- Page 2 Header -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;">Schedule O (Form 1120) (Rev. 12-2012)</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">2</span>
            </div>
          </div>
          <!-- Part 2 - Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
            <span class="styPartName" style="height:1mm;width:12mm;">Part II</span>
            <span style="width:130mm;" class="styPartDesc">
          Taxable Income Apportionment <span style="font-weight: normal;">(See instructions)</span>
            </span>
          </div>
          <!--Caution Line-->
          <div style="width:187mm;">
            <b>Caution: </b>
            <i>Each total in Part II, column (g) for each component member must equal taxable income from Form 1120, page 1, line 30  
             	or the comparable line of such member’s tax return </i>
          </div>
          <div class="styBB" style="width:187mm;">    
            <!--Part II, Taxable Income Portion Table and Toggle Button set begin -->
            <div style="width:7mm;text-align:right;float:right;clear:none;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII"/>
                <xsl:with-param name="containerHeight" select="10"/>
                <xsl:with-param name="header-height" select="3"/>
                <xsl:with-param name="containerID" select=" 'TIPT' "/>
              </xsl:call-template>
            </div>
          </div>
          <!-- BEGIN TIPT TABLE   -->
          <!-- Begin Column table heading A, B, C, D, E, F, G -->
          <div class="styTableContainer" id="TIPT" style="width:187mm;">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style="border-color: black; font-size: 7pt;">
                <tr>
                  <th scope="col" class="styTableCellHeader" style="width:42mm;" rowspan="2" colspan="3">
                    <b>(a)</b>
                    <br/>
                    <span style="font-weight:normal;">Group member's name and employer identification number
                           </span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:20mm;text-align:center;" rowspan="2" colspan="1">
                    <b>(b)</b>
                    <br/>                    
                    <span style="font-weight:normal;">Tax year end<br/>(Yr-Mo)</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:130mm;border-right-width: 0px" rowspan="1" colspan="5">
                    Taxable Income Amount Allocated to Each Bracket</th>
                </tr>
                <tr>
                  <th scope="col" class="styTableCellHeader" style="width: 26mm;">(c)<br/>
                    <span style="font-weight:normal;">15%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 26mm;">(d)<br/>
                    <span style="font-weight:normal;">25%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 26mm; ">(e)<br/>
                    <span style="font-weight:normal;">34%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 26mm;">(f)<br/>
                    <span style="font-weight:normal;">35%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 26mm;border-right-width: 0px;">(g)<br/>Total <span style="font-weight:normal;">(add columns (c) through (f))</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!-- Table Line 1 contain Filers Taxable Income Apportionment-->
                <tr style="height:4mm;">
                  <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                    <span class="styBoldText">1
                    </span>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxYearEnd"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount15"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount25"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount34"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount35"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTotalMemberTxablIncmAmt"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <!--Table repeating row begin -->
                <xsl:for-each select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment">
                  <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &lt;=10)">
                    <tr style="height:4mm;">
                      <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                        <span class="styBoldText">
                          <xsl:number value="position()+1"/>
                        </span>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine1"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine2"/>
                        </xsl:call-template>
                        <br/>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                        <xsl:choose>
                          <xsl:when test="GroupMemberEIN">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EINMissingReason"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TaxYearEnd"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxableIncomeAmount15"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxableIncomeAmount25"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxableIncomeAmount34"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxableIncomeAmount35"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TotalMemberTaxableIncomeAmount"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
               <!-- Table Line 1 contain Filers Taxable Income Apportionment-->
                <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &lt;=10)"/>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1&lt; 2 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">2</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <xsl:if test="((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &gt;10) and ($Print = $Separated))">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 3 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                      <span class="styBoldText">3</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 4 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">4</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 5 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">5</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 6 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">6</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 7 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">7</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 8 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">8</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 9 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">9</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                   </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                   <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &lt; 10 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr style="height:4mm;">
                   <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center; border-right-width:0px;">
                      <span class="styBoldText">10</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: center;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: center;border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
               <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &lt;=10)">
                  <!--Part II Total Line Begin -->
                  <tr style="height:5mm;">
                    <td class="styTableCell" colspan="2" style="border-color: black;width: 27mm; text-align: left;font-size:8pt; ">
                      <span class="styBoldText">Total</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; background-color:gray;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; background-color:gray;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TotalTaxableIncomeAmount15"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;  ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII//TotalTaxableIncomeAmount25"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII//TotalTaxableIncomeAmount34"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII//TotalTaxableIncomeAmount35"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TotalAllTaxableIncomeAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part II Total Line End -->
                <!-- Part II Table repeating blank table total line begin -->
                <xsl:if test="((count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &gt;10) and ($Print = $Separated))">
                  <tr style="height:5mm;">
                    <td class="styTableCell" colspan="2" style="border-color: black;width: 27mm; text-align: left;font-size:8pt; ">
                      <span class="styBoldText">Total</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; background-color:gray;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; background-color:gray;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Part II Table repeating blank total line end -->
              </tbody>
            </table>
          </div>
          <!-- Part II Table initiate Toggle Button Begin -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="header-height" select="3"/>
            <xsl:with-param name="containerID" select=" 'TIPT' "/>
          </xsl:call-template>
          <!--   END Part II TABLE   -->
          <!-- Page 2 Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="width:80mm;float:left;"/>
            <div style="width:25mm;float:left;"/>
            <div class="styBoldText" style="float:right;">Schedule O (Form 1120) (Rev. 12-2012)</div>
          </div>
          <!-- Page 3 -->
          <!-- Page 3 Header -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;">Schedule O (Form 1120) (Rev. 12-2012)</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">3</span>
            </div>
          </div>
          <!-- Part 3 - Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
            <span class="styPartName" style="height:1mm;width:13mm;">Part III</span>
            <span style="width:130mm;" class="styPartDesc">
          Income Tax Apportionment <span style="font-weight: normal;">(See instructions)</span>
            </span>
            <span style="width:5mm;text-align:right;float:right;clear:none">
              <!--Part 3 - Table Toggle Button Set -->
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment"/>
                <xsl:with-param name="containerHeight" select="10"/>
                <xsl:with-param name="headerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'ITA' "/>
              </xsl:call-template>
            </span>
          </div>
          <div class="styTableContainer" id="ITA" style="width:187mm;">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style="border-color: black; font-size: 7pt;">
                <tr>
                  <th scope="col" class="styTableCellHeader" style="width:33mm;" rowspan="2" colspan="2">
                    (a)<br/>
                    <span style="font-weight:normal;">Group member's<br/>name</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:154mm;border-right-width: 0px;" colspan="7">
                    Income Tax Apportionment</th>
                </tr>
               <tr>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(b)<br/>
                    <span style="font-weight:normal;">15%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(c)<br/>
                    <span style="font-weight:normal;">25%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(d)<br/>
                    <span style="font-weight:normal;">34%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm; ">(e)<br/>
                    <span style="font-weight:normal;">35%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(f)<br/>
                    <span style="font-weight:normal;">5%</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(g)<br/>
                    <span style="font-weight:normal;">3%</span>
                 </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;border-right-width: 0px;">(h)<br/>Total income tax<span style="font-weight:normal;"> (combine lines (b) through (g))</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Part III line 1contains Filer info -->
                <tr>
                  <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                    <span class="styBoldText">1
                    </span>
                    <span style="padding-left:1mm;"/>
                  </td>
                 <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                     </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment15"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment25"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment34"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment35"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment5"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment3"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FlrTotMemIncmTaxApportionment"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                 </td>
                </tr>
                <xsl:for-each select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment">
                  <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &lt;=10)">
                    <tr>
                      <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                        <span class="styBoldText">
                          <xsl:number value="position()+1"/>
                        </span>
                        <span style="padding-left:1mm;"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartIII/BusinessNameLine1"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartIII/BusinessNameLine2"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeTaxApportionment15"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeTaxApportionment25"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeTaxApportionment34"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeTaxApportionment35"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeTaxApportionment5"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeTaxApportionment3"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TotalMemIncomeTaxApportionment"/>
                       </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
             <!-- Part III Table Repeating Blank Begin -->
             <!--Part III line 1blank contains Filer info -->
                <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &lt;=10)"/>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 2 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">2</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <xsl:if test="((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &gt;6) and ($Print = $Separated))">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 3 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">3</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                   </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 4 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">4</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                     <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 5 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">5</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 6 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">6</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 7 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">7</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 8 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                 <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">8</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                   </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                     <span class="styTableCellPad"/>
                    </td>
                  </tr>
               </xsl:if>
               <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 9 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">9</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                 </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &lt; 10 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">10</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                   <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part III Total Line Begin -->
                <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &lt;=10)">
                 <tr>
                    <td class="styTableCell" colspan="2" style="width: 33mm; text-align: left; border-color: black; font-size:8pt;">
                     <span class="styBoldText">Total</span>
                      <span style="padding-left:1mm;"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment15"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment25"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment34"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment35"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment5"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment3"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalAllIncomeTaxApportionment"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part III Total Line End -->
                <!-- Part III Table repeating blank total line begin -->
                <xsl:if test="((count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &gt;10) and ($Print = $Separated))">
                 <tr>
                    <td class="styTableCell" colspan="2" style="width: 33mm; text-align: left; border-color: black; font-size:8pt;">
                      <span class="styBoldText">Total</span>
                      <span style="padding-left:1mm;"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                     <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <span class="styTableCellPad"/>
                    </td>
                   <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Part III Table repeating blank total line end -->
              </tbody>
            </table>
          </div>
          <!-- Part III Table initiate Toggle Button Begin -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
           <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment"/>
           <xsl:with-param name="containerHeight" select="10"/>
           <xsl:with-param name="header-height" select="3"/>
           <xsl:with-param name="containerID" select=" 'ITA' "/>
          </xsl:call-template>
          <!--   END Part III TABLE   -->
          <!-- Page 3 Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="width:80mm;float:left;"/>
            <div style="width:25mm;float:left;"/>
            <div class="styBoldText" style="float:right;">Schedule O (Form 1120) (Rev. 12-2012)</div>
         </div>
          <!-- Page 4 -->
          <!-- Page 4 Header -->
          <div class="styBB" style="width:187mm;">
            <div style="float:left;">Schedule O (Form 1120) (Rev. 12-2012)</div>
            <div style="float:right;">Page <span style="font-size:9pt;font-weight:bold;">4</span>
            </div>
         </div>
          <!-- Part 4 - Header -->
          <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:1px;
          border-right-width:0px;border-left-width:0px;float:left;">
            <span class="styPartName" style="height:1mm;width:12mm;">Part IV</span>
            <span style="width:130mm;" class="styPartDesc">
          Other Apportionments<span style="font-weight: normal;"> (See instructions)</span>
            </span>
            <span style="width:5mm;text-align:right;float:right;clear:none">
              <!-- Part 4 - Table Toggle Button Set -->
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments"/>
                <xsl:with-param name="containerHeight" select="10"/>
                <xsl:with-param name="headerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'OA' "/>
              </xsl:call-template>
            </span>
          </div>
          <div class="styTableContainer" id="OA" style="width:187mm;">
            <!--print logic-->
            <xsl:call-template name="SetInitialState"/>
            <!--end-->
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style="border-color: black; font-size: 7pt;">
                <tr>
                  <th scope="col" class="styTableCellHeader" style="width:38mm;" rowspan="2" colspan="2">
                    (a)<br/>
                    <span style="font-weight:normal;">Group member's name</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width:149mm;border-right-width: 0px" colspan="7">
                   Other Apportionments</th>
                </tr>
                <tr>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(b)<br/>
                    <span style="font-weight:normal;">Accumulated earnings credit<!--<span class="styNormalText">(Section 535(c)(2),(3))</span>-->
                    </span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(c)<br/>
                    <span style="font-weight:normal;">AMT exemption amount<!--<span class="styNormalText">(Section 55(d)(2))</span>-->
                    </span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm;">(d)<br/>
                    <span style="font-weight:normal;">Phaseout of AMT exemption amount</span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 22mm; ">(e)<br/>
                    <span style="font-weight:normal;">Penalty for failure to pay estimated tax<!--<span class="styNormalText">(Section 6655(g)(2)(B)(ii))</span>-->
                    </span>
                  </th>
                  <th scope="col" class="styTableCellHeader" style="width: 61mm;border-right-width: 0px;">(f)<br/>
                    <span style="font-weight:normal;">Other</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Part IV Line 1 contains Filer info -->
                <tr>
                  <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                    <span class="styBoldText">1
                    </span>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersAccumulatedEarningsCr"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                 <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersAMTExemption"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersPhaseoutOfAMTExemptAmt"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                 </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersPnltyFailureToPayEstTax"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                    <span style="float:left;">
                     <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersOtherAmountDescription"/>
                      </xsl:call-template>
                    </span>
                    <br/>
                    <span style="float:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersOtherAmount"/>
                      </xsl:call-template>
                    </span>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <xsl:for-each select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments">
                  <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &lt;=10)">
                    <tr>
                      <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                        <span class="styBoldText">
                          <xsl:number value="position()+1"/>
                        </span>
                       <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartIV/BusinessNameLine1"/>
                        </xsl:call-template>
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="GroupMemberNamePartIV/BusinessNameLine2"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AccumulatedEarningsCredit"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AMTExemption"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="PhaseoutOfAMTExemptionAmount"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="PenaltyFailureToPayEstTax"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                        <span style="float:left;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="OtherAmountDescription"/>
                          </xsl:call-template>
                        </span>
                        <br/>
                        <span style="float:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="OtherAmount"/>
                          </xsl:call-template>
                        </span>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <!-- Part IV Table Repeating Blank Begin -->
                 <!--Part IV Line 1 contains Filer info -->
             
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 2 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">2</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <xsl:if test="((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &gt;10) and ($Print = $Separated))">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 3 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">3</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 4 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">4</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 5 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">5</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 6 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">6</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                   </td>
                   <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 7 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">7</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 8 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">8</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 9 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">9</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test="count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &lt; 10 or ((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments)+1 &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">10</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part IV Total Line Begin -->
                <xsl:if test="($Print != $Separated) or (count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &lt;=10)">
                 <tr>
                    <td class="styTableCell" colspan="2" style="border-color: black; width:38mm;text-align: left; font-size:8pt;">
                      <span class="styBoldText">Total</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotalAccumulatedEarningsCredit"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                     <xsl:call-template name="PopulateAmount">
                       <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotalAMTExemption"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotPhaseoutAMTExemptionAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotPenaltyFailureToPayEstTax"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotalOtherAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part IV Total Line End -->
                <!--Part IV Repeating Blank Total Line Begin -->
                <xsl:if test="((count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &gt;10) and ($Print = $Separated))">
                  <tr>
                    <td class="styTableCell" colspan="2" style="border-color: black; width:38mm;text-align: left; font-size:8pt;">
                      <span class="styBoldText">Total</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!--Part IV Repeating Blank Total Line End -->
              </tbody>
            </table>
          </div>
          <!-- Table initiate Toggle Button Begin -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments"/>
            <xsl:with-param name="containerHeight" select="10"/>
            <xsl:with-param name="headerHeight" select="3"/>
            <xsl:with-param name="containerID" select=" 'OA' "/>
          </xsl:call-template>
          <!--   END Part IV TABLE   -->
          <!-- Page 4 Footer -->
          <div class="pageEnd" style="width:187mm;">
            <div class="styBoldText" style="width:110mm;float:left;"/>
            <div class="styBoldText" style="float:right;">Schedule O (Form 1120) (Rev. 12-2012)</div>
          </div>
          <!-- Left Over Data Table -->
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
              <xsl:with-param name="TargetNode" select="$Form1120ScheduleO"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          <!-- Separated Data for Part II -->
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &gt; 10)">
            <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:0px;
          border-right-width:0px;border-left-width:0px;float:left;">
              <span class="styPartName" style="height:1mm;width:12mm;">Part II</span>
              <span style="width:130mm;" class="styPartDesc">
          Taxable Income Apportionment <span style="font-weight: normal;">(See instructions)</span>
              </span>
            </div>
          </xsl:if>
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &gt; 10)">
            <br/>
            <table class="styDepTbl" style="font-size:6pt;" cellspacing="0">
              <!-- Label the Column Headers -->
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width:42mm;" rowspan="2" colspan="3">
                    <b>(a)</b>
                    <br/>
                    <span style="font-weight:normal;">Group member's name and employer identification number</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width:15mm;" rowspan="2" colspan="1">
                    <b>(b)</b>
                    <br/>
                    <span style="font-weight:normal;">Tax year end<br/>(Yr-Mo)</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width:130mm;border-right-width: 0px" rowspan="1" colspan="5">
                    Taxable Income Amount Allocated to Each Bracket</th>
                </tr>
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width: 26mm;">(c)<br/>
                    <span style="font-weight:normal;">15%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 26mm;">(d)<br/>
                    <span style="font-weight:normal;">25%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 26mm; ">(e)<br/>
                    <span style="font-weight:normal;">34%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 26mm;">(f)<br/>
                    <span style="font-weight:normal;">35%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 26mm;border-right-width: 0px;">(g)<br/>Total <span class="styNormalText">(add columns (c) through (f))</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!-- Table Line 1 contain Filers Taxable Income Apportionment-->
                <tr style="height:4mm;">
                  <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                    <span class="styBoldText">1
                    </span>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
                    <xsl:call-template name="PopulateMonthDayYear">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxYearEnd"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount15"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount25"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount34"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTaxableIncomeAmount35"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/FilersTxblIncmApportionment/FilersTotalMemberTxablIncmAmt"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <xsl:for-each select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment">
                  <tr style="font-size: 6pt;border-color:black;">
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <!-- Second Row -->
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm;text-align:center;border-right-width:0px;">
                      <span class="styBoldText">
                        <xsl:number value="position()+1"/>
                      </span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 23mm; text-align: left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartII/BusinessNameLine2"/>
                      </xsl:call-template>
                      <br/>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;width: 15mm; text-align: left;">
                      <xsl:if test="GroupMemberEIN!=' '">
                        <span style="font-weight:normal;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="GroupMemberEIN"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>
                      <xsl:if test="GroupMemberEIN/EINMissingReason!=' '">
                        <span style="font-weight:normal;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="GroupMemberEIN/EINMissingReason"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm;text-align:center; ">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="TaxYearEnd"/>
                      </xsl:call-template>
                     <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TaxableIncomeAmount15"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TaxableIncomeAmount25"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TaxableIncomeAmount34"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TaxableIncomeAmount35"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right;border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalMemberTaxableIncomeAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <!--Separated Data for Part II Total Line Begin -->
                <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartII/TxblIncmApportionment) &gt; 10)">
                  <tr style="height:5mm;">
                    <td class="styTableCell" colspan="2" style="border-color: black;width: 27mm; text-align: left;font-size:8pt; ">
                      <span class="styBoldText">Total</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; background-color:gray;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 15mm; background-color:gray;  ">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm;  text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TotalTaxableIncomeAmount15"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;  ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII//TotalTaxableIncomeAmount25"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII//TotalTaxableIncomeAmount34"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 26mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII//TotalTaxableIncomeAmount35"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 26mm; text-align: right; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartII/TotalAllTaxableIncomeAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!--Part II Total Line End -->
                </xsl:if>
              </tbody>
            </table>
          </xsl:if>
          <br/>
          <!--Separated Data for Part II  -->
          <!--  <br class="pageEnd"/>-->
          <!-- Separated Data for Part III -->
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &gt; 10)">
            <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
              <span class="styPartName" style="height:1mm;width:13mm;">Part III</span>
              <span style="width:130mm;" class="styPartDesc">
         		 Income Tax Apportionment <span style="font-weight: normal;">(See instructions)</span>
              </span>
            </div>
          </xsl:if>
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &gt; 10)">
            <br/>
            <table class="styDepTbl" style="font-size:6pt;" cellspacing="0">
              <!-- Label the Column Headers -->
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width:33mm;" rowspan="2" colspan="2">
                    (a)<br/>
                    <span style="font-weight:normal;">Group member's<br/>name</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width:154mm;border-right-width: 0px" colspan="7">
                    Income Tax Apportionment</th>
                </tr>
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(b)<br/>
                    <span style="font-weight:normal;">15%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(c)<br/>
                    <span style="font-weight:normal;">25%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(d)<br/>
                    <span style="font-weight:normal;">34%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm; ">(e)<br/>
                    <span style="font-weight:normal;">35%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(f)<br/>
                    <span style="font-weight:normal;">5%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(g)<br/>
                    <span style="font-weight:normal;">3%</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;border-right-width: 0px;">(h)<br/>Total Income Tax <span class="styNormalText">(combine lines (b) through (g))</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Part III line 1contains Filer info -->
                <tr>
                  <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                    <span class="styBoldText">1
						<!--<xsl:number value="position()"/>-->
                    </span>
                    <span style="padding-left:1mm;"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment15"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment25"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment34"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment35"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment5"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FilersIncomeTaxApportionment3"/>
                   </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/FilersIncmTaxApportionment/FlrTotMemIncmTaxApportionment"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <xsl:for-each select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment">
                  <tr style="font-size: 6pt;border-color:black;">
                    <!-- Define background colors to the rows -->
                   <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <!-- Second Row -->
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center; border-right-width:0px;">
                      <span class="styBoldText">
                        <xsl:number value="position()+1"/>
                      </span>
                      <span style="padding-left:1mm;"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 29mm; text-align: left; ">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartIII/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartIII/BusinessNameLine2"/>
                      </xsl:call-template>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="IncomeTaxApportionment15"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="IncomeTaxApportionment25"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="IncomeTaxApportionment34"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="IncomeTaxApportionment35"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="IncomeTaxApportionment5"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="IncomeTaxApportionment3"/>
                     </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalMemIncomeTaxApportionment"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <!--Separated Data for Part III Total Line Begin -->
                <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartIII/IncmTaxApportionment) &gt; 10)">
                  <tr>
                    <td class="styTableCell" colspan="2" style="width: 33mm; text-align: left; border-color: black; font-size:8pt;">
                      <span class="styBoldText">Total</span>
                      <span style="padding-left:1mm;"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment15"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment25"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment34"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment35"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align:  right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment5"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalIncomeTaxApportionment3"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIII/TotalAllIncomeTaxApportionment"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!--Part III Total Line End -->
                </xsl:if>
              </tbody>
            </table>
          </xsl:if>
          <br/>
          <!-- Separated Data for Part III -->
         <!-- Separated Data for Part IV -->
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &gt; 10)">
            <div class="styBB" style="width:187mm;border-bottom-width:1px;border-top-width:0px; border-right-width:0px;border-left-width:0px;float:left;">
              <span class="styPartName" style="height:1mm;width:12mm;">Part IV</span>
              <span style="width:130mm;" class="styPartDesc">
          		Other Apportionments<span style="font-weight: normal;">(See instructions)</span>
              </span>
            </div>
          </xsl:if>
          <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &gt; 10)">
            <br/>
            <table class="styDepTbl" style="font-size:6pt;" cellspacing="0">
              <!-- Label the Column Headers -->
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width:38mm;" rowspan="2" colspan="2">
                    (a)<br/>
                    <span style="font-weight:normal;">Group member's name</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width:149mm;border-right-width: 0px" colspan="7">
                    Other Apportionments</th>
                </tr>
                <tr class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(b)<br/>
                    <span style="font-weight:normal;">Accumulated earnings credit<!--<span class="styNormalText">(Section 535(c)(2),(3))</span>-->
                    </span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(c)<br/>
                    <span style="font-weight:normal;">AMT exemption amount <!--<span class="styNormalText">(Section 55(d)(2))</span>-->
                    </span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm; ">(d)<br/>
                    <span style="font-weight:normal;">Phaseout of AMT exemption amount</span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 22mm;">(e)<br/>
                    <span style="font-weight:normal;">Penalty for failure to pay estimated tax <!--<span class="styNormalText">(Section 6655(g)(2)(B)(ii))</span>-->
                    </span>
                  </th>
                  <th scope="col" class="styDepTblCell" style="width: 61mm;border-right-width: 0px;">(f)<br/>
                    <span style="font-weight:normal;">Other</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <!--Part IV Line 1 contains Filer info -->
                <tr>
                  <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                    <span class="styBoldText">1
                    </span>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersAccumulatedEarningsCr"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersAMTExemption"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersPhaseoutOfAMTExemptAmt"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersPnltyFailureToPayEstTax"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                    <span style="float:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersOtherAmountDescription"/>
                      </xsl:call-template>
                    </span>
                    <br/>
                    <span style="float:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/FilersOtherApportionments/FilersOtherAmount"/>
                      </xsl:call-template>
                    </span>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <xsl:for-each select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments">
                  <tr style="font-size: 6pt;border-color:black;">
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <!-- Second Row -->
                    <td class="styTableCell" valign="top" style="border-color: black; width: 4mm; text-align: center;border-right-width: 0px;">
                      <span class="styBoldText">
                        <xsl:number value="position()+1"/>
                      </span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width:34mm;text-align: left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartIV/BusinessNameLine1"/>
                      </xsl:call-template>
                      <br/>
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="GroupMemberNamePartIV/BusinessNameLine2"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                   </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="AccumulatedEarningsCredit"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="AMTExemption"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="PhaseoutOfAMTExemptionAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;  ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="PenaltyFailureToPayEstTax"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <span style="float:left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="OtherAmountDescription"/>
                        </xsl:call-template>
                      </span>
                      <span style="float:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="OtherAmount"/>
                       </xsl:call-template>
                      </span>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <!--Separated Data for Part IV Total Line Begin -->
                <xsl:if test="($Print = $Separated) and  (count($Form1120ScheduleO/IRS1120ScheduleOPartIV/OtherApportionments) &gt; 10)">
                  <tr>
                    <td class="styTableCell" colspan="2" style="border-color: black; width:38mm;text-align: left; font-size:8pt;">
                      <span class="styBoldText">Total</span>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotalAccumulatedEarningsCredit"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm;  text-align: right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotalAMTExemption"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black;  width: 22mm; text-align: right;;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotPhaseoutAMTExemptionAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 22mm; text-align: right; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotPenaltyFailureToPayEstTax"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styTableCell" style="border-color: black; width: 61mm; border-right-width: 0px; ">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form1120ScheduleO/IRS1120ScheduleOPartIV/TotalOtherAmount"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                  <!--Part IV Total Line End -->
                </xsl:if>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

