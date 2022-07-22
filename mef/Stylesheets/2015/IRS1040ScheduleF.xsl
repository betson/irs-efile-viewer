<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleFStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040SchFData" select="$RtnDoc/IRS1040ScheduleF"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040SchFData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="ExpenseDescriptionTxt" content="IRS Form 1040ScheduleF"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
					<!-- Form 1040ScheduleF CSS Styles are located in the template called below -->
					<xsl:call-template name="IRS1040ScheduleFStyle"/>
					<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form1040ScheduleF">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;height:21mm;">
						<div class="styFNBox" style="width:31mm;height:21mm;">
							<div style="padding-top:1mm;">
								<span class="styFormNumber" style="font-size:10pt;">SCHEDULE F</span>
								<span class="styFormNumber" style="font-size:9pt">(Form 1040)</span>
							</div>
							<div style="padding-top:4mm;">
								<span class="styAgency">Department of the Treasury</span>
								<!--  push pen -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData"/>
								</xsl:call-template>
								<br/>
								<span class="styAgency">Internal Revenue Service <span style="width:1mm"/> (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:20mm; padding-top:2mm;">
							<div class="styMainTitle" style="height:6mm;">Profit or Loss From Farming</div>
							<div class="styFBT" style="height:5mm;padding-top:1mm;">
								<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								 Attach to Form 1040, Form 1040NR, Form 1041, Form 1065, or Form 1065-B.
								<div class="styFST" style="height:5mm;padding-top:1mm;">
									<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="MediumBullet"/>
									 Information about Schedule F and its separate instructions is at 
									 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/schedulef" title="Link to irs.gov">
										<i>www.irs.gov/schedulef. </i>
									</a>
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm">
							<div class="styOMB" style="height:4mm;width:30mm;">OMB No. 1545-0074</div>
							<div class="styTaxYear">
								20<span class="styTYColor">15</span>
							</div>
							<div style="margin-left:3mm; text-align:left;">
								Attachment<br/>Sequence No. <span class="styBoldText">14</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Start Name and ID number  -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:135mm;font-size:7pt;height:10mm">
							Name of proprietor<br/>
							<!-- Template below address a choice of input data and Return Header data for 1120, 1065, 1040 and 1041-->
							<!--<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData"/>
							</xsl:call-template>-->
							<span>
							<!-- Choice between input name versus Name from 1120 (Parent/Subsidiary) 1040, 1040NR and 1041Return Headers Filer info -->
							<!--Input Name per schema-->
							<xsl:choose>
								<!-- Name from Form level -->
								<xsl:when test="normalize-space($Form1040SchFData/FarmProprietorName/BusinessNameLine1Txt) != ''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmProprietorName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmProprietorName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:when>
								<!-- Name from 1120/990/1065 Return Header-->
								<xsl:when test="$RtnHdrData/Filer/BusinessName">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<!-- Name from 1040 Return Header-->
								<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
								  <br/>
								  <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
								  </xsl:call-template>
								</xsl:when>
								<!-- Name from 1041 Return Header-->
								<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>									
								</xsl:when>
								<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd"/>
									</xsl:call-template>
									<br/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param> 
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>								
							</xsl:choose>
                            </span>
						</div>
						<div class="styEINBox" style="width:50mm;font-size:7pt;padding-left:2mm;font-weight:normal; text-align:left;;height:10mm">
							<b>Social security number (SSN)</b>
							<br/>
							<br/>
							<!-- Template below address a choice of input data and Return Header data for 1120, 1065, 1040 and 1041
							<xsl:call-template name="PopulateFilerTIN">
							  <xsl:with-param name="TargetNode" select="$Form1040SchFData"/>
							</xsl:call-template>-->
							<!-- Choice between input name versus Name from 1120 (Parent/Subsidiary) 1040, 1040NR and 1041Return Headers Filer info -->
							<xsl:choose>
								<xsl:when test="normalize-space($Form1040SchFData/SSN) != ''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<!--Choice from input versus 1040 return headers-->
								<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateFilerTIN">
							  <xsl:with-param name="TargetNode" select="$Form1040SchFData"/>
							</xsl:call-template>
									<!--<xsl:call-template name="PopulateSSN">
										  <xsl:with-param name="TargetNode" select="$Form1040SchFData/SSN"/>
								    </xsl:call-template>-->
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Box A-->
					<div class="styBB" style="width:187mm;">
					<div class="styLNLeftNumBox" style="width:3mm; height:15mm;padding-left:0px;">A</div>
						<div class="styNameBox" style="width:40mm;height:15mm;padding-top:0mm;font-size:7pt;border-right-width: 0px">
							<span style="float:left;">
								Principal crop or activity<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/PrincipalProductDesc"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Box B-->
						<div class="styForm1040ScheduleFEINFullBox" style="width:47mm;height:15mm;float:left;">
							<span><span style="width:2px;"/>B<span style="width:3mm"/>Enter code from Part IV</span>
							<br/><br/><br/>
							<span style="padding-left:11mm;">
								<img src="{$ImagePath}/1120_Bullet_Md.gif" alt="Bullet Image"/>
							</span>
							<span class="styEINFld" style="width:30mm;text-align:left;padding-left:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/AgriculturalActivityCd"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Box C-->
						<div class="styLNLeftNumBox" style="width:4mm;padding-left:2mm;padding-top:1mm;height:15mm;">C</div>
						<div class="styNameBox" style="width:41mm;height:15mm;padding-left:2mm;padding-top:1mm;font-size:7pt;">
							Accounting method:	<br/><br/><br/>
							<input type="checkbox" alt="Accounting Method Cash" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodCash</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MethodOfAccountingCashInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodCash</xsl:with-param>
								</xsl:call-template>
								Cash
							</label>
							<span style="width:24px;"/>
							<input type="checkbox" alt="Accounting Method Accrual" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodAccrual</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MethodOfAccountingAccrualInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFAccountingMethodAccrual</xsl:with-param>
								</xsl:call-template>
								Accrual
							</label>
						</div>
						<!-- Box D-->
						<div class="styEINBox" style="width:51mm;height:15mm;font-size:7pt;">
							<div class="styLNLeftNumBox" style="width:3mm;font-weight:bold;padding-left:1.5mm;">D</div>
							<span style="width:1.5mm;"/>
							<span style="padding-top:0mm;font-weight:bold;font-size:6pt;">Employer ID number (EIN), (see instr)</span>
							<br/>
							<span class="styEINFld" style="width:46mm;text-align:left;padding-left:2mm;font-weight:normal;padding-top:2mm">
								<br/><br/>
								<xsl:choose>
									<xsl:when test="normalize-space($Form1040SchFData/EIN) != ''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($Form1040SchFData/MissingEINReasonCd) != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<!--<xsl:when test="$RtnHdrData/Filer/EIN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">MissingEINReasonCd</xsl:with-param>
										</xsl:call-template>
									</xsl:when>									-->
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line E-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:3mm;padding-top:1.5mm;padding-left: 0px">E</div>
						<div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:1.5mm;">
							<span style="float:left;">
								Did you "materially participate" in the operation of this business during 2015? If "No," see instructions for limit on passive losses
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................................</span>
							</span>	          
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<br/>
							<input type="checkbox" alt="Materially Participate Indicator" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MateriallyParticipatedInd"/>
									<xsl:with-param name="BackupName">MateriallyParticipateIndicatorYesBox</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MateriallyParticipatedInd"/>
									<xsl:with-param name="BackupName">MateriallyParticipateIndicatorYesBox</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								 Yes
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<span style="width:5mm;"/>
							<br/>
							<input type="checkbox" alt="Materially Participate Indicator" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MateriallyParticipatedInd"/>
									<xsl:with-param name="BackupName">MateriallyParticipateIndicatorNoBox</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/MateriallyParticipatedInd"/>
									<xsl:with-param name="BackupName">Materially Participate Indicator No Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								No
							</label>
						</div>
					</div><br/>
					<!-- Line F-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:3mm;padding-top:3.5mm;padding-left: 0px">F</div>
						<div class="styLNDesc" style="width:152mm;height:4.5mm;padding-top:3.5mm;">
							<span style="float:left;font-size:7pt;">
								Did you make any payments in 2015 that would require you to file Form(s) 1099 (see instructions)?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>	          
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<br/>
							<input type="checkbox" alt="Required To File Forms 1099 Ind Yes Box" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind Yes Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind Yes Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								Yes
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<span style="width:5mm;"/>
							<br/>
							<input type="checkbox" alt="Required To File Forms 1099 Ind No Box" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind No Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredToFileForms1099Ind"/>
									<xsl:with-param name="BackupName">Required To File Forms 1099 Ind No Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								No
							</label>
						</div>
					</div><br/>
                    <!-- Line G -->
					<div style="width:187mm;font-size:pt">
						<div class="styLNLeftNumBox" style="width:3mm;padding-top:3.5mm;padding-left: 0px">G</div>
						<div class="styLNDesc" style="width:152mm;height:5mm;padding-top:3.5mm;font-size:6pt">
							<span style="float:left;;font-size:7pt;">
								If "Yes," did you or will you file required Forms 1099?  
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>	
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<br/>
								<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind Yes Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind Yes Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								Yes
							</label>
						</div>
						<div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
							<span style="width:5mm;"/>
							<br/>
								<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind No Box</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/RequiredForms1099FiledInd"/>
									<xsl:with-param name="BackupName">Required Forms 1099 Filed Ind No Box</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								No
							</label>
						</div>
					</div><br/><br/>
					<div class="styBB" style="width:187mm;"/>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;height:4mm">
						<div class="styPartName">Part I</div>
							<div class="styPartDesc">Farm Income&#8212;Cash Method.
						<span style="font-weight:normal;font-size:7pt;">Complete Parts I and II (Accrual method.
                                  Complete Parts II and III, and Part I, line 9.)</span>
						</div>
					</div>
					<!-- END Part I Title -->
					<!-- Line 1a-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;
						padding-left:3mm;padding-top:.5mm;"><b>1a</b></div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left;">
								Sales of livestock and other resale items (see instructions)    
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1a</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/SalesOfLvstckBghtForResaleAmt"/>
							</xsl:call-template>
						</div>
					<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;width:8mm;border-bottom-width:0px"></div>
					<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px"/>
					</div>
					<!-- Line 1b-->
					<div style="width:187mm;">
					<div  style="height:4mm;float:left;width:8mm;
						padding-left:5mm;padding-top:.5mm;"><b>b</b></div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
								Cost or other basis of livestock or other items reported on line 1a  
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CostOfLvstckBghtForResaleAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;width:8mm;;border-bottom-width:0px"></div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px">
						</div>
					</div>
					<!-- Line 1c-->
					<div style="width:187mm;">
					<div  style="height:4mm;float:left;width:8mm;
						padding-left:5mm;padding-top:.5mm;"><b>c</b></div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">Subtract line 1b from line 1a</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1c</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/PurchasedProfitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;;padding-top:.5mm;
						padding-left:3mm"><b>2</b></div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
								Sales of livestock, produce, grains, and other products you raised
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-right:1.5mm">2</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/SaleOfProductsRaisedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3a and b-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;padding-top:.5mm;padding-left:3mm"><b>3a</b></div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							Cooperative distributions (Form(s) 1099-PATR)
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CooperativeDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 3b</span>
							<span style="width:8px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CooperativeDistriTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4a and b-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;padding-top:.5mm;
						padding-left:3mm"><b>4a</b></div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">Agricultural program payments (see instructions)</div>
						<div class="styLNRightNumBox" style="height:4mm;">4a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/AgriculturalProgramPymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 4b</span>
							<span style="width:8px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/AgriculturalProgramPymtTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5a-->
					<div style="width:187mm;">
					<div  style="height:4mm;float:left;width:8mm;padding-top:1mm;
						padding-left:3mm"><b>5a</b></div>
						<div class="styLNDesc" style="width:139mm;height:4.5mm;">
							<span style="float:left">
								Commodity Credit Corporation (CCC) loans reported under election
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CCCLoanReportedElectionAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5a</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CCCLoanReportedElectionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5b and c-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;padding-top:0mm;
						padding-left:5mm"><b>c</b></div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
								CCC loans forfeited
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5b</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CCCLoansForfeitedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText">5c</span>
							<span style="width:8px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">5c</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="
$Form1040SchFData/FarmIncomeCashMethodGrp/CCCLoansForfeitedTaxableAmt"/>								
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6a and b-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;
						padding-left:3mm"><b>6</b></div>
						<div class="styLNDesc" style="width:139mm;height:4;">
						Crop insurance proceeds 
						and federal crop disaster payments (see instructions) </div>
					<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;width:8mm;border-bottom-width:0px"></div>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px"/>
					</div>
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;
						padding-left:5mm"><b>a</b></div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
						Amount received in 2015
						</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">6a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CropInsProcAndDsstrPymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:8px;"/>
							<span class="styBoldText"> 6b</span>
							<span style="width:8px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">6b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CropInsProcAndDsstrPymtTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6c and d-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;padding-top:2mm;
						padding-left:5mm"><b>c</b></div>
						<div class="styLNDesc" style="width:80mm;height:4mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="
$Form1040SchFData/FarmIncomeCashMethodGrp/ElectionDeferCropInsProcInd"/>									
									<xsl:with-param name="BackupName">IRS1040ScheduleFElectionToDeferCropInsProc</xsl:with-param>
								</xsl:call-template>
								If election to defer to 2016 is attached, check here
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/ElectionDeferCropInsProcInd"/>
								</xsl:call-template>
								<span style="width:5px;"/>
							</label>
							<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
						
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/ElectionDeferCropInsProcInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFElectionToDeferCropInsProc</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="width:59mm;height:4mm;">
							<span style="width:35px;"/>
							<span class="styBoldText" style="padding-top:1mm"> 6d</span>
							<span style="width:8px;"/>
							<!--<span style="float:left">-->
							Amount deferred from 2014
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">6d</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CropInsProcDefrdPrevTYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;padding-top:.5mm;
						padding-left:3mm"><b>7</b></div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
							Custom hire (machine work) income 
							<!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">7</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/CustomHireIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8-->
					<div style="width:187mm;">
						<div  style="height:4mm;float:left;width:8mm;padding-top:.5mm;
						padding-left:3mm"><b>8</b></div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
							Other income , including federal and state gasoline or fuel tax credit or refund (see instructions)
							<!--Dotted Line-->
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/OtherIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9-->
					<div class="styBB" style="width:187mm;">
					<div  style="height:4mm;float:left;width:8mm;padding-top:.5mm;
						padding-left:3mm"><b>9</b></div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span class="styBoldText">Gross income. </span>
							Add amounts in the right column (lines 1c, 2, 3b, 4b, 5a, 5c, 6b, 6d, 7, and 8).  If you use 
							<span style="float:left">
								the accrual method, enter the amount from Part III, line 50 (see instructions)
							</span>
							<span style="float:right;padding-right:0mm;">
								<span class="styDotLn" style="padding-right:1mm;">........</span>
																<span style="padding-right:4mm;">
									<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;padding-top:4mm">	9
						</div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm">            
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeCashMethodGrp/GrossIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- BEGIN Part II Line Items -->
					<div class="styBB" style="width:187mm;clear:both">
						<!-- BEGIN Left Side Table of Part II-->
						<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;height:4mm">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Farm Expenses&#8212;Cash and Accrual Method.
							<span style="font-weight:normal;"> Do not include personal or living expenses (see instructions).</span>
						</div>
					</div>
					<!-- END Part II Title -->
						<table class="styTable" style="width:94mm;float:left;clear:none;font-size:7pt;" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr><!-- Line 10-->
									<td class="styLNLeftNumBox" style="width:5mm;height: 9mm">10</td>
									<td class="styGenericDiv" style="width:48mm;height: 9mm">
										Car and truck expenses (see instructions). Also attach
										<br/>
											<span class="styBoldText" style="float:left">
											<b>Form</b> 4562</span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="styLNRightNumBox" style="height: 9mm;padding-top:5mm">10</td>
									<td class="styLNAmountBox" style="border-right-width:1px;height: 9mm;padding-top:5mm">
										
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/CarAndTruckExpensesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 11-->
									<td class="styLNLeftNumBox" style="width:5mm;">11</td>
									<td class="styGenericDiv" style="width:48mm" colspan="2">
										<span style="float:left">
											Chemicals
											<!--Dotted Line-->
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="styLNRightNumBox">11</td>
									<td class="styLNAmountBox" style="border-right-width:1px;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/ChemicalExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 12-->
									<td class="styLNLeftNumBox" style="vertical-align:top;width:5mm;">12</td>
									<td class="styGenericDiv" style="width:48mm" colspan="2">
										Conservation expenses (see 
										<span style="float:left">
											instructions)
											<!--Dotted Line-->
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</td>
									<td class="styLNRightNumBox" style="height: 7mm;padding-top:3.5mm">12</td>
									<td class="styLNAmountBox" style="border-right-width:1px;vertical-align:bottom;height: 7mm;;padding-top:3.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/ConservationExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 13-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">13</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Custom hire (machine work)
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm">13</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;padding-left:1mm;padding-top:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/CustomHireExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 14-->
									<td class="styLNLeftNumBox" style="height:7mm;width:5mm;">14</td>
									<td class="styGenericDiv" style="width:48mm;height:7mm;">
										Depreciation and section 179
										<span style="float:left">
											expense (see instructions)
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm">14</td>
									<td class="styLNAmountBox" style="border-right-width:1px;height:7mm;">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/DeprecAndSect179ExpnsDedAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 15-->
									<td class="styLNLeftNumBox" style="height:6mm;width:5mm;">15</td>
									<td class="styGenericDiv" style="width:48mm;height:6mm;" >Employee benefit programs 
										<span style="float:left">
											other than on line 23
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="styLNRightNumBox" style="height:8mm;padding-top:4mm">15</td>
									<td class="styLNAmountBox" style="height:8mm;border-right-width:1px;padding-top:1mm">
										<br/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/EmployeeBenefitProgramAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 16-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">16</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Feed
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">16</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/FeedPurchasedExpenseAmt"/>
										</xsl:call-template>
										</td>
								</tr>
								<tr><!-- Line 17-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">17</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Fertilizers and lime
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">17</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/FertilizerAndLimeExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 18-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">18</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">									
											Freight and trucking
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">18</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/FreightAndTruckingExpenseAmt"/>
										</xsl:call-template>
										</td>
								</tr>
								<tr><!-- Line 19-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">19</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Gasoline, fuel, and oil
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">19</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/GasolineFuelAndOilExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 20-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">20</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Insurance (other than health)
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">20</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/InsuranceAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 21-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">21</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">Interest: </td>
									<td class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;background-color:lightgrey;">
										<span style="width:1px;"/>
									</td>
								<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px;;border-bottom-width:0px;padding-left:1mm">
									</td>
								</tr><br/>
								<tr><!-- Line 21a-->
									<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;padding-left:4mm;width:7mm;">a</td>
									<td class="styGenericDiv" style="width:46mm;height:4.5mm;" colspan="2">Mortgage (paid to banks, 
										<span>
											etc.)
											<span style="width:1px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/MortgageInterestPaidBanksAmt"/>
											</xsl:call-template>
										</span>
								</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">21a</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px; vertical-align: bottom;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/MortgageInterestPaidBanksAmt"/>
										</xsl:call-template>
								</td>
								</tr>
								<tr><!-- Line 21b-->
									<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;padding-left:4mm;width:7mm;">b</td>
									<td class="styGenericDiv" style="width:46mm;height:4.5mm;" colspan="2">Other<span>
										
											<span style="width:1px;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/MortgageInterestPaidOtherAmt"/>
											</xsl:call-template>
													<span style="width:2mm"/>
											<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
										</span>
								</td>
									<td class="styLNRightNumBox" style="height:4.5mm;">21b</td>
									<td class="styLNAmountBox" style="height:4.5mm;border-right-width:1px; vertical-align: bottom;;padding-left:1mm">
									<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/MortgageInterestPaidOtherAmt"/>
										</xsl:call-template>
								</td>
								</tr>
								<tr><!-- Line 22-->
									<td class="styLNLeftNumBox" style="height:6mm;width:5mm;padding-bottom:4mm">22</td>
									<td class="styGenericDiv" style="width:48mm;height:6mm">Labor hired (less employment <br/>
									<span style="float:left">
										credits)
									</span>
									</td>
									<td class="styLNRightNumBox" style="height:6mm;border-bottom-width:0px;;padding-top:2.5mm">22</td>
									<td class="styLNAmountBox" style="height:6mm;border-right-width:1px;border-bottom-width:0px;padding-left:1mm;padding-top:2.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/LaborHiredExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- END Left Side table of Part II-->
						<!-- BEGIN Right Side table of Part II-->
						<table class="styTable" style="width:92.25mm;float:right;clear:none;font-size:7pt" cellspacing="0">
							<thead/>
							<tfoot/>
							<tbody>
								<tr><!-- Line 23-->
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:5mm;">23</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										Pension and profit-sharing plans 
								</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">23</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;vertical-align:bottom;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/PensionProfitSharingPlansAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 24-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">24</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
									Rent or lease <span style="font-size:6.0pt;">(see instructions)</span>: </td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7mm;width:7.25mm;
									border-bottom-width:0px;background-color:lightgrey;">
									</td>
									<td class="styLNRightNumBoxNBB" style="width:7mm;height:4.5mm;">
										<span style="width:1px;"/>
									</td>
								</tr>
								<tr><!-- Line 24a-->
									<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;padding-left:4mm;width:6mm;">a</td>
									<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">Vehicles, machinery, equipment
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">24a</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/MachineryAndEquipmentRentAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 24b-->
									<td class="styLNLeftLtrBox" style="height:4.5mm;width:6mm;padding-left:4mm;">b</td>
									<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Other (land, animals, etc.)
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">24b</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;padding-left:5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/OtherBusinessPropertyRentAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 25-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">25</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Repairs and maintenance
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-right:1.5mm">25</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/RepairsAndMaintenanceAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 26-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">26</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Seeds and plants
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-right:1.5mm">26</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;padding-left:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SeedAndPlantExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 27-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">27</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Storage and warehousing
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-right:1.5mm">27</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/StorageAndWarehousingExpnsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 28-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">28</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Supplies
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-right:1.5mm">28</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SuppliesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 29-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">29</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Taxes
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-right:1.5mm">29</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/TaxExpenseAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 30-->
									<td class="styLNLeftNumBox" style="height:4.5mm;width:5mm;">30</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										<span style="float:left">
											Utilities
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;padding-right:1.5mm">30</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/UtilitiesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 31-->
									<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:5mm;">31</td>
									<td class="styGenericDiv" style="width:48mm;height:4.5mm;" colspan="2">
										Veterinary, breeding, and medicine
									</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">31</td>
									<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;vertical-align:bottom;;padding-left:1mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/VtrnryBreedingMedicineExpnsAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr><!-- Line 32-->
									<td class="styLNLeftNumBox" style="height:4.5mm;">32</td>
									<td class="styGenericDiv" style="width:45mm;height:4.5mm;" colspan="2">Other expenses (specify): </td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.2mm;border-bottom-width:0px;background-color:lightgrey;">
									</td>
									<td class="styLNRightNumBoxNBB" style="width:7.25mm;height:4.5mm;">
									</td>
								</tr>
								<!-- Line 32 repeat begin for table with data but the last set of repeating data will not display a underline to separate the data from line 32f-->
								<xsl:if test="($Print != $Separated) or (count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt;= 5) ">
									<xsl:for-each select="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
										<tr>
											<td class="styLNLeftNumBox" style="height:4.5mm;vertical-align:top;width:4mm;padding-left:4mm;">
												<xsl:call-template name="AddPositionNumber"/>
												<xsl:if test="position() = 6 and not($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/
												TotalPreproductivePrdExpnsAmt)">f
	                                        </xsl:if>
											</td>
											<td class="styGenericDiv" style="width:48.5mm;height:4.5mm" colspan="2">
											<span style="width:1mm"/>
												<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ExpenseDescriptionTxt"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styLNRightNumBox" style="height:5.2mm;width:7.5mm;">
												<xsl:if test="position() &lt;= 5">
													32<xsl:call-template name="AddPositionNumber"/>
												</xsl:if>
												<xsl:if test="position() = 6 and not($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/
												TotalPreproductivePrdExpnsAmt)">32f
													<span>32f</span>
												</xsl:if>
											</td>
											<td class="styLNAmountBox" style="height:5.2mm;width:31mm;vertical-align:bottom">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExpenseAmt"/>
												</xsl:call-template>
												</td>
										</tr>
										<xsl:if test="position() = 5 and $Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt">
                                    </xsl:if>
									</xsl:for-each>
								</xsl:if>
								<!--Filler rows when there are no elements or the element does not exist-->
								<!-- Other Filler rows-->
								<xsl:if test="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt; 1 or 
								((count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5) and ($Print = $Separated))">
									<tr><!-- Line 32a-->
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:6mm;padding-left:4mm;">a</td>
										<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">32a</td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;;padding-left:1mm">
									</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt; 2 or 
								((count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5) 
								and ($Print = $Separated))">
									<tr><!-- Line 32b-->
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:6mm;padding-left:4mm;">b</td>
										<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">32b</td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;padding-left:1mm">
									</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt; 3 or ((count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5) and ($Print = $Separated))">
									<tr><!-- Line 32c-->
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:6mm;padding-left:4mm;">c</td>
										<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">32c</td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;padding-left:1mm">
									</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt; 4 or ((count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5) and ($Print = $Separated))">
									<tr><!-- Line 32d-->
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:6mm;padding-left:4mm;">d</td>
										<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
										<td class="styLNRightNumBox" style="height:4.5mm;width:7.25mm;">32d</td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31.5mm;padding-left:1mm">
									</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt; 5 or
								 ((count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5) and ($Print = $Separated))">
									<tr><!-- Line 32e-->
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:top;width:6mm;padding-left:4mm;">e</td>
										<td class="styGenericDiv" style="width:47mm;height:4.5mm;" colspan="2">
											<span class="styUnderlineAmount" style="width: 37mm;float: none; text-align:left;"/>
										</td>
									<td class="styLNRightNumBox" style="height:4.5mm;width:7.2mm;">32e</td>
										<td class="styLNAmountBox" style="height:4.5mm;width:31mm;padding-left:1mm">
									</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt;5">
                            </xsl:if>
	<xsl:if test="($Print = $Separated) or (count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &lt;= 5) ">
										<xsl:if test="position() = 5 and $Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt">
                              </xsl:if>
								</xsl:if>
									<tr>
										<td class="styLNLeftLtrBox" style="height:4.5mm;vertical-align:bottom;width:5mm;
										padding-left:4mm;">f</td>
										<td class="styGenericDiv" style="width:48mm;height:4.5mm;" >
										<span class="styGenericDiv" style="width: 47mm;float:none;
										text-align:left;border-top-width:1px;">
				                       <span style="width:1mm"/>
							<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" 
													select="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt/@section263AIndicatorCd"/>
												</xsl:call-template>
											</span>
										</td>
										<!-- Code for line f right of line 32-->
										<td class="styLNRightNumBox" style="height:5mm;width:7.2mm;border-bottom-width:0px;padding-top:1.5mm">32f</td>
										<td class="styLNAmountBoxNBB" style="vertical-align:bottom;height:5mm;width:31mm;">
											<xsl:if test="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt"/>
											</xsl:call-template>
											<xsl:if test="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt"/>
										</td>
									</tr>
							</tbody>
						</table>
						<!-- END Right Side Table of Part II-->
					</div>
					<!-- Line 33-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">33</div>
						<div class="styLNDesc" style="width: 139.7mm; height:4mm;">
							<span style="float:left">
								<span class="styBoldText">Total expenses. </span>
								Add lines 10 through 32f. If line 32f is negative, see instructions     
							</span>
							<span style="float:right;padding-right:0mm;">
								<span class="styDotLn" style="padding-right:2.2mm;">.......</span>
								<span style="padding-right:4mm;">
									<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>
							</span>
						</div>
                     	<div class="styLNRightNumBox" style="height:4mm;width:7.3mm">33</div>
						<div class="styLNAmountBox" style="height:4mm;width:31mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/TotalExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34   -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">34</div>
						<div class="styLNDesc" style="width: 139.7mm; height:4mm;">
							<span class="styBoldText">Net farm profit or(loss). </span>
                             Subtract line 33 from line 9 
   							<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part II Line 34 - Passive activity loss literal code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/PassiveActivityLossLiteralCd"/>
								</xsl:call-template>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;width:7.3mm">34</div>
						<div class="styLNAmountBox" style="height:4mm;width:31mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/NetFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<span style="padding-left:8mm">If a profit, stop here and see instructions for where to report.  If a loss, complete lines 35 and 36.</span> 
					<!-- Line 35-->
					<div style="width:187mm;">
					<div class="styLNLeftNumBox" style="height:4mm;">35</div>
					<div class="styLNDesc" style="height:4.5mm;width:140mm;">
							Did you receive an applicable subsidy in 2015? (see instructions)
		<span class="styDotLn" style="float:right;padding-right:2mm;">.............</span>
		 </div>
							<span style="width:10px"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								Yes
							</label>
							<span style="width:5mm;"/>
							<input type="checkbox" class="styCkbox" name="Checkbox">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SubsidyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleFSubsidyReceivedInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>
								No
							</label>
					</div><br/>
					<!-- Line 36-->
					<div class="styLNLeftNumBox">36</div>
						<div class="styLNDesc" style="width:148mm">
							Check the box that describes your investment in this activity and see instructions for where to report your loss.
							<div class="styLNDesc" style="width:70mm;height:4mm;">
								<span class="styBoldText">a</span>
								<span style="width:4px"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/AllInvestmentIsAtRiskInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFAllInvestmentIsAtRiskInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/AllInvestmentIsAtRiskInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFAllInvestmentIsAtRiskInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<span style="font-family: Arial Narrow; font-size: 8pt;">All investment is at risk. </span>
								</label>
							</div>
							<div class="styLNDesc" style="width:70mm;height:4mm;">
								<span style="width:20mm;"/>
								<span class="styBoldText">b</span>
								<span style="width:4px"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SomeInvestmentIsNotAtRiskInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFSomeInvestmentIsNotAtRisk</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/SomeInvestmentIsNotAtRiskInd"/>
										<xsl:with-param name="BackupName">IRS1040ScheduleFSomeInvestmentIsNotAtRisk</xsl:with-param>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<span style="font-family: Arial Narrow; font-size: 8pt;">Some investment is not at risk.</span>
								</label>
							</div>
						</div>
					<br/><br/><br/><br/>
						<div class="styBB" style="width:187mm;"/>
					<!-- Page Break-->
					<!-- Footer-->
					<div style="width:187mm;">
						<div style="float:left;">
							<span class="styBoldText"> For Paperwork Reduction Act Notice, see the separate instructions. </span>
							<span style="width:80px;"/>                        
							Cat. No. 11346H 
						</div>
						<div style="float:right;">
							<span style="width:20px;"/>
							<span class="styBoldText">Schedule F (Form 1040) 2015 </span>
						</div>
					</div>
					<p style="page-break-before:always"/>
					<!--Begin Page 2 -->
					<!-- Header -->
					<div class="styBB" style="width:187mm;">
						<div style="float:left;">Schedule F (Form 1040) 2015 <span style="width:130mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span>
						</div>
					</div>
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width:187mm;height:4mm">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Farm Income&#8212;Accrual Method <span class="styNormalText">(see instructions). </span>
						</div>
					</div>
					<!-- END Part III Title -->
					<!-- Line 37-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">37</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">        
							 Sales of livestock, produce, grains, and other products (see instructions) 
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">37</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/SalesLivestockProduceProdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38a and 38b-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">38a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">Cooperative distributions (Form(s) 1099-PATR) </div>
						<div class="styLNRightNumBox" style="height:4mm;">38a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CooperativeDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:2px;"/>
							<span class="styBoldText"> 38b</span>
							<span style="width:2px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">38b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CooperativeDistriTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39a and b-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width: 139mm;"/>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">39a</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
								Agricultural program payments
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">39a</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/AgriculturalProgramPymtAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:2px;"/>
							<span class="styBoldText"> 39b</span>
							<span style="width:2px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">39b</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/AgriculturalProgramPymtTxblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">40</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">Commodity Credit Corporation (CCC) loans: </div>
					<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;
						height:5.5mm;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:5.5mm;;border-bottom-width:0px;"/>
					</div>
					<!-- Line 40a-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">a</div>
						<div class="styLNDesc" style="width:139mm;height:4mm;">
							<span style="float:left">
								CCC loans reported under election
								<span style="width:1px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CCCLoanReportedElectionAmt"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.5mm">40a</div>
						<div class="styLNAmountBox" style="height:5.25mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CCCLoanReportedElectionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40b and c-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4mm;padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:67.5mm;height:4mm;">
							<span style="float:left">
								CCC loans forfeited
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">40b</div>
						<div class="styLNAmountBox" style="width: 32mm;border-bottom-width:1px;height:4mm;border-right-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CCCLoansForfeitedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:31.5mm;height:4mm;">
							<span style="width:2px;"/>
							<span class="styBoldText">40c</span>
							<span style="width:2px;"/>
							Taxable amount
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">40c</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CCCLoansForfeitedTaxableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 41-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">41</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">
								Crop insurance proceeds        
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">41</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CropInsProcAndDsstrPymtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 42-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">42</div>
						<div class="styLNDesc" style="width: 139mm;">						       
							<span style="float:left">Custom hire (machine work) income 	</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">42</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CustomHireIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 43-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">43</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">Other income (see instructions) </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">43</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/AccrualOtherIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">44</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">        
							<span style="float:left">Add amounts in the right column for lines 37 through 43 (lines 37, 38b, 39b, 40a, 40c, 41, 42, and 43) </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNRightNumBox">44</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/TotalIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 45-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">45</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
								Inventory of livestock, produce, grains, and other products at beginning of 
							<span style="float:left">
								the year.  Do not include sales reported on Form 4797.  
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">45</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/InventoryOfProductsAtBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;
						height:8mm;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:8mm;;border-bottom-width:0px;"/>
					</div>
					<!-- Line 46-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">46</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							Cost of livestock, produce, grains, and other products purchased during
							<span style="float:left">
								the year
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;">46</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:7mm;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CostOfProductsPrchsDuringYrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;
						height:7mm;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:7mm;border-bottom-width:0px;"/>
						</div>
					<!-- Line 47-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">47</div>
						<div class="styLNDesc" style="width:99mm;height:4mm;">
							<span style="float:left">
								Add lines 45 and 46    
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">47</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/InvntryAtBOYPlusCostOfPrchsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;
						height:4mm;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
					</div>
					<!-- Line 48-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">48</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left">
								Inventory of livestock, produce, grains, and other products at end of year 
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">48</div>
						<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/InventoryOfProductsAtEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="width=8.25mm;background-color:lightgrey;
						height:4mm;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
					</div>
					<!-- Line 49-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">49</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">        
								Cost of livestock, produce, grains, and other products sold. Subtract line 48 from line 47*      
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">49</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/CostOfProductsSoldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 50-->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">50</div>
						<div class="styLNDesc" style="width: 139mm; height:4mm;">
							<span style="float:left">
								<span class="styBoldText">Gross income. </span>
									Subtract line 49 from line 44. Enter the result here and on Part 1, line 9          
							</span>
							<span style="float:right;padding-right:0mm;">
								<span class="styDotLn" style="padding-right:2.2mm;">.....</span>
								<span style="padding-right:4mm;">
									<img src="{$ImagePath}/1040SchF_Bullet_Sm.gif" alt="Bullet Image"/>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;">50</div>
						<div class="styLNAmountBoxNBB" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmIncomeAccrualMethodGrp/GrossIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Page 2 "if" line-->
					<div class="styBB" style="width:187mm;">
						<div class="styLNDesc" style="width: 187mm; height:8mm;">  
							*If you use the unit-livestock-price method or the farm-price method of valuing inventory and the amount on line 48 is larger than the amount on
							line 47, subtract line 47 from line 48. Enter the result on line 49. Add lines 44 and 49. Enter the total on line 50 and on Part I, line 9.      
						</div>
					</div>
					<!--Footer -->
					<div style="width:187mm;">
						<div class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
							<span style="width:156px"/>
						</div>
						<div class="stySmallText" style="width:46mm;text-align:right;">
							<span class="styBoldText" style="font-weight:bold;">Schedule F (Form 1040) 2015</span>
						</div>
					</div>
					<br/>
					<br class="pageEnd"/>
					<p style="page-break-before:always"/>
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
							<xsl:with-param name="TargetNode" select="$Form1040SchFData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II Line 34 - Passive activity loss literal code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040SchFData/FarmExpensesGrp/PassiveActivityLossLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Begin separated repeating data table -->
					<xsl:if test="($Print = $Separated and (count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense) &gt; 5))">
						<xsl:variable name="CountExpenses" select="count($Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense)"/>
						<span class="styRepeatingDataTitle">Form 1040 Schedule F, Part II, Line 32 - Other expenses (specify):</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:130mm;" colspan="2">(a) Description</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;" colspan="2">(b) Amount</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/OtherFarmExpense">
									<tr>
										<xsl:if test="position() &gt; 5">
											<xsl:choose>
												<xsl:when test="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt">
													<xsl:attribute name="class">
													<xsl:choose>
																			<xsl:when test="position() mod 2 = 0">styDepTblRow2
																			</xsl:when>
																			<xsl:otherwise>styDepTblRow1
																			</xsl:otherwise>
													</xsl:choose></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
										<xsl:if test="position() &lt;=5">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										</xsl:if>
										<td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid 0px;font-weight:bold;">
											<xsl:call-template name="AddPositionNumber"/>
										</td>
										<td class="styDepTblCell" style="width:122mm;height:4.5mm;text-align:left;border-left:1 solid 0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ExpenseDescriptionTxt"/>
											</xsl:call-template>
										</td>
										<td class="styDepTblCell" style="height:4.5mm;vertical-align:top;width:8mm;border-right:1 solid 0px;font-weight:bold;text-align:center;">
										<xsl:if test="position() &lt;= 5">
													32<xsl:call-template name="AddPositionNumber"/>
												</xsl:if>
										</td>
										<td class="styDepTblCell" style="height:4.5mm;width:50mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExpenseAmt"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
									</tr>
								</xsl:for-each>
								<!-- Line f will be displayed if the element  "TotalPreproductivePeriodExpnss" exists.  If not then the regular iteration would continue and line f would be displayed with description and amount-->
									<xsl:if test="$Form1040SchFData/FarmExpensesGrp/OtherFarmExpensesGrp/TotalPreproductivePrdExpnsAmt">
									
									</xsl:if>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddPositionNumber">
		<xsl:if test="position()=1">a</xsl:if>
		<xsl:if test="position()=2">b</xsl:if>
		<xsl:if test="position()=3">c</xsl:if>
		<xsl:if test="position()=4">d</xsl:if>
		<xsl:if test="position()=5">e</xsl:if>
	</xsl:template>
</xsl:stylesheet>