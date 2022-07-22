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
						<div class="styFNBox" style="width:27mm;height:27mm;">
							Form <span class="styFN">8867</span><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template> <br/><br/>
							<span class="styAgency" style="padding-top:7mm;">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:27mm;">
							<span class="styFMT" style="font-size:12.5pt;">Paid Preparer's Due Diligence Checklist</span>
							<span class="styFMT" style="font-size:7.5pt;font-weight:normal;"><i>Earned Income Credit (EIC), Child Tax Credit (CTC), and American Opportunity Tax Credit (AOTC)</i></span>
							<img src="{$ImagePath}/8867_Bullet.gif" alt="Bullet" />
							<b>To be completed by preparer and filed with Form 1040, 1040A, 1040EZ, 1040NR, 1040SS, or 1040PR.</b>
			                <span style="padding-top:4mm"></span>
							 <br/><img src="{$ImagePath}/8867_Bullet.gif" alt="Bullet"/> 
                     <b>Information about Form 8867 and its separate instructions is at <br/> <a href="http://www.irs.gov/form8867"  title="Link to IRS.gov"> <i>www.irs.gov/form8867.</i></a></b> 
						</div>
						<div class="styTYBox" style="width:32.7mm;height:27mm;">
							<div class="styOMB">OMB No. 1545-1629</div>
							<span class="styTaxYear">20<span class="styTYColor">16</span></span><br/><br/><br/>
							<span class="stySequence">Attachment <br/>Sequence No. <span style="font-size:10pt;font-weight:bold;">177</span></span>
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
						<div class="styPartName" style="color:black;background-color:white;width:187mm;padding-left:1.3mm;text-align:left;font-size:7pt;">Due Diligence Requirements
					</div>
					<div class="styBB" style="width:187mm;"></div>
					<div class="styBB" style="width:187mm;">
						<div class="styBB" style="width:100mm;border-bottom-width: 0px;padding-top:2px;padding-bottom:8px;text-align:center;padding-left:3mm;">
						Please complete the appropriate column for all credits claimed on this
