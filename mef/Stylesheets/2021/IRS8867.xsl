<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY bull "&#8226;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8867Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>  
	<xsl:param name="FormData" select="$RtnDoc/IRS8867"/>  
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
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
				<meta name="Description" content="IRS Form 8867"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				 <xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8867Style"/>
						<xsl:call-template name="AddOnStyle"/>
					 </xsl:if>  
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS8867">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:29mm;height:25.7mm;">
							Form <span class="styFN">8867</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template> <br/><br/>
							<div style="width:28.4mm;font-weight:normal;font-size:7pt;">(Rev. December 2021)</div>
							<span class="styAgency" style="padding-top:3.5mm;">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:25.7mm;">
							<span class="styFMT" style="font-size:12.5pt;">Paid Preparer's Due Diligence Checklist</span>
							<span class="styFMT" style="font-size:7.5pt;font-weight:normal;"><i>Earned Income Credit (EIC), American Opportunity Tax Credit (AOTC), Child Tax Credit (CTC) (including the Additional Child Tax Credit (ACTC) and Credit for Other Dependents (ODC)),
and Head of Household (HOH) Filing Status</i></span>
							<img src="{$ImagePath}/8867_Bullet.gif" alt="Bullet" />
							<b> To be completed by preparer and filed with Form 1040, 1040-SR, 1040-NR, 1040-PR, or 1040-SS.</b>			       
							 <br/><img src="{$ImagePath}/8867_Bullet.gif" alt="Bullet"/> 
                     <b> Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8867"  title="Link to IRS.gov"> <i>www.irs.gov/Form8867</i></a> for instructions and the latest information.</b>
						</div>
						<div class="styTYBox" style="width:32.7mm;height:25.7mm;">
							<div class="styOMB">OMB No. 1545-1629</div>
							<span class="stySequence" style="padding-top:13.5mm;">Attachment <br/>Sequence No. <span style="font-size:10pt;font-weight:bold;">70</span></span>
						</div>
					</div>
					<!-- Taxpayer Name/SSN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:6.5mm;">
							Taxpayer name(s) shown on return <br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:48mm;height:6.5mm;">
							Taxpayer identification number <br/>
							<span style="padding-left:1mm;font-weight:normal;width:100%;text-align:left;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Terms -->
					<div class="styBB" style="width:187mm;height:8mm;padding-top:2px;padding-bottom:8px;">
						Enter preparer's name and PTIN<br/>
						<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PreparerPersonNm"/>
								</xsl:call-template>
								<span style="width:6px"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PTIN"/>
								</xsl:call-template>
					</div>
				<!-- BEGIN Due Diligence Requirements -->
				<div class="styBB" style="width:187mm;">
					<div class="styPartName" style="width:12mm;height:4mm;font-size:9pt;background-color:black">Part I</div>					
					<div class="styPartName" style="color:black;background-color:white;width:60mm;height:2mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:.5mm">Due Diligence Requirements
					</div>
				</div>
				<div class="styBB" style="width:187mm;">
					<div class="styBB" style="width:187mm;border-bottom-width: 0px;padding-top:2px;padding-bottom:0px;padding-left:1mm;text-align:left;">
						Please check the appropriate box for  the credit(s) and/or HOH filing status claimed on this return and complete the related Parts I-V for the benefit(s) claimed (check all that apply).
					</div>
					<div class="styLNDesc" style="width:100mm;height: 0mm;"></div>
					<!--<div class="styIRS8867ChildBox" style="width:18mm;height:13mm;font-weight:normal;;padding-left:6mm;padding-right:2mm;padding-top:1mm;border-bottom-width: 0px;background-color:yellow;">--> <label>
						<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="EICClaimedIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867EICClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/EICClaimedIndYES"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867EICClaimedInd</xsl:with-param>
						</xsl:call-template>EIC</label>
						<span style="width:3mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EICClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867EICClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
					<!--</div>-->
					<!--<div class="styIRS8867ChildBox" style="width:24mm;height:13mm;text-align:center;font-weight:normal;padding-right:5mm;padding-top:1mm;border-bottom-width: 0px;">--> <label>
					<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="CTCACTCODCClaimedIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867CTCACTCODCClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedIndYES"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867CTCACTCODCClaimedInd</xsl:with-param>
						</xsl:call-template>CTC/ACTC/ODC</label>
						<span style="width:1.3mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CTCACTCODCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867CTCACTCODCClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
					<!--</div>-->
					<!--<div class="styIRS8867ChildBox" style="width:16mm;height:13mm;font-weight:normal;padding-left:6mm;padding-right:2mm;padding-top:1mm;border-bottom-width: 0px;">--> <label>
					<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="AOTCClaimedIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867AOTCClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867AOTCClaimedInd</xsl:with-param>
						</xsl:call-template>AOTC</label>
						<span style="width:1mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AOTCClaimedInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867AOTCClaimedInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
					<!--</div>-->
					<!--<div class="styIRS8867ChildBox" style="width:16mm;height:13mm;font-weight:normal;padding-left:6mm;padding-right:2mm;padding-top:1mm;border-bottom-width: 0px;">--> <label>
						<input type="checkbox" class="styCkbox" alt="HOHFilingStatusIndYES">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867THOHFilingStatusInd</xsl:with-param>
								</xsl:call-template>
							</input>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
							<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
							<xsl:with-param name="BackupName">IRS8867THOHFilingStatusInd</xsl:with-param>
						</xsl:call-template>HOH</label>
						<span style="width:1mm"/>
						<span>
							<!--<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HOHFilingStatusInd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
									<xsl:with-param name="BackupName">IRS8867THOHFilingStatusInd</xsl:with-param>
								</xsl:call-template>
							</input>-->
						</span>
					<!--</div>-->
				</div>
						<!-- Begin Line 1 -->
						<div class="styGenericDiv" style="width:187mm;height:13mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:.5mm;height:13.4mm;">1</div>
							<div class="styIRS8867ChildDesc" style="width:148mm; padding-top:0mm; height:12mm;">
								<span style="font-size:8pt;float:left;clear:none;">Did you complete the return based on information for the applicable tax year provided by the taxpayer or reasonably obtained by you? (See instructions if relying on a prior year earned income.) <span class="styDotLn" style="float:none;clear:none;padding-left:3mm;">...</span></span>
							<div class="styBB" style="width:179mm;padding-top:6.3mm; float:clear;"></div>
								</div>
							<div class="styIRS8867ChildBox" style="width:31mm;height: 5.5mm;">
							<div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">Yes</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">No</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">N/A</div>
							 </div>
							<div>
							<div class="styIRS8867ChBx" style="height:8mm;padding-top: 1mm;border-left: black 1px solid">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="TxpyrProvidedOrObtainedInfoIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChBx" style="height:8mm;padding-top: 1mm">
									<input type="checkbox" alt="TxpyrProvidedOrObtainedInfoIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>	
							<div class="styIRS8867ChBx" style="height:7.7mm;background-color:lightgrey;"></div>
							</div>						
							</div>
						</div>
						<!-- End Line 1 -->
						<!-- Begin Line 2 -->
						<div class="styGenericDiv" style="width:187mm;height:17mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:3mm;height:17.7mm;">2</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:3.1mm;height:14mm;" >
							  If credits are claimed on the return, did you complete the applicable EIC and/or CTC/ACTC/ODC worksheets found in the Form 1040, 1040-SR, 1040-NR, 1040-PR, 1040-SS, or Schedule 8812 instructions, and/or the AOTC worksheet found in the Form 8863 instructions, or your own worksheet(s) that provides the same information, and all related forms and schedules for each credit claimed?
							   <div class="styBB" style="width:179mm;padding-top:.65mm;float:clear"></div>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm; width:31mm;padding-top:.5mm;">
							<div>
							<div class="styIRS8867ChBx" style="height:7.2mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height:7.2mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height:7.2mm;background-color:lightgrey;"></div>
							</div>						
							<div class="styIRS8867ChBx" style="height:9.8mm;padding-top:5mm;border-left: black 1px solid">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
									</xsl:call-template>
									<input type="checkbox" alt="CompleteApplicableWorksheetYES" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867CompleteApplicableWorksheetCdYES</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height:9.8mm;padding-top:5mm">
									<input type="checkbox" alt="CompleteApplicableWorksheetNO" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867CompleteApplicableWorksheetCdNO</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChBx" style="height:9.8mm;padding-top:5mm">
									<input type="checkbox" alt="CompleteApplicableWorksheetN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompleteApplicableWorksheetCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867CompleteApplicableWorksheetCdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							</div>
							</div>
					    <!-- End Line 2 -->
						<!-- Begin Line 3 -->
						<div class="styGenericDiv" style="width:187mm;height:10mm;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="height:10mm;padding-top:1mm;">3</div>
							<div class="styIRS8867ChildDesc"  style="font-size: 8pt;height:10mm;padding-top:.5mm;width:148mm;">
								Did you satisfy the knowledge requirement? To meet the knowledge requirement, you must do both of the following.	
								</div>
							<div class="styIRS8867ChildBox" style="height:28mm; width:31mm;padding-top:0mm;">
							<div>
							<div class="styIRS8867ChBx" style="height: 18mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 18mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 18mm; background-color:lightgrey;"></div>
							</div>		
							<div class="styIRS8867ChBx" style="height: 10mm;padding-top:5mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SatisfyKnowledgeRequirementInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="SatisfyKnowledgeRequirementYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867SatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height: 10mm;padding-top:5mm">
									<input type="checkbox" alt="SatisfyKnowledgeRequirementNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867SatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height: 9.8mm;background-color:lightgrey"/>	
							</div>
						</div>
						<!-- End Line 3 -->
						<!-- Begin Line 3a -->
							<div class="styGenericDiv" style="width:187mm;height:10mm;">
							<div class="styLNLeftNumBox" style="height:9.5mm;padding-left:5mm;"><img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/></div>
							<div class="styIRS8867LNDesc" style="font-size: 8pt;width:148mm;height:8mm;padding-left:2mm;padding-top:1mm;">Interview the taxpayer, ask questions, and contemporaneously document the taxpayer’s responses to determine that the taxpayer is eligible to claim the credit(s) and/or HOH filing status.<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;"></span></div>
							</div>
						<!-- End Line 3a -->
						<!-- Begin Line 3b -->
							<div class="styGenericDiv" style="width:187mm;height:9.2mm;">
							<div class="styLNLeftNumBoxBB" style="height:9mm;width:8mm;padding-left:5mm;padding-top:1mm;"><img src="{$ImagePath}/8911_Bullet_Round.gif" width="5" height="5" alt="Bullet"/></div>
						    <div class="styIRS8867LNDesc" style="font-size: 8pt;width:148mm;height:9mm;padding-left:0mm;padding-top:1mm;">Review information to determine that the taxpayer is eligible to claim the credit(s) and/or HOH filing status and to figure the amount(s) of any credit(s).<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.................</span>
								<div class="styBB" style="width:148mm;padding-top:.87mm;float:clear"></div>
