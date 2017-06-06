<?xml version="1.0" encoding="UTF-8"?>
<!-- This stylesheet was Created and last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
<!-- This stylesheet was modified on 7/08/2009 for TY2009/PY2010 changes by S. Cram-->
<!-- This stylesheet was modified on 8/31/2009 for TY2009/PY2010 BSP-091865OTH changes by Sandy Cram-->
<!-- Last modified on 10/28/2009 by Sandy Cram  Updates made per BSP-092774OTH -->
<!-- Last modified on 08/10/2010 by Robert Jones  Updates made per BSP-101319OTH -->
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Updated 01/21/2012 per UWR 52085 by Robert L Jones -->
<!-- Updated 02/02/2012 per IBM Defect #30326 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990ScheduleJStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleJ"/>
	<xsl:template match="/">
		<html>
			<head>
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
				<meta name="Description" content="IRS Form 990 Schedule J"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990ScheduleJStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form990ScheduleJ">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:28mm;height:20mm;">
							<div style="padding-top:1mm;font-weight:bold;font:8pt">
								<span style="font-size:10pt;font-weight:bold;font-familiy:'Arial Narrow';">Schedule J</span>
								<br/>
								<span style="font-size:8pt;font-weight:bold;font-family:'Arial ';">(Form 990)</span>
								<br/>
								<!--<xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template> -->
							</div>
							<div style="padding-top:7mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;">
							<div class="styMainTitle" style="padding-top:0mm">Compensation Information</div>
							
							<div class="styFBT" style="padding-top:0mm">
          For certain Officers, Directors, Trustees, Key Employees, and Highest<br/>
		Compensated Employees<br/>
					<img src="{$ImagePath}/990SchJ_Bullet_Md.gif" alt="SchJMediumBullet"/>
					Complete if the organization answered "Yes" to Form 990, <br/>Part IV, question 23.<br/>
					<img src="{$ImagePath}/990SchJ_Bullet_Md.gif" alt="SchJMediumBullet"/>
		Attach to Form 990. 
		<img src="{$ImagePath}/990SchJ_Bullet_Md.gif" alt="SchJMediumBullet"/>
		See separate instructions.
          </div>
						</div>
						<div class="styTYBox" style="width:30mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">11</span>
							</div>
							<div class="styPartName" style="height:8mm; width:30.5mm;padding-top:0.3mm">Open to Public Inspection</div>
						</div>
					</div>
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:134mm;height:8mm;padding-left:2mm">
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
					<!-- Part I -->
					<!-- Part I-->
					<div class="styBB" style="width:187mm;float:none;border-top-width:1px">
						<div class="styPartName" style="float:left;width:14mm;">Part I</div>
						<div class="styPartDesc" style="width:172mm;">Questions Regarding Compensation
      </div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: mm;padding-top:.5mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm"/>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;border-bottom-width:1px;border-left-width:0px"/>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;border-top-width:1px;padding-top:.5mm;border-left-width:1px;border-top-width:0px">Yes</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;border-top-width:1px;padding-top:.5mm;border-left-width:1px;border-top-width:0px">No</div>
					</div>
					<!-- Line 1 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:.5mm">1a</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Check the appropiate box(es) if the organization provided any of the following to or for a person listed in Form<br/>990, Part VII, Section A, line 1a. Complete Part III to provide any relevant information regarding these items.</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/FirstClassOrCharterTravel"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FirstClassOrCharterTravel"/>
											<xsl:with-param name="BackupName">Form990ScheduleJFirstClassOrCharterTravel</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/FirstClassOrCharterTravel"/>
									</xsl:call-template>            
       First-class or charter travel </label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/HousingAllowanceOrResidence"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/HousingAllowanceOrResidence"/>
										<xsl:with-param name="BackupName">Form990ScheduleJHousingAllowanceOrResidence</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/HousingAllowanceOrResidence"/>
									</xsl:call-template>            
      Housing allowance or residence for personal use 
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TravelForCompanions"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TravelForCompanions"/>
											<xsl:with-param name="BackupName">Form990ScheduleJTravelForCompanions</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TravelForCompanions"/>
									</xsl:call-template>            
       Travel for companions
      </label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/PaymentsForUseOfResidence"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentsForUseOfResidence"/>
										<xsl:with-param name="BackupName">Form990ScheduleJPaymentForUseOfResidence</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PaymentsForUseOfResidence"/>
									</xsl:call-template>            
      Payments for business use of personal residence
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/IdemnificationGrossUpPayments"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IdemnificationGrossUpPayments"/>
											<xsl:with-param name="BackupName">Form990ScheduleJIdemnificationGrossUpPayments</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IdemnificationGrossUpPayments"/>
									</xsl:call-template>            
      Tax idemnification and gross-up payments
       </label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/ClubDuesOrFees"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ClubDuesOrFees"/>
										<xsl:with-param name="BackupName">Form990ScheduleJClubDuesOrFees</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ClubDuesOrFees"/>
									</xsl:call-template>            
     Health or social club dues or initiation fees
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DiscretionarySpendingAccount"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DiscretionarySpendingAccount"/>
											<xsl:with-param name="BackupName">Form990ScheduleJDiscretionarySpendingAccount</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/DiscretionarySpendingAccount"/>
									</xsl:call-template>            
      Discretionary spending account
       </label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/PersonalServices"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PersonalServices"/>
										<xsl:with-param name="BackupName">Form990ScheduleJPersonalServices</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PersonalServices"/>
									</xsl:call-template>            
     Personal services (e.g., maid, chauffeur, chef)
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">b</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
 If any of the boxes in line 1a are checked, did the organization follow a written policy regarding payment or reimbursement or provision of all the expenses described above? If "No," complete Part III to explain<span class="styIRS990ScheduleJDotSpacing">....</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">1b</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;padding-top:.5mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyReTAndEExpenses"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;padding-top:.5mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/WrittenPolicyReTAndEExpenses"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm">2</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