return (check all that apply).
					</div>
					<div class="styLNDesc" style="width:13mm;"></div>
					<div class="styIRS8867ChildBox" style="width:24mm;height:9mm;text-align:center;font-weight:normal;padding-right:2mm;border-bottom-width: 0px;"> EIC</div>					<div class="styIRS8867ChildBox" style="width:24mm;height:9mm;text-align:center;font-weight:normal;padding-right:2mm;border-bottom-width: 0px;"> CTC/ACTC</div>
					<div class="styIRS8867ChildBox" style="width:24mm;height:9mm;text-align:center;font-weight:normal;padding-right:2mm;border-bottom-width: 0px;"> AOTC</div>
					</div>
						<!-- Begin Line 1 -->
						<div class="styGenericDiv" style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:.5mm;height:7.95mm;">1</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:.5mm;">
								<span style="float:left;clear:none;">Did you complete the return based on information for tax year 2016 provided by the taxpayer or reasonably obtained by you? <span class="styDotLn" style="float:none;clear:none;padding-left:3mm;">...........</span></span>
							<div class="styBB" style="width:105mm;padding-top:1.2mm;float:clear"></div>
								</div>
							<div class="styIRS8867ChildBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									</input>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>							
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm;padding-top:3mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
							<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox"  style="height:8mm;padding-top:3mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
                                <label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
								<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/TxpyrProvidedOrObtainedInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpTxpyrProvidedOrObtainedInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
						</div>
						<!-- End Line 1 -->
						<!-- Begin Line 2 -->
						<div class="styGenericDiv" style="width:187mm;height:17mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:3mm;height:19mm;">2</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:3.1mm;height:14mm;" >
							   Did you complete the applicable EIC and/or CTC/ACTC worksheets found in the Form 1040, 1040A, 1040EZ, 1040NR, 1040PR, or 1040SS instructions, and/or the AOTC worksheet found in the Form 8863 instructions, or your own worksheet(s) that provides the same information, and all related forms and schedules for each credit claimed?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....................</span>
							   <div class="styBB" style="width:105mm;padding-top:.65mm;float:clear"></div>
							</div>
							<div class="styIRS8867ChildBox" style="height:19mm;padding-top:14mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:19mm;padding-top:14mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
																		<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:19mm;padding-top:14mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
									</input>
										<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteApplicableWorksheetInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteApplicableWorksheetInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
					    <!-- End Line 2 -->
						<!-- Begin Line 3 -->
						<div class="styGenericDiv" style="width:187mm;height:8.5mm;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="height:8.5mm;padding-top:1mm;">3</div>
							<div class="styIRS8867ChildDesc"  style="height:8.5mm;padding-top:1mm;width:105mm;">
								Did you satisfy the knowledge requirement? Answer &#8220;Yes&#8221; only if you can answer &#8220;Yes&#8221; to both 3a and 3b.  To meet the knowledge requirement, did you:	
								</div>
							<div class="styIRS8867ChildBox" style="height:7.55mm;padding-top:2.5mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.55mm;padding-top:2.5mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
							<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.55mm;padding-top:2.5mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
										<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyKnowledgeRequirementInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyKnowledgeRequirementInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</div>
						</div>
						<!-- End Line 3 -->
						<!-- Begin Line 3a -->
							<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm;">a</div>
							<div class="styIRS8867LNDesc" style="width:105mm;height:6mm;padding-left:2mm;padding-top:1mm;">Interview the taxpayer, ask adequate questions, and document the taxpayer’s responses to determine that the taxpayer is eligible to claim the credit(s)?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....</span></div>
							<div class="styIRS8867ChildBox" style="height:8.2mm;padding-top:3.5mm;" >
							<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
									</input>
							<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:8.2mm;padding-top:3.5mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:8.2mm;padding-top:3.5mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/InterviewQuestionDocumentInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpInterviewQuestionDocumentInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
						<!-- End Line 3a -->
						<!-- Begin Line 3b -->
							<div class="styGenericDiv" style="width:187mm;height:mm;">
							<div class="styLNLeftNumBoxBB" style="height:8.15mm;width:10mm;padding-left:5mm;padding-top:1mm;">b</div>
						    <div class="styIRS8867LNDesc" style="width:103mm;height:6mm;padding-left:0mm;padding-top:1mm;">Review adequate information to determine that the taxpayer is eligible to claim the credit(s) and in what amount?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..............</span>
								<div class="styBB" style="width:103mm;padding-top:.85mm;float:clear"></div>