</div>								
							</div>
						<!-- End Line 3b -->
						<!-- Line 4 -->
						<div class="styGenericDiv" style="width:187mm;height:12mm">
							<div class="styLNLeftNumBox" style="height:12mm;padding-top:.4mm;">4</div>
							<div class="styIRS8867ChildDesc"  style="font-size: 8pt;height:14mm;padding-top:.4mm;width:148mm;">
								Did any information provided by the taxpayer or a third party for use in preparing the return, or information reasonably known to you, appear to be incorrect, incomplete, or inconsistent? (If<b> &#8220;Yes,&#8221;</b> answer questions 4a and 4b. If <b>&#8220;No,&#8221;</b> go to question 5.)
								</div>
							<div class="styIRS8867ChildBox" style="height:12mm; width:31mm;padding-top:0mm;">
							<div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height: 6mm;padding-top:1mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/IncorIncmplInconInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="IncorIncmplInconInfoIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867IncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height: 6mm;padding-top:1mm">
									<input type="checkbox" alt="IncorIncmplInconInfoIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867IncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height: 5.7mm;background-color:lightgrey"/>	
							</div>
						</div>
						<!-- End Line 4 -->
						<!-- Begin Line 4a -->
						<div class="styGenericDiv" style="width:187mm;height:12mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm;">a</div>
							<div class="styIRS8867LNDesc" style="font-size: 8pt;width:148mm;height:6mm;padding-left:2mm;padding-top:1mm;">			    
						    Did you make reasonable inquiries to determine the correct, complete, and consistent information?
								</div>
							<div class="styIRS8867ChildBox" style="height:12mm; width:31mm;padding-top:0mm;">
							<div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm;padding-top:1mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/MakeInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="MakeInquiryIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867MakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:6mm; padding-top:1mm">
									<input type="checkbox" alt="MakeInquiryIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867MakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height:5.7mm;background-color:lightgrey"/>	
							</div>
							</div>
						<!-- End Line 4a -->
						<!-- Begin Line 4b -->
						<div class="styGenericDiv" style="width:187mm;height:14mm;">
							<div class="styLNLeftNumBoxBB" style="height:14mm;width:10mm;padding-left:5mm;padding-top:1.5mm;">b</div>
						    <div class="styIRS8867LNDesc" style="font-size: 8pt;width:146mm;height:14mm;padding-left:0mm;padding-top:1.5mm;border-style: solid; border-color: black;border-width: 0px 0px 1px 0px">Did you contemporaneously document your inquiries? (Documentation should include the questions you asked, whom you asked, when you asked, the information that was provided, and the impact the information had on your preparation of the return.)<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.................</span>
							</div>					
							<div class="styIRS8867ChildBox" style="height:14mm; width:31mm;padding-top:0mm;">
							<div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:7.9mm;padding-top:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DocumentInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="DocumentInquiryIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867DocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:7.9mm;padding-top:2mm">
									<input type="checkbox" alt="DocumentInquiryIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867DocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height:7.7mm;background-color:lightgrey"/>	
							</div>
							</div>
						<!-- End Line 4b -->
						<!-- Begin Line 5 -->
						<div class="styGenericDiv" style="width:187mm;height:56mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:1mm;height:56.3mm;">5</div>
							<div class="styIRS8867ChildDesc" style="font-size:8pt;width:148mm;padding-top:1mm;height:51mm;" >
							   Did you satisfy the record retention requirement?  To meet the record retention requirement, you must keep a copy of your documentation referenced in question 4b, a copy of this Form 8867, a copy of any applicable worksheet(s), a record of how, when, and from whom the information used to prepare Form 8867 and any applicable worksheet(s) was obtained, and a copy of any document(s) provided by the taxpayer that you relied on to determine eligibility for the credit(s) and/or HOH filing status or to figure the amount(S) of the credit(s)
							    <span class="styDotLn" style="font-size: 8pt;float:none;clear:none;padding-left:1.5mm;">........................</span>
									<br></br> <br></br>
							    List those documents provided by the taxpayer, if any, that you relied on:<br/>
						<xsl:choose>
							     <xsl:when test="$FormData/WorkPaperDocumentNm">
							    <div class="styFixedUnderline" style="font-size:8pt;width:148mm;height:5mm;padding-top:1.5mm;background-color:lightgrey">
										 See Additional Data Table				
											</div>
								<div class="styFixedUnderline" style="width:148mm;height:5.9mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:148mm;height:5.9mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:148mm;height:5.9mm;padding-top:3mm;background-color:lightgrey"></div>	
							   <div class="styBB" style="width:148mm;padding-top:5mm;float:clear;background-color:lightgrey"></div>
								</xsl:when>
						<xsl:otherwise>
								<div class="styFixedUnderline" style="width:148mm;height:6mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:148mm;height:6mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:148mm;height:6mm;padding-top:3mm;background-color:lightgrey"></div>	
							   <div class="styBB" style="width:148mm;padding-top:6mm;float:clear;background-color:lightgrey"></div>
							   </xsl:otherwise>
							   </xsl:choose>
							 </div>
							<div class="styIRS8867ChildBox" style="height:22.5mm; width:31mm;padding-top:0mm;">
							<div>
							<div class="styIRS8867ChBx" style="height: 12mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 12mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 12mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:10.3mm;padding-top:5mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SatisfyRecordRetentionRqrInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="SatisfyRecordRetentionRqrIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867SatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:10.3mm;padding-top:5mm">
									<input type="checkbox" alt="SatisfyRecordRetentionRqrIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867SatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height:10.1mm;background-color:lightgrey"/>	
							</div>
								<div class="styIRS8867ChildBox" style="width:10.3mm;height:33.5mm;padding-top:20mm;padding-right:0mm;background-color:lightgrey"></div>
								<div class="styIRS8867ChildBox" style="height:33.5mm;padding-top:20mm;padding-right:0mm;background-color:lightgrey;width:10.3mm"></div>
								<div class="styIRS8867ChildBox" style="height:33.5mm;padding-top:20mm;padding-right:0mm;background-color:lightgrey;border-right-width: 1px;width:10.3mm;"></div>
							</div>
						<!-- End Line 5 -->
						<!-- Begin Line 6 -->
						<div class="styGenericDiv" style="width:187mm;height:10.5mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:1mm;height:11.7mm;">6</div>
							<div class="styIRS8867ChildDesc" style="width:148mm;padding-top:1mm;">
								<span style="font-size: 8pt;float:left;clear:none;">Did you ask the taxpayer whether he/she could provide documentation to substantiate eligibility for the credit(s) and/or HOH filing status and the amount(s) of the credit(s) claimed on the return if his/her return is selected for audit?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.........................</span> </span>
							<div class="styBB" style="width:148mm;padding-top:.2mm;float:clear"></div>
								</div>
							<div class="styIRS8867ChildBox" style="height:11.5mm; width:31mm;padding-top: 0mm">
							<div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height: 4.8mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SubstantiateCrEligibilityInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="SubstantiateCrEligibilityIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx">
									<input type="checkbox" alt="SubstantiateCrEligibilityIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="background-color:lightgrey"/>	
							</div>
						</div>
						<!-- End Line 6 -->
						<!-- Begin Line 7 -->
						<div class="styGenericDiv" style="width:187mm;height:6mm;padding-top:0mm;">
							<div class="styLNLeftNumBox" style="height:11mm;padding-top:1mm;">7</div>
                            <div class="styIRS8867LNDesc" style="font-size: 8pt;width:148mm;height:6mm;padding-top:1mm;">
								Did you ask the taxpayer if any of these credits were disallowed or reduced in a previous year?<br></br>
								<b>(If credits were disallowed or reduced, go to question 7a; if not, go to question 8.)</b>
								</div>
											<div class="styIRS8867ChildBox" style="height:7mm;width:31mm;padding-top:0mm;" >
							<div class="styIRS8867ChBx" style="height: 7mm; padding-top:2mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
									</xsl:call-template>
									<input type="checkbox" alt="PrevDisallowedOrReducedCrCdYES" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867PrevDisallowedOrReducedCrCdYES</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height: 7mm; padding-top: 2mm">
									<input type="checkbox" alt="PrevDisallowedOrReducedCrCdNO" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867PrevDisallowedOrReducedCrCdNO</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 7mm; padding-top: 2mm;">
									<input type="checkbox" alt="PrevDisallowedOrReducedCrCdN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PrevDisallowedOrReducedCrCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867PrevDisallowedOrReducedCrCdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							</div>
						</div>
						<!-- End Line 7 -->
						<!-- Begin Line 7a -->
							<div class="styGenericDiv" style="width:187mm;height:7mm;padding-top:0mm;">
							<div class="styLNLeftNumBoxBB" style="height:7.3mm;padding-top:2mm;padding-left:5mm;">a</div>
						    <div class="styIRS8867ChildDesc"  style="font-size:8pt;height:6mm;padding-top:2mm;width:148mm;">
						    Did you complete the required recertification Form 8862?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...............</span>
								<div class="styBB" style="width:148mm;padding-top:1.75mm;float:clear"></div>
								</div>
											<div class="styIRS8867ChildBox" style="height:7mm;width:31mm;padding-top:0mm;" >
											<div>
							<div class="styIRS8867ChBx" style="height: 2.3mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 2.3mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 2.3mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height: 4mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
									</xsl:call-template>
									<input type="checkbox" alt="CompleteRequiredRecertFormCdYes" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867CompleteRequiredRecertFormCdYES</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height: 4mm">
									<input type="checkbox" alt="CompleteRequiredRecertFormCdNo" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867CompleteRequiredRecertFormCdNO</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChBx" style="height: 4mm">
									<input type="checkbox" alt="CompleteRequiredRecertFormCdN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CompleteRequiredRecertFormCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867CompleteRequiredRecertFormCdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							</div>
							</div>
						<!-- End Line 7a -->
						<!-- Begin Line 8 -->
						<div class="styGenericDiv" style="width:187mm;height:9mm;padding-top:0mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:.5mm;height:8mm;border-bottom-width: 2px;">8</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:0mm;">
								<span style="float:left;clear:none;">If the taxpayer is reporting self-employment income, did you ask 
								 questions to prepare a complete and correct Schedule C (Form 1040)?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.......................</span>
 </span>
							<div class="styBB" style="width:148mm;padding-top:.7mm;float:clear;border-bottom-width: 2px;"></div>
								</div>
											<div class="styIRS8867ChildBox" style="height:8.1mm;width:31mm;padding-top: 0mm;" >
										<div>
							<div class="styIRS8867ChBx" style="height: 4mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 4mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 4mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm;padding-top:0mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
									</xsl:call-template>
									<input type="checkbox" alt="QstnToCompleteCorrectSchCCdYES" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867QstnToCompleteCorrectSchCCdYES</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							<div class="styIRS8867ChBx" style="height:4mm;padding-top:0mm">
									<input type="checkbox" alt="QstnToCompleteCorrectSchCCdNO" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867QstnToCompleteCorrectSchCCdNO</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm;padding-top:0mm">
									<input type="checkbox" alt="QstnToCompleteCorrectSchCCdN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/QstnToCompleteCorrectSchCCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867QstnToCompleteCorrectSchCCdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							</div>
						</div>
						<!-- End Line 8 -->
						<!-- Page boundary -->					
            <div style="float:left;">
              <span class="styBoldText">
                For Paperwork Reduction Act Notice, see separate instructions.
              </span>
            </div>
           <div style="text-align:left;font-size:7pt;">
              <span style="width:90px"/> 
              Cat. No. 26142H     
			</div>
          <div style="float:right;">
              <span style="width:50px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8867</span> (Rev. 12-2021)
            </div>
					<div class="pageEnd" style="width:187mm;clear:all;">
					</div><br/><br/>
						<span style="float:left;clear:none;">Form 8867 (Rev. 12-2021)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					<div class="styGenericDiv" style="width:187mm;height:.5mm;"></div>
						<!-- BEGIN Page 2 -->
						<div class="styBB" style="width:187mm;border-bottom-width:2px;"></div>
						<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;background-color:black">Part II</div>
						<div class="styPartName" style="color:black;background-color:white;width:173mm;height:2mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:.5mm">Due Diligence Questions for Returns Claiming EIC <span style="font-weight:normal">(If the return does not claim EIC, go to Part III.)</span>
					</div>
					<div class="styBB" style="width:187mm;float:clear"></div>
					<!-- Begin Line 9a -->
						<div class="styGenericDiv" style="width:187mm;height:13mm;">
							<div class="styLNLeftNumBox" style="padding-top:1mm;height:15.05mm;">9a</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:1mm;height:10mm;" >
							   Have you determined that the taxpayer is eligible to claim the EIC for the number of qualifying children claimed, or is eligible to claim the EIC without a qualifying child? <b>(If the taxpayer is claiming the EIC and does not have a qualifying child, go to question 10.)</b>
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">............</span>
							</div>							
					<div class="styIRS8867ChildBox" style="width:31mm;height: 5.5mm;">
							<div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">Yes</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">No</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">N/A</div>
							 </div>
							<div>
							<div class="styIRS8867ChBx" style="height:8.2mm;padding-top: 1mm;border-left: black 1px solid">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICEligibleClaimQlfyChildInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="EICEligibleClaimQlfyChildIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligibleClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligibleClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChBx" style="height:8mm;padding-top: 1mm">
									<input type="checkbox" alt="EICEligibleClaimQlfyChildIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICEligibleClaimQlfyChildInd"/>
											<xsl:with-param name="BackupName">IRS8867EICEligibleClaimQlfyChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>	
							<div class="styIRS8867ChBx" style="height:8.2mm;background-color:lightgrey;"></div>
							</div>						
							</div>
							</div>
					<!-- End Line 9a -->
					<!-- Begin Line 9b -->
						<div class="styGenericDiv" style="width:187mm;height:7mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:7mm;padding-left:3mm;">b</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:1mm;height:7mm;" >
							   Did you ask the taxpayer if the child lived with the taxpayer for over half of the year, even if the taxpayer has supported the child the entire year?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:9mm;width: 31mm;">
									<div>
							<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm; padding-top:0mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="ExplainLiveWithChldRqrClaimIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimInd"/>
											<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:4mm; padding-top:0mm">
									<input type="checkbox" alt="ExplainLiveWithChldRqrClaimIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimInd"/>
											<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:8.2mm;background-color:lightgrey;"></div>
							</div>
							<!--<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;border-top-width:1px;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;border-top-width:1px;background-color:lightgrey;"></div>
        					<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;border-top-width:1px;background-color:lightgrey;border-right-width: 1px;" ></div>-->
							</div>
					<!-- End Line 9b -->
					<!-- Begin Line 9c -->
						<div class="styGenericDiv" style="width:187mm;height:9mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:0mm;height:9mm;padding-left:3mm;">c</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:.5mm;height:9mm;" >
							   Did you explain to the taxpayer the rules about claiming the EIC when a child is the qualifying child of more than one person (tiebreaker rules)?
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:9mm;width: 31mm;">
									<div>
							<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 3mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
									</xsl:call-template>
									<input type="checkbox" alt="ExplainTiebreakerRulesCdYes" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesCdYES</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx">
									<input type="checkbox" alt="ExplainTiebreakerRulesCdNo" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesCdNO</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx">
									<input type="checkbox" alt="ExplainTiebreakerRulesCdN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainTiebreakerRulesCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainTiebreakerRulesCdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							</div>
							<!--<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
        					<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;border-right-width: 1px;" ></div>-->
							</div>
					<!-- End Line 9c -->
					<!-- Begin Line 10 -->
						<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
						<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;background-color:black">Part III</div>
						<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-top:1mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal"><b>Due Diligence Questions for Returns Claiming CTC/ACTC/ODC</b> (If the return does not claim CTC, ACTC, or ODC go to Part IV.)
					</div>
						<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<!-- Begin Line 10 -->
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:8mm;padding-left:0mm;">10</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:1mm;" >
							   Have you determined that each qualifying person for the CTC/ACTC/ODC is the taxpayer's dependent who is a citizen, national, or resident of the United States?
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..............</span>					                  	</div>
							<div class="styIRS8867ChildBox" style="height:30mm;width: 31mm;">
							<div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">YES</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">NO</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">N/A</div>
								<div>
							<div class="styIRS8867ChBx" style="height: 0mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 0mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:4mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrNationalInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="USCitizenOrNationalIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrNationalInd"/>
											<xsl:with-param name="BackupName">IRS8867USCitizenOrNationalInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx">
									<input type="checkbox" alt="USCitizenOrNationalIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrNationalInd"/>
											<xsl:with-param name="BackupName">IRS8867USCitizenOrNationalInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								</div>
							</div>
							</div>
					<!-- End Line 10 -->
					<!-- Begin Line 11 -->
						<div class="styGenericDiv" style="width:187mm;height:10mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:10mm;padding-left:0mm;">11</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;padding-top:0mm;height:10mm;" >
							   Did you explain to the taxpayer that he/she may not claim the CTC/ACTC if the child has not lived with the taxpayer for over half of the year, even if the taxpayer has supported the child, unless the child's custodial parent has released a claim to exemption                             for the child?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.............</span>
							   <!--<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.................</span>-->
							</div>
							<div class="styIRS8867ChildBox" style="height:4mm;width: 31mm;">
								<div>
							<div class="styIRS8867ChBx" style="height: 1mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 1mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 1mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height: 7.5mm; padding-top:2mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
									</xsl:call-template>
									<input type="checkbox" alt="ExplainLiveWithChldRqrClaimCdYes" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimCdYES</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height: 7.5mm; padding-top:2mm">
									<input type="checkbox" alt="ExplainLiveWithChldRqrClaimCdNo" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimCdNO</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height: 7.5mm; padding-top:2mm">
									<input type="checkbox" alt="ExplainLiveWithChldRqrClaimCdN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainLiveWithChldRqrClaimCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainLiveWithChldRqrClaimCdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
								</div>
								</div>
							
					<!-- End Line 11 -->
					<!-- Begin Line 12 -->
						<div class="styGenericDiv" style="width:187mm;height:11mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:11mm;padding-left:0mm;">12</div>
							<div class="styIRS8867ChildDesc" style="font-size: 8pt;width:148mm;" >
							  Did you explain to the taxpayer the rules about claiming the CTC/ACTC/ODC for a child of divorced or separated parents
							 (or parents who live apart), including any requirement to attach a Form 8332 or similar statement to the return?
								<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">........................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:6mm;width: 31mm;padding-top: 0mm">
									<div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							<div class="styIRS8867ChBx" style="height: 6mm; background-color:lightgrey;"></div>
							</div>
							<div class="styIRS8867ChBx" style="height:6mm;padding-top:1mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
									</xsl:call-template>
									<input type="checkbox" alt="ExplainRuleClmCrDivPrnts8332CdYes" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'YES'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainRuleClmCrDivPrnts8332CdYES</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:6mm;padding-top:1mm">
									<input type="checkbox" alt="ExplainRuleClmCrDivPrnts8332CdNo" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'NO'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainRuleClmCrDivPrnts8332CdNO</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styIRS8867ChBx" style="height:6mm;padding-top:1mm">
									<input type="checkbox" alt="ExplainRuleClmCrDivPrnts8332CdN/A" class="styCkbox">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExplainRuleClmCrDivPrnts8332Cd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="'N/A'"/>
											<xsl:with-param name="BackupName">IRS8867ExplainRuleClmCrDivPrnts8332CdNA</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							</div>
							</div>
					<!-- End Line 12 -->
					<!-- End Line 10-12 -->
					<!-- Begin Line 13 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<div class="styPartName" style="width:14mm;height:4mm;font-size:9pt;background-color:black">Part IV</div>
						<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal"><b>Due Diligence Questions for Returns Claiming AOTC</b> (If the return does not claim AOTC, go to Part V.)
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<!-- Begin Line 13 -->
						<div class="styGenericDiv" style="width:187mm;height:9.5mm;">
							<div class="styLNLeftNumBox" style="padding-top:1mm;height:9.5mm;">13</div>
							<div class="styIRS8867ChildDesc" style="font-size:8pt;width:158.3mm;padding-top:1mm;" >
							   Did the taxpayer provide substantiation for the credit, such as a Form 1098-T and/or receipts for the qualified tuition and related expenses for the claimed AOTC?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....................</span>
							 
							</div>
							<div class="styIRS8867ChildBox" style="height:9.5mm;width: 20.7mm;padding-top:0mm">
							<div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">YES</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">NO</div>
							<div class="styIRS8867ChBx" style="height:6mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="SubstProvQlfyTuitionExpnssIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:6mm">
									<input type="checkbox" alt="SubstProvQlfyTuitionExpnssIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								</div>
								</div>
							<!--<div class="styIRS8867ChildBox" style="height:11mm;background-color:lightgrey;border-bottom-width:0px;"></div>-->
							<!--<div class="styIRS8867ChildBox" style="height:11mm;background-color:lightgrey;border-bottom-width:0px;"></div>-->
							<!--<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6mm;border-bottom-width:0px;">-->
							<!--<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="SubstantiationtProvideQualifiedyTuitionExpenses" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
							</span>-->
							<!--<span>
									<input type="checkbox" alt="SubstantiationtProvideQualifiedyTuitionExpenses" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867SubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</span>-->
							</div>
							<!--<div class="styIRS8867ChildBox" style="height:11mm;background-color:lightgrey;border-bottom-width:0px;"></div>-->
							
					<!-- End Line 13 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<div class="styPartName" style="width:14mm;height:4.5mm;font-size:9pt;background-color:black">Part V</div>
						<div class="styPartName" style="color:black;background-color:white;width:173mm;height:3mm;padding-left:1.3mm;text-align:left;font-size:7pt;font-weight:normal"><b>Due Diligence Questions for Claiming HOH</b> (If the return does not claim HOH filing status, go to Part VI.)
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<!-- Begin Line 14 -->
						<div class="styGenericDiv" style="width:187mm;height:10mm;">
							<div class="styLNLeftNumBox" style="padding-top:1mm;height:10mm;">14</div>
							<div class="styIRS8867ChildDesc" style="font-size:8pt;width:158.3mm;padding-top:1mm;" >
							   Have you determined that the taxpayer was unmarried or considered unmarried on the last day  of the tax year and provided more than half of the cost of keeping up a home for the year for a qualifying person?
							   <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:9.75mm;width: 20.7mm;padding-top:0mm;">
							<div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">YES</div>
								 <div class="styIRS8867ChBx" style="border-bottom: black 1px solid">NO</div><br></br>
							<div class="styIRS8867ChBx" style="height:6.4mm;padding-top:.5mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="EligibleClaimHOHIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height:6.4mm; padding-top:.5mm">
									<input type="checkbox" alt="EligibleClaimHOHIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								</div>
								</div>
							<!--<span>
									<xsl:call-template name="PopulateSpan">   
										<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="EligibleClaimHOH" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
							</span>-->
							<!--<span>
									<input type="checkbox" alt="EligibleClaimHOH" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EligibleClaimHOHInd"/>
											<xsl:with-param name="BackupName">IRS8867EligibleClaimHOHInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</span>-->
							</div>
							
					<!-- End Line 14 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;padding-top:0mm;"></div>
					<div class="styPartName" style="width:14mm;height:4.5mm;font-size:9pt;background-color:black">Part VI</div>
						<div class="styPartName" style="color:black;background-color:white;width:173mm;height:4.5mm;padding-left:1.3mm;padding-bottom:3mm;text-align:left;font-size:7pt;font-weight:normal"><b>Eligibility Certification</b> 
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<!-- BEGIN Words Between 14 and 15 -->
							<div class="styIRS8867LNDesc" style="width:5mm;height:6mm;padding-left:8.5mm;">
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/></div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:158mm;height:6mm;padding-left:3mm;float:none;">
							<b>You will have complied with all due diligence requirements for claiming the applicable credit(s) and/or 
							      HOH filing status on the return of the taxpayer identified above if you:</b></div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:1mm;height:10mm;padding-left:11.5mm;">
A. Interview the taxpayer, ask adequate questions, contemporaneously document the taxpayer’s responses on the return or in your notes, review  adequate information to determine if the taxpayer is eligible to claim the credit(s) and/or HOH filing status and to figure the amount(s) of the credit(s); </div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:1mm;height:6mm;padding-left:11.5mm;float:none;">
								B. Complete this Form 8867 truthfully and accurately and complete the actions described in this 
								 checklist for any applicable credit(s) claimed and HOH filing status, if claimed;	</div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;padding-top:1.7mm;height:3mm;padding-left:11.5mm;">
C. Submit Form 8867 in the manner required;  <b>and</b></div>
							<br/><br/>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:3mm;height:3mm;padding-top:2mm;padding-left:11.5mm;">D. </div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:165mm;height:6mm;padding-top:2mm;padding-left:3.5mm;">
Keep all five of the following records for 3 years from the latest of the dates specified in the Form 8867 instructions under
<i>Document Retention.</i></div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:4mm;height:7mm;padding-left:14.6mm;">
1. A copy of this Form 8867.</div>
<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;height:4.5mm;padding-left:14.6mm;">
2. The applicable worksheet(s) or your own worksheet(s) for any credit(s) claimed.</div>
<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;height:6.8mm;padding-top:.5mm;padding-left:14.6mm;">
3. Copies of any documents provided by the taxpayer on which you relied to determine the taxpayer’s eligibility for the credit(s) and/or
 HOH filing status and to figure the amount(s) of the credit(s).</div>
<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:1.5mm;height:5.5mm;padding-left:14.6mm;">
4. A record of how, when, and from whom the information used to prepare this form and the applicable worksheet(s) was obtained.</div>
<div class="styIRS8867LNDesc" style="font-size:8pt;width:187mm;padding-top:2.5mm;height:8mm;padding-left:14mm;">
5. A record of any additional information you relied upon, including questions you asked and the taxpayer's responses, to determine the
 taxpayer's eligibility for the credit(s) and/or HOH filing status and to figure the amount(s) of the credit(s).</div>
				<div class="styIRS8867LNDesc" style="font-size:8pt;width:5mm;height:6mm;padding-left:8.5mm;padding-top:3mm;">
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/></div>
							<div class="styIRS8867LNDesc" style="font-size:8pt;width:160mm;height:10mm;padding-left:3mm;padding-top:2mm;float:none;">
							<b>If you have not complied with all due diligence requirements, you may have  to pay a penalty for each failure to comply related to a claim of an applicable credit or HOH filing status (see instructions for more information).</b></div>
					<div class="styGenericDiv" style="width:187mm;height:.3mm;"></div>
						<div class="styGenericDiv" style="width:187mm;height:2mm;"></div>	
					<!-- END Words Between 14 and 15 -->
					<!-- Begin Line 15 -->
					<div class="styBB" style="width:187mm;float:clear;padding-bottom:.5mm;"></div>
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:.5mm;height:8.7mm;border-bottom-width: 2px;">15</div>
							<div class="styIRS8867ChildDesc" style="font-size:8pt;width:158.3mm;padding-top:.5mm;" >
							   Do you certify that all of the answers on this Form 8867 are, to the best of your knowledge, true, correct, and complete?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..................................</span>
							   <div class="styBB" style="width:187mm;padding-top:.85mm;float:clear;border-bottom-width: 2px;"></div>
							</div>
							<div class="styIRS8867ChildBox" style="height:8.3mm;width: 20.7mm;padding-top:0mm">
							<div>
								 <div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">YES</div>
								 <div class="styIRS8867ChBx" style="height: 3mm;border-bottom: black 1px solid">NO</div>
							<div class="styIRS8867ChBx" style="height: 4.7mm;padding-top:0mm">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="CrEligibilityCertificationIndYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>		
							<div class="styIRS8867ChBx" style="height: 4.7mm;padding-top:0mm">
									<input type="checkbox" alt="CrEligibilityCertificationIndNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								</div>
								</div>
							<!--<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="CertifyEligibilityCertification" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
									</input>	
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
							</span>-->
							<!--<span style="width:13mm"/>
							<span>
									<input type="checkbox" alt="CertifyEligibilityCertification" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData//CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
											<xsl:with-param name="BackupName">IRS8867CrEligibilityCertificationInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</span>-->
							</div>
							
					<!-- End Line 15 --> 
					<div class="pageEnd" style="width:187mm;">
					  <div style="float:right;">
					  <span style="width:101px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8867</span> (Rev. 12-2021)
					</div>
					</div>
						<!-- BEGIN Left Over Table -->
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
					  <xsl:choose>
							 <xsl:when test="$FormData/WorkPaperDocumentNm">
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:142mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:141mm;">Due Diligence Requirements LINE 5 Additional Notes and Document List</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
									<tr style="border-color:black;height:6mm;">
										<td class="styTableCellText" style="width:141.5mm;">
											 <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/WorkPaperDocumentNm"/>
								</xsl:call-template>
										</td>
									</tr>
							</tbody>
						</table>
						<br/>
					 </xsl:when>
					</xsl:choose>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>