Did the organization require substantiation prior to reimbursing or allowing expenses incurred by all<br/>officers, directors, trustees, and the CEO/Executive Director, regarding the items checked in line 1a?
<span class="styIRS990ScheduleJDotSpacing">....</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:8mm;padding-top:4mm">2</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SubstantiationRequired"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SubstantiationRequired"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:1mm">3</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:1mm">
Indicate which, if any, of the following the organization uses to establish the compensation of the <br/>organization's CEO/Executive Director. Check all that apply. Do not check any boxes for methods <br/>used by a related organization to establish compensation of the CEO/Executive Director, but explain in Part III.</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:12mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:12mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:12mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CompensationCommittee"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompensationCommittee"/>
											<xsl:with-param name="BackupName">Form990ScheduleJCompensationCommittee</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CompensationCommittee"/>
									</xsl:call-template>            
      Compensation committee</label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/WrittenEmploymentContract"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/WrittenEmploymentContract"/>
										<xsl:with-param name="BackupName">Form990ScheduleJWrittenEmploymentContract</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/WrittenEmploymentContract"/>
									</xsl:call-template>            
      Written employment contract
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/IndependentConsultant"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndependentConsultant"/>
											<xsl:with-param name="BackupName">Form990ScheduleJIndependentConsultant</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndependentConsultant"/>
									</xsl:call-template>            
      Independent compensation consultant
      </label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CompensationSurvey"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CompensationSurvey"/>
										<xsl:with-param name="BackupName">Form990ScheduleJCompensationSurvey</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CompensationSurvey"/>
									</xsl:call-template>            
     Compensation survey or study
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
							<span style="width:70mm;">
								<span style="padding-top:0mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/Form990OfOtherOrganizations"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" onclick="return false;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990OfOtherOrganizations"/>
											<xsl:with-param name="BackupName">Form990ScheduleJOfOtherOrganizations</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label style="padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form990OfOtherOrganizations"/>
									</xsl:call-template>            
     Form 990 of other organizations
       </label>
							</span>
							<span style="width:80mm;padding-left:4mm">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/BoardOrCommitteeApproval"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BoardOrCommitteeApproval"/>
										<xsl:with-param name="BackupName">Form990ScheduleJBoardOrCommitteeApproval</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-top:0mm;padding-left:2mm">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BoardOrCommitteeApproval"/>
									</xsl:call-template>            
     Approval by the board or compensation committee
      </label>
							</span>
						</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm">4</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
During the year, did any person listed in Form 990, Part VII, Section A, line 1a with respect to the filing organization or a related organization:</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<!-- Line 4 a -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">a</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Receive a severance payment or change-of-control payment?
<span class="styIRS990ScheduleJDotSpacing">...............</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">4a</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SeverancePayment"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SeverancePayment"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">b</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Participate in, or receive payment from, a supplemental nonqualified retirement plan?
<span class="styIRS990ScheduleJDotSpacing">........</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">4b</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementalNonqualRetirePlan"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementalNonqualRetirePlan"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">c</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Participate in, or receive payment from, an equity-based compensation arrangement?
<span class="styIRS990ScheduleJDotSpacing">........</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">4c</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/EquityBasedCompArrangement"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/EquityBasedCompArrangement"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm;">
If "Yes" to any of lines 4a-c, list the persons and provide the applicable amounts for each item in Part III.</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm;font-weight:bold">
Only 501(c)(3) and 501(c)(4) organizations only must complete lines 5-9.</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<!-- Line 5 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm">5</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
For persons listed in form 990, Part VII, Section A, line 1a, did the organization pay or accrue any<br/>compensation contingent on the revenues of:</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<!-- Line 5a  -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">a</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
The organization?
<span class="styIRS990ScheduleJDotSpacing">...........................</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">5a</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedOnRevenueOfFilingOrg"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedOnRevenueOfFilingOrg"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b  -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">b</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Any related organization?
<span class="styIRS990ScheduleJDotSpacing">.........................</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">5b</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedOnRevenueRelatedOrgs"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedOnRevenueRelatedOrgs"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:0mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm;">
If "Yes," to line 5a or 5b, describe in Part III.</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<!-- Line 6 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:0mm">6</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:0mm">
For persons listed in form 990, Part VII, Section A, line 1a, did the organization pay or accrue any<br/>compensation contingent on the net earnings of:</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:8mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<!-- Line 6a  -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">a</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
The organization?
<span class="styIRS990ScheduleJDotSpacing">...........................</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">6a</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedNetEarningsFilingOrg"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedNetEarningsFilingOrg"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6b  -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm">b</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Any related organization?
<span class="styIRS990ScheduleJDotSpacing">.........................</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:4mm;">6b</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedNetEarningsRelateOrgs"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CompBasedNetEarningsRelateOrgs"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 3mm;padding-top:.5mm"/>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm;">
If "Yes," to line 6a or 6b, describe in Part III.</div>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4.5mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4.5mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="styIRS990ScheduleJShadingCellSmall" style="width:8mm;height:4.5mm;border-top-width:0px;padding-top:0mm;"/>
					</div>
					<!-- Line 7 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:.5mm">7</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
For persons listed in Form 990, Part VII, Section A, line 1a, did the organization provide any non-fixed<br/>payments not described in lines 5 and 6? If "Yes," describe in Part III
<span class="styIRS990ScheduleJDotSpacing">............</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:8mm;padding-top:4mm">7</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AnyNonFixedPayments"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AnyNonFixedPayments"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:.5mm">8</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
Were any amounts reported in Form 990, Part VII, paid or accured pursuant to a contract that was<br/>subject to the initial contract exception described in Regulations section 53.4958-4(a)(3)? If "Yes," describe <br/>in Part III
<span class="styIRS990ScheduleJDotSpacing">.............................</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:12mm;padding-top:8mm;border-bottom-width:1px">8</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:12mm;padding-top:8mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/InitialContractException"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:12mm;padding-top:8mm;border-bottom-width:1px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/InitialContractException"/>
							</xsl:call-template>
						</div>
					</div>
					<div style=" width: 187mm; ">
						<div class="styLNLeftNumBox" style="padding-left: 1mm;padding-top:.5mm">9</div>
						<div class="styLNDesc" style="width:155mm;border-right-width:0;padding-top:.5mm">
If "Yes" to line 8, did the organization also follow the rebuttable presumption procedure described in Regulations section 53.4958-6(c)?
<span class="styIRS990ScheduleJDotSpacing">.........................</span>
						</div>
						<div class="styIRS990ScheduleJLineIndexMid" style="width:8mm;height:8mm;padding-top:4mm">9</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RebuttablePresumptionProcedure"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleJLNYesNoBox" style="width:8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RebuttablePresumptionProcedure"/>
							</xsl:call-template>
						</div>
					</div>