</div>								
							<div class="styIRS8867ChildBox" style="height:8.2mm;padding-top:3.5mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ReviewInformationInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:8.2mm;padding-top:3.5mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ReviewInformationInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
									</input>
										<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:8.2mm;padding-top:3.5mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/ReviewInformationInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/ReviewInformationInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpReviewInformationInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
						<!-- End Line 3b -->
						<!-- Line 4 -->
						<div class="styGenericDiv" style="width:187mm;height:10mm;">
							<div class="styLNLeftNumBox" style="height:12mm;padding-top:.4mm;">4</div>
							<div class="styIRS8867ChildDesc"  style="height:12mm;padding-top:.4mm;width:105mm;">
								Did any information provided by the taxpayer, a third party, or reasonably known to you in connection with
								 preparing the return appear to be incorrect, incomplete, or inconsistent? (If &#8220;Yes,&#8221; answer questions 4a and 4b. If &#8220;No,&#8221; go to question 5.)
								</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.5mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.5mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.5mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/IncorIncmplInconInfoInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpIncorIncmplInconInfoInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
						</div>
						<!-- End Line 4 -->
						<!-- Begin Line 4a -->
						<div class="styGenericDiv" style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox" style="height:8mm;padding-left:5mm;">a</div>
							<div class="styIRS8867LNDesc" style="width:105mm;height:6mm;padding-left:2mm;padding-top:1mm;">			    
						    Did you make reasonable inquiries to determine the correct or complete information?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.....................</span>
								</div>
							<div class="styIRS8867ChildBox" style="height:9.25mm;padding-top:4mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/MakeInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
							<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:9.25mm;padding-top:4mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/MakeInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
										<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:9.25mm;padding-top:4mm;width:26mm;">
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/MakeInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/MakeInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpMakeInquiryInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
						<!-- End Line 4a -->
						<!-- Begin Line 4b -->
						<div class="styGenericDiv" style="width:187mm;height:12mm;">
							<div class="styLNLeftNumBoxBB" style="height:11.95mm;width:10mm;padding-left:5mm;padding-top:1.5mm;">b</div>
						    <div class="styIRS8867LNDesc" style="width:103mm;height:6mm;padding-left:0mm;padding-top:1.5mm;">Did you 
						     document your inquiries? (Documentation should include the questions you asked, whom you asked, when you
						     asked, the information that was provided, and the impact the information had on your preparation of the return.)<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...</span>
								<div class="styBB" style="width:103mm;padding-top:1.2mm;float:clear"></div>
							</div>					
							<div class="styIRS8867ChildBox" style="height:12mm;padding-top:7.5mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/DocumentInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:12mm;padding-top:7.5mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:12mm;padding-top:7.5mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/DocumentInquiryInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpDocumentInquiryInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
						<!-- End Line 4b -->
						<!-- Begin Line 5 -->
						<div class="styGenericDiv" style="width:187mm;height:50mm;padding-bottom:38mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:1mm;height:50mm;">5</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;height:31mm;" >
							   Did you satisfy the record retention requirement? To meet the record retention requirement, did you keep
							    a copy of any document(s) provided by the taxpayer that you relied on to determine eligibility or to 
							    compute the amount for the credit(s)? <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">........................</span>
									<br></br> <br></br>
							    In addition to your notes from the interview with the taxpayer, list 
							    those documents, if any, that you relied on.<br/>
							    <div class="styFixedUnderline" style="width:105mm;height:5.5mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:105mm;height:5.5mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:105mm;height:5.5mm;padding-top:3mm;background-color:lightgrey"></div>
								<div class="styFixedUnderline" style="width:105mm;height:5.5mm;padding-top:3mm;background-color:lightgrey"></div>	
							   <div class="styBB" style="width:105mm;padding-top:5.75mm;float:clear;background-color:lightgrey"></div>
							</div>
							<div class="styIRS8867ChildBox" style="height:13mm;padding-top:8mm;">
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:13mm;padding-top:8mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>						
							</div>
							<div class="styIRS8867ChildBox" style="height:13mm;padding-top:8mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SatisfyRecordRetentionRqrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSatisfyRecordRetentionRqrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</div>
								<div class="styIRS8867ChildBox" style="height:37mm;padding-top:3mm;padding-right:0mm;background-color:lightgrey"></div>
								<div class="styIRS8867ChildBox" style="height:37mm;padding-top:30mm;padding-right:0mm;background-color:lightgrey"></div>
								<div class="styIRS8867ChildBox" style="height:37mm;padding-top:30mm;padding-right:0mm;background-color:lightgrey;width:26mm;"></div>
							</div>
						<!-- End Line 5 -->
						<!-- Begin Line 6 -->
						<div class="styGenericDiv" style="width:187mm;height:10.5mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:1mm;height:10.5mm;">6</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;">
								<span style="float:left;clear:none;">Did you ask the taxpayer whether he/she could provide documentation to
								 substantiate their eligibility for and the amount of the credit(s) claimed on their return? <span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.......................</span>
</span>
							<div class="styBB" style="width:105mm;padding-top:.25mm;float:clear"></div>
								</div>
							<div class="styIRS8867ChildBox" style="height:10.5mm;padding-top:5.5mm;">
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
							   	<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:10.5mm;padding-top:5.5mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
								<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox"  style="height:10.5mm;padding-top:5.5mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstantiateCrEligibilityInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstantiateCrEligibilityInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
						</div>
						<!-- End Line 6 -->
						<!-- Begin Line 7 -->
						<div class="styGenericDiv" style="width:187mm;height:11mm;padding-top:0mm;">
							<div class="styLNLeftNumBox" style="height:11mm;padding-top:1mm;">7</div>
                            <div class="styIRS8867LNDesc" style="width:105mm;height:6mm;padding-left:.5mm;padding-top:1mm;">
								Did you ask the taxpayer if any of these credits were disallowed or reduced in a previous year?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.....................</span>  <br></br>
								(If credits were disallowed or reduced, go to question 7a; if not, go to question 8.)
								</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.3mm;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.3mm;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.3mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/PrevDisallowedOrReducedCrInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpPrevDisallowedOrReducedCrInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
						</div>
						<!-- End Line 7 -->
						<!-- Begin Line 7a -->
							<div class="styGenericDiv" style="width:187mm;height:8mm;padding-top:0mm;">
							<div class="styLNLeftNumBoxBB" style="height:8mm;padding-top:3mm;padding-left:5mm;">a</div>
						    <div class="styIRS8867ChildDesc"  style="height:12mm;padding-top:3mm;width:105mm;">
						    Did you complete the required recertification form(s)?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.........</span>
								<div class="styBB" style="width:105mm;padding-top:1.75mm;float:clear"></div>
								</div>
							<div class="styIRS8867ChildBox" style="height:8mm;padding-top:3mm;;" >
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm;padding-top:3mm;;;" >
								<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:8mm;padding-top:3mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/CompleteRequiredRecertFormInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpCompleteRequiredRecertFormInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
						<!-- End Line 7a -->
						<!-- Begin Line 8 -->
						<div class="styGenericDiv" style="width:187mm;height:9mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:1mm;height:8.25mm;">8</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;">
								<span style="float:left;clear:none;">If the taxpayer is reporting self-employment income, did you ask adequate
								 questions to prepare a complete and correct Form 1040, Schedule C?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">....</span>
 </span>
							<div class="styBB" style="width:105mm;padding-top:.85mm;float:clear"></div>
								</div>
							<div class="styIRS8867ChildBox" style="height:8.25mm;padding-top:3mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>							
							</div>
							<div class="styIRS8867ChildBox" style="height:8.25mm;padding-top:3mm;;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox"  style="height:8.25mm;padding-top:3mm;width:26mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/QstnToCompleteCorrectSchCInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpQstnToCompleteCorrectSchCInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
						</div>
						<!-- End Line 8 -->
						<!-- Page boundary -->
					
            <div style="float:left;">
              <span class="styBoldText">
                For Paperwork Reduction Act Notice, see separate instructions.
              </span>
            </div>
            <div style="float:right;">
              <span style="width:101px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8867</span> (2016)
            </div>
            <div style="float:right;width:26mm;font-size:7pt;">
              Cat. No. 26142H     
          </div>
					<div class="pageEnd" style="width:187mm;clear:all;">
					</div><br/><br/>
						<span style="float:left;clear:none;">Form 8867 (2016)</span>
						<span style="float:right;clear:none;">Page <span style="font-weight:bold;font-size:9pt;">2</span></span>
					<div class="styGenericDiv" style="width:187mm;height:.5mm;"></div>
						<!-- BEGIN Page 2 -->
						<div class="styBB" style="width:187mm;border-bottom-width:2px;"></div>
						<div class="styPartName" style="color:black;background-color:white;width:187mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:1.5mm;">Due Diligence Questions for Returns Claiming EIC <span style="font-weight:normal">(If the return does not claim EIC, go to question 10.)</span>
					</div>
					<div class="styBB" style="width:187mm;padding-top:2mm;float:clear"></div>
					<div class="styLNDesc" style="width:113mm;"></div>
					<div class="styIRS8867ChildBox" style="width:24mm;height:9mm;text-align:center;font-weight:normal;padding-right:2mm;border-bottom-width: 0px;"> EIC</div>					<div class="styIRS8867ChildBox" style="width:24mm;height:9mm;text-align:center;font-weight:normal;padding-right:2mm;border-bottom-width: 0px;"> CTC/ACTC</div>
					<div class="styIRS8867ChildBox" style="width:24mm;height:9mm;text-align:center;font-weight:normal;padding-right:2mm;border-bottom-width: 0px;"> AOTC</div>
					<div class="styBB" style="width:187mm;float:clear"></div>
					<!-- Begin Line 9 -->
						<div class="styGenericDiv" style="width:187mm;height:13.5mm;">
							<div class="styLNLeftNumBox" style="padding-top:1mm;height:15.05mm;">9a</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;height:12mm;" >
							   Did you explain to the taxpayer the rules about claiming the EIC when a child is the qualifying child of more than one person (tie-breaker rules), and have you determined that this taxpayer is, in fact, eligible to claim the EIC for the number of children for whom the EIC is claimed?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..............</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:13.5mm;padding-top:8.5mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainTiebreakerRulesInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
									</input>
						  	        <label>
							 			<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainTiebreakerRulesInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainTiebreakerRulesInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:13.5mm;padding-top:4.75mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:13.5mm;width:26mm;padding-top:4.75mm;background-color:lightgrey;border-right-width: 1px;"></div>
							</div>
					<!-- End Line 9a -->
					<!-- Begin Line 9b -->
						<div class="styGenericDiv" style="width:187mm;height:11mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:11mm;padding-left:3mm;">b</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;height:12mm;" >
							   Did you explain to the taxpayer that he/she may not claim the EIC if the taxpayer has not lived with the child for over half the year, even if the taxpayer has supported the child?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">...................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:6.3mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainLiveWithChldRqrClaimInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainLiveWithChldRqrClaimInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainLiveWithChldRqrClaimInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainLiveWithChldRqrClaimInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainLiveWithChldRqrClaimInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainLiveWithChldRqrClaimInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainLiveWithChldRqrClaimInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/EICDueDiligenceRqrGrp/ExplainLiveWithChldRqrClaimInd"/>
											<xsl:with-param name="BackupName">IRS8867EICDueDiligenceRqrGrpExplainLiveWithChldRqrClaimInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:11mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;"></div>
        					<div class="styIRS8867ChildBox" style="height:11mm;width:26mm;padding-top:4.75mm;background-color:lightgrey;border-bottom-width: 0px;border-right-width: 1px;" ></div>
							</div>
					<!-- End Line 9b -->
					<!-- Begin Line 10 -->
						<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<div class="styPartName" style="color:black;background-color:white;width:187mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:1.5mm;height:6mm;font-weight:normal;"><b>Due Diligence Questions for Returns Claiming CTC and/or additional CTC</b> (If the return does not claim CTC or Additional CTC, go to question 11.)</div>
						<div class="styBB" style="width:187mm;border-bottom-width:1px;padding-top:3mm;"></div>
					<!-- Begin Line 10a -->
						<div class="styGenericDiv" style="width:187mm;height:7.85mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:1mm;height:14mm;padding-left:0mm;">10a</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;" >
							   Does the child reside with the taxpayer who is claiming the CTC/ACTC? (If &#8220;Yes,&#8221; go to question 10c. If &#8220;No,&#8221; answer question 10b).<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..........</span>					</div>
							<div class="styIRS8867ChildBox" style="height:7.85mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:7.85mm;padding-top:3mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ChildLiveWithTaxpayerInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ChildLiveWithTaxpayerInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpChildLiveWithTaxpayerInd</xsl:with-param>
										</xsl:call-template>
									</input>	<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ChildLiveWithTaxpayerInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpChildLiveWithTaxpayerInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ChildLiveWithTaxpayerInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpChildLiveWithTaxpayerInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ChildLiveWithTaxpayerInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpChildLiveWithTaxpayerInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.85mm;width:26mm;background-color:lightgrey;border-right-width: 1px;"></div>
							</div>
					<!-- End Line 10a -->
					<!-- Begin Line 10b -->
						<div class="styGenericDiv" style="width:187mm;height:12mm;">
							<div class="styLNLeftNumBoxSD" style="padding-top:2mm;height:13mm;padding-left:4mm;">b</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:2mm;height:10mm;" >
							   Did you ask if there is an active Form 8332, Release/Revocation of Claim to Exemption for
							    Child by Custodial Parent, or a similar statement in place and, if applicable, did you attach it to
							     the return?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">............</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:12mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:12mm;padding-top:7mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ActiveForm8332SmlrStatementInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ActiveForm8332SmlrStatementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpActiveForm8332SmlrStatementInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ActiveForm8332SmlrStatementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpActiveForm8332SmlrStatementInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ActiveForm8332SmlrStatementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpActiveForm8332SmlrStatementInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/ActiveForm8332SmlrStatementInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpActiveForm8332SmlrStatementInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:12mm;width:26mm;background-color:lightgrey;border-right-width: 1px;" ></div>
							</div>
					<!-- End Line 10b -->
					<!-- Begin Line 10c -->
						<div class="styGenericDiv" style="width:187mm;height:7.5mm;">
							<div class="styLNLeftNumBoxSD" style="height:15mm;padding-left:4mm;">c</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;" >
							  Have you determined that the taxpayer has not released the claim to another person?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.......................</span>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.5mm;;background-color:lightgrey;border-bottom-width: 0px;"></div>
							<div class="styIRS8867ChildBox" style="height:7.5mm;padding-top:3mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DetermChildExemptClmReleaseInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DetermChildExemptClmReleaseInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDetermChildExemptClmReleaseInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DetermChildExemptClmReleaseInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDetermChildExemptClmReleaseInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DetermChildExemptClmReleaseInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDetermChildExemptClmReleaseInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CTCOrACTCDueDiligenceRqrGrp/DetermChildExemptClmReleaseInd"/>
											<xsl:with-param name="BackupName">IRS8867CTCOrACTCDueDiligenceRqrGrpDetermChildExemptClmReleaseInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.5mm;width:26mm;background-color:lightgrey;border-bottom-width: 0px;border-right-width: 1px;" ></div>
							</div>
					<!-- End Line 10c -->
					<!-- End Line 10 -->
					<!-- Begin Line 11 -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<div class="styPartName" style="color:black;background-color:white;width:187mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:1.5mm;height:6mm;font-weight:normal"><b>Due Diligence Questions for Returns Claiming AOTC</b> (If the return does not claim AOTC, go to <i>Credit Eligibility Certification</i>.)</div>
<div class="styBB" style="width:187mm;border-bottom-width:1px;"></div>
					<!-- Begin Line 11 -->
						<div class="styGenericDiv" style="width:187mm;height:7.75mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:1mm;height:7.8mm;">11</div>
							<div class="styIRS8867ChildDesc" style="width:105mm;padding-top:1mm;" >
							   Did the taxpayer provide substantiation such as a Form 1098-T and receipts for the qualified tuition and related expenses for the claimed AOTC?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">......</span>
							   <div class="styBB" style="width:105mm;padding-top:.5mm;float:clear"></div>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.75mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:7.75mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="width:26mm;height:7.75mm;padding-top:3mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstProvQlfyTuitionExpnssInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input><label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
									<input type="checkbox" class="styCkbox" alt="No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
									</input>
								<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/AOTCDueDiligenceRqrGrp/SubstProvQlfyTuitionExpnssInd"/>
											<xsl:with-param name="BackupName">IRS8867AOTCDueDiligenceRqrGrpSubstProvQlfyTuitionExpnssInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
							</div>
							</div>
					<!-- End Line 11 -->
					<!-- BEGIN Words Between 11 and 12 -->
							<div class="styIRS8867LNDesc" style="width:5mm;height:6mm;padding-left:2mm;">
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/></div>
							<div class="styIRS8867LNDesc" style="width:182mm;height:6mm;padding-left:2mm;float:none;">
							<b>You have complied with all due diligence requirements with respect to the credits claimed on the
							 return of the taxpayer identified above if you:</b></div>
							<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:3mm;padding-left:7.5mm;float:none;">
								A. Complete this Form 8867 truthfully and accurately and complete the actions described in this 
								 checklist for all credits claimed;	</div>
							<div class="styIRS8867LNDesc" style="padding-top:1mm;height:3mm;padding-left:7.5mm;">
B. Submit Form 8867 in the manner required;  </div>
							<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:6.5mm;padding-left:7.5mm;">
C. Interview the taxpayer, ask adequate questions, document the taxpayer’s responses on the return or in your notes, review  adequate<br/><span style="width:3.25mm"/> information to determine if the taxpayer is eligible to claim the credit(s) and in what amount(s); <b>and</b>		</div>
							<div class="styIRS8867LNDesc" style="width:3mm;height:3mm;padding-top:1mm;padding-left:7.5mm;">D. </div>
							<div class="styIRS8867LNDesc" style="width:165mm;height:6mm;padding-top:1mm;padding-left:3.5mm;">
Keep all five of the following records for 3 years from the latest of the dates specified in the Form 8867 Instructions under
<br/><i>Document Retention.</i></div>
							<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:4.5mm;padding-left:10.6mm;">
1. A copy of Form 8867,</div>
<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:4mm;padding-left:10.6mm;">
2. The applicable worksheet(s) or your own worksheet(s) for any credits claimed,</div>
<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:4mm;padding-left:10.6mm;">
3. Copies of any taxpayer documents you may have relied upon to determine eligibility for and the amount of the
credit(s),</div>
<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:4mm;padding-left:10.6mm;">
4. A record of how, when, and from whom the information used to prepare this form and worksheet(s) was obtained,
and</div>
<div class="styIRS8867LNDesc" style="width:187mm;padding-top:1mm;height:7mm;padding-left:10.6mm;">
5. A record of any additional questions you may have asked to determine eligibility for and amount of the credits, and the taxpayer’s <br/><span style="width:3.25mm"/>answers.</div>
				<div class="styIRS8867LNDesc" style="width:5mm;height:6mm;padding-left:2mm;padding-top:3mm;">
							<img alt="Bullet" src="{$ImagePath}/8867_Bullet.gif" height="9" width="9"/></div>
							<div class="styIRS8867LNDesc" style="width:182mm;height:9mm;padding-left:2mm;padding-top:3mm;float:none;">
							<b>If you have not complied with all due diligence requirements for all credits claimed, you may have 
							 to pay a $510 penalty for each credit for which you have failed to comply.</b></div>
					<div class="styGenericDiv" style="width:187mm;height:.5mm;"></div>
						<div class="styGenericDiv" style="width:187mm;height:2mm;"></div>	
					<!-- END Words Between 11 and 12 -->
					<!-- Begin Line 12 -->
					<div class="styBB" style="width:187mm;float:clear"></div>
					<div class="styPartName" style="color:black;background-color:white;width:187mm;padding-left:1.3mm;text-align:left;font-size:7pt;padding-top:1.5mm;height:6mm;">Credit Eligibility Certification </div>
					<div class="styBB" style="width:187mm;float:clear"></div>
						<div class="styGenericDiv" style="width:187mm;height:8.5mm;">
							<div class="styLNLeftNumBoxBB" style="padding-top:.5mm;height:7.95mm;">12</div>
							<div class="styIRS8867ChildDesc" style="width:107mm;padding-top:.5mm;" >
							   Do you certify that all of the answers on this Form 8867 are, to the best of your knowledge, true, correct and complete?<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..............</span>
							   <div class="styBB" style="width:107mm;padding-top:1.2mm;float:clear"></div>
							</div>
							<div class="styIRS8867ChildBox" style="height:7.85mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:7.85mm;background-color:lightgrey;"></div>
							<div class="styIRS8867ChildBox" style="height:7.85mm;text-align:right;padding-left:0mm;padding-top:3mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/CrEligibilityCertificationInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox" alt="Yes">
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
									<input type="checkbox" class="styCkbox" alt="No">
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
							</div>
							</div>
					<!-- End Line 12 --> 
					<div style="float:right;">
					  <span style="width:101px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8867</span> (2016)
					</div>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>