<!-- Footer -->
					<!-- Footer -->
					<div style="width:187mm;float:none;clear:both;border-top:solid 1px" class="pageend">
						<div class="styGenericDiv" style="width:122mm;font-weight:bold">For Privacy Act and Paperwork Reduction Act Notice, see the Intructions for Form 990 </div>
						<div class="styGenericDiv" style="width:25mm;">Cat. No. 50053T</div>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText">Schedule J (Form 990) 2011</span>
						</div>
					</div>
					<br/>
					<!-- header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;border-bottom-width:0px" class="styBB">
						<div style="width:90mm;" class="styGenericDiv">Schedule J (Form 990) 2011</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!--   BEGIN Part II   -->
					<div class="styBB" style="width: 256mm;border-top-width:1px;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:226mm;">Officers, Directors, Trustees, Key Employees, and Highest Compensated Employees.
       <span style="font-weight:normal;"> Use duplicate copies if additional space is needed.
  </span>
						</div>
						<div class="IRS990ScheduleJLineDesc" style="width:256mm;border-top-width:1px;border-right-width:0px;padding-top:2mm">
 For each individual whose compensation must be reported in Schedule J, report compensation from the organization on row (i) and from related organizations, described in the <br/> instructions on row (ii). Do not list any individuals that are not listed on Form 990, Part VII.<br/>
							<br/>
							<span style="font-weight:bold">Note.</span> The sum of columns (B)(i)-(iii) for each listed individual must equal the total amount of Form 990, Part VII, Section A, line 1a, applicable column (D) and column (E) for that individual.  
<!--==============================Part II Table ======================================-->
							<xsl:variable name="table2RowCount" select="count($FormData/Form990ScheduleJPartII)"/>
							<span style="float:right; clear: none;">
								<xsl:call-template name="SetDynamicTableToggleRowCount">
									<xsl:with-param name="DataRowCount" select="$table2RowCount"/>
									<xsl:with-param name="containerHeight" select="16"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'p2TbCtnr' "/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Part II table -->
					<div class="styTableContainerLandscape" id="p2TbCtnr">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<!--<div style="width: 256mm;">-->
								<tr>
									<th class="styTableCellHeader " style="width:50mm;font-size: 7pt; height: 4mm; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;border-right-width:0mm" rowspan="2" scope="col">
										<b>(A)</b> Name</th>
									<th class="styTableCellHeader " style="width:4mm; height: 4mm; border-top-width:1px;padding-top:0mm;font-weight:normal;vertical-align:top;border-right-width:1px;" rowspan="2" scope="col">
										<span style="border-bottom-width:1px"/>
									</th>
									<th class="styTableCellHeader " style=" height:4mm; width:90mm;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;" colspan="3" scope="col">
										<b>(B)</b> Breakdown of W-2 and/or 1099-MISC compensation
</th>
									<th class="styTableCellHeader " style="border-top-width:1px;height:4mm;  font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(C)</b> Retirement and other deferred compensation </th>
									<th class="styTableCellHeader " style="border-top-width:1px;height: 4mm;padding-top: 1mm; font-size: 7pt;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(D)</b> Nontaxable <br/>benefits</th>
									<th class="styTableCellHeader " style="border-top-width:1px;height:4mm; padding-top: 1mm;  font-size: 7pt;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(E)</b> Total of columns<br/>(B)(i)-(D) </th>
									<th class="styTableCellHeader " style="border-right-width:0px;border-top-width:1px;text-align: left; height:4mm;  padding-top: 1mm; font-size: 7pt;font-weight:normal;vertical-align:top;padding-left:2mm" rowspan="2" scope="col">
										<b>(F)</b> Compensation <br/>reported as deferred<br/> in prior Form 990 </th>
								</tr>
								<tr>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">
										<b>(i) </b>
										<span class="styNormalText">Base compensation</span>
									</th>
									<th class="styTableCellHeader" style="width:20mm; " scope="col">
										<b>(ii) </b>
										<span class="styNormalText">Bonus &#38; incentive compensation</span>
									</th>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">
										<b>(iii) </b>
										<span class="styNormalText">Other reportable compensation </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<!--   BEGIN LINE 1   -->
								<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleJPartII) &lt;= 16">
									<xsl:for-each select="$FormData/Form990ScheduleJPartII">
										<tr>
											<td class="styTableCell" style="height:4mm;font-size:7pt;text-align:left;">(<xsl:number value="position()" format="1"/>)
												<xsl:choose>
													<xsl:when test="NamePerson">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NamePerson"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="width:4mm;height:4mm;font-size:7pt;">(i)<br/>(ii)</td>
											<td class="styTableCell" style="font-size:7pt;height:4mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BaseCompensationFilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CompBasedOnRelatedOrgs"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BonusFilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BonusRelatedOrgs"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCompensationFilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCompensationRelatedOrgs"/>
												</xsl:call-template>
											</td>
											<!--  -->
											<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeferredCompFilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeferredCompRelatedOrgs"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NontaxableBenefitsFilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NontaxableBenefitsRelatedOrgs"/>
												</xsl:call-template>
											</td>
											<!-- Total Compensation -->
											<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalCompensationFilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalCompensationRelatedOrgs"/>
												</xsl:call-template>
											</td>
											<!-- Amount Paid from Internal Funds -->
											<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CompReportPrior990FilingOrg"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CompReportPrior990RelatedOrgs"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 1 or
            (($Print = $Separated) and (count($FormData/Form990ScheduleJPartII) &gt; 16)) ">
									<tr>
										<td class="styTableCell" style="font-size:7pt;width:50mm">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleJPartII"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtr" style="width:8mm">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="border-right:0px">
											<span style="width:3px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 2 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 3 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 4 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 5 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 6 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 7 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 8 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 9 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 10 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 11 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 12 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 13 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 14 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 15 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>
									<xsl:if test="count($FormData/Form990ScheduleJPartII) &lt; 16 or ((count($FormData/Form990ScheduleJPartII) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchJPartIITableFillerRow"/></xsl:if>	
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleJPartII"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="16"/>
						<xsl:with-param name="containerID" select="'p2TbCtnr'"/>
					</xsl:call-template>
					<!--   END LINE 1   -->
					<!-- Line 2 -->
					<!-- Footer -->
					<div style="width:256mm;float:none;clear:both;padding-top:.5mm;border-top:solid 1px" class="pageend">
						<div class="styGenericDiv" style="width:95mm;"/>
						<div class="styGenericDiv" style="width:25mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule J (Form 990) 2011</span>
						</div>
					</div>
					<br/>
					<!-- =========================================================================-->
					<!--  Page header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
						<div style="width:90mm;" class="styGenericDiv">Schedule J (Form 990) 2011</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</div>
					</div>
					<!-- Part III Supplemental Information -->
					<div class="styGenericDiv" style="width: 256mm;">
						<div class="styPartName" style="width:18mm;">Part III</div>
						<div class="styPartDesc" style="width:238mm;font-weight:bold; ">
Supplemental Information
</div>
						<div class="IRS990ScheduleKLineDesc" style="width:256mm;height:4mm; border-top-width:1px;padding-top:1mm;border-bottom-width:1px;border-right-width:0px;padding-left:2mm">
Complete this part to provide the information, explanation, or descriptions required for Part I, lines 1a, 1b, 3, 4c, 5a, 5b, 6a, 6b, 7, and 8. Also complete this part
for any additional information.
<span style="float:right;clear:none">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleJPartIII"/>
									<xsl:with-param name="containerHeight" select="20"/>
									<xsl:with-param name="containerID" select="'SUPctn'"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styTableContainerLandscape " style="width: 256mm;  border-bottom-width: 1px" id="SUPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black;" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:50mm" scope="col">Identifier</th>
									<th class="styDepTblCell" style="width:50mm" scope="col">Return Reference</th>
									<th class="styDepTblCell" style="width:156mm" scope="col">Explanation</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleJPartIII) &lt;= 20">
									<xsl:for-each select="$FormData/Form990ScheduleJPartIII">
										<tr>
											<td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Identifier"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ReturnReference"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 1566mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Explanation"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleJPartIII"/>
						<xsl:with-param name="containerHeight" select="20"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>
					<!-- Footer -->
					<!-- Footer -->
					<div style="width:256mm;float:none;clear:both;padding-top:.5mm;border-top:solid 1px" class="pageend">
						<div class="styGenericDiv" style="width:95mm;"/>
						<div class="styGenericDiv" style="width:25mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule J (Form 990) 2011</span>
						</div>
					</div>
					<br/>
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
      Additional Data        
    </div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="($Print = $Separated) and count($FormData/Form990ScheduleJPartII) &gt;= 9">
						<br/>
						<span class="styRepeatingDataTitle" style="width:228mm">Form 990, Schedule J, Part II - Officers, Directors, Trustees, Key Employees, and Highest Compensated Employees</span>
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader " style="width:50mm;font-size: 7pt; height: 4mm; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top;border-right-width:0mm" rowspan="2" scope="col">
										<b>(A)</b> Name</th>
									<th class="styTableCellHeader " style="width:4mm; height: 4mm; border-top-width:1px;padding-top:0mm;font-weight:normal;vertical-align:top;border-right-width:1px;" rowspan="2" scope="col">
										<span style="border-bottom-width:1px"/>
									</th>
									<th class="styTableCellHeader " style=" height:4mm; width:90mm;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top;" colspan="3" scope="col">
										<b>(B)</b> Breakdown of W-2 and/or 1099-MISC compensation
</th>
									<th class="styTableCellHeader " style="border-top-width:1px;height:4mm;  font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(C)</b> Deferred<br/>compensation </th>
									<th class="styTableCellHeader " style="border-top-width:1px;height: 4mm;padding-top: 1mm; font-size: 7pt;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(D)</b> Nontaxable <br/>benefits</th>
									<th class="styTableCellHeader " style="border-top-width:1px;height:4mm; padding-top: 1mm;  font-size: 7pt;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(E)</b> Total of columns<br/>(B)(i)-(D) </th>
									<th class="styTableCellHeader " style="border-right-width:0px;border-top-width:1px;text-align: center; height:4mm;  padding-top: 1mm; font-size: 6pt;font-weight:normal;vertical-align:top" rowspan="2" scope="col">
										<b>(F)</b> Compensation reported in prior Form <br/>990 or Form 990-EZ</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" style="width:20mm;" scope="col">
										<b>(i) </b>
										<span class="styNormalText">Base Compensation</span>
									</th>
									<th class="styTableCellHeader" style="width:20mm; " scope="col">
										<b>(ii) </b>
										<span class="styNormalText">Bonus &#38; incentive compensation</span>
									</th>
									<th class="styTableCellHeader" style="width:20mm;" scope="col">
										<b>(iii) </b>
										<span class="styNormalText">Other compensation </span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<!--   BEGIN LINE 1   -->
							<xsl:for-each select="$FormData/Form990ScheduleJPartII">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCell" style="height:4mm;font-size:7pt;text-align:left;">
										<xsl:choose>
											<xsl:when test="NamePerson">
												<!--<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NamePerson"/>
												</xsl:call-template>-->
											</xsl:when>
											<xsl:otherwise>
												<!--<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
												</xsl:call-template>-->
												<br/>
												<!--<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
												</xsl:call-template>-->
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCell" style="width:4mm;height:4mm;font-size:7pt;">(i)<br/>(ii)</td>
									<td class="styTableCell" style="font-size:7pt;height:4mm">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="BaseCompensationFilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CompBasedOnRelatedOrgs"/>
										</xsl:call-template>-->
									</td>
									<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="BonusFilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="BonusRelatedOrgs"/>
										</xsl:call-template>-->
									</td>
									<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherCompensationFilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherCompensationRelatedOrgs"/>
										</xsl:call-template>-->
									</td>
									<!-- Address -->
									<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DeferredCompFilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DeferredCompRelatedOrgs"/>
										</xsl:call-template>-->
									</td>
									<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NontaxableBenefitsFilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="NontaxableBenefitsRelatedOrgs"/>
										</xsl:call-template>-->
									</td>
									<!-- Employer Identification Number -->
									<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalCompensationFilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalCompensationRelatedOrgs"/>
										</xsl:call-template>-->
									</td>
									<!-- Amount Paid from Internal Funds -->
									<td class="styTableCell" style="padding-top: 1mm;font-size:7pt;height:4mm;border-right-width:0px">
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CompReportPrior990FilingOrg"/>
										</xsl:call-template>-->
										<br/>
										<!--<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CompReportPrior990RelatedOrgs"/>
										</xsl:call-template>-->
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Below are a few templates designed to be filler rows for the tables in this form -->
	<xsl:template name="IRS990SchJPartIITableFillerRow">
		<tr>
			<td class="styTableCellText" >
				<br/>
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:8mm">
				<span style="width:4px"/>
			</td>
<td class="styTableCell" >
				<span style="width:4px"/>
			</td>			
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>
			
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" >
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>			
			<td class="styTableCell" style="border-right-width:0px">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	
	
</xsl:stylesheet>
