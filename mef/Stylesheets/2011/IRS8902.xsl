<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8902Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8902"/>
	<xsl:template match="/">
		<html xmlns="http://www.irs.gov/efile" xmlns:efile="http://www.irs.gov/efile">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8902"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8902Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<!-- Form modified for displaying '%' percent sign to each row for columns "Percent of US Ownership" and "Ownership Percentage " in Part III and Part IV -->
				<!--Note Part IV line 23-28 column width do not match with Part IV line 1-22 this is IE limitation issues-->
				<form name="Form8902">
					<xsl:call-template name="DocumentHeader"/>
					<div style="width:187mm;">
						<div class="styFNBox" style="width:32mm;height:18.75mm;">
							<div>
								<span style="padding-top:1mm;">Form<span style="width:6px;"/>
								</span>
								<span class="styFormNumber">8902</span>
							</div>
							<div class="styAgency" style="width:22mm;">(December 2007)
    <span style="width:1mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</div>
							<div>
								<span class="styAgency">Department of the Treasury</span>
								<span style="width:20px;"/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:18.75mm;">
							<div class="styMainTitle">Alternative Tax on Qualifying Shipping Activities</div>
							<div class="styFBT" style="font-size: 7pt;padding-top:2.5mm;">
								<img src="{$ImagePath}/8902_Bullet_Sm.gif" alt="Right black arrow for attachments" width="7"/>
								<span style="width:6px;"/>Attach to the corporation’s income tax return.</div>
							<div class="styFBT" style="font-size: 7pt;padding-top:.5mm;">
								<img src="{$ImagePath}/8902_Bullet_Sm.gif" alt="Right black arrow for attachments" width="7"/>
								<span style="width:6px;"/>See separate Instructions.</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:18.95mm;">
							<span style="width:110px;"/>
							<span style="width:110px;padding-top: 4mm">OMB No.1545-1968</span>
						</div>
					</div>
					<!-- Parent Corporation Name and EIN -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styNameBox" style="width:133mm;">Name of corporation (common parent, if consolidated return)<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="font-weight:bold;width:50mm;padding-left:2mm;">
    		Employer identification number
  		<span style="width:50mm;text-align:left;font-weight:normal;font-size:7pt;padding-top:2.5mm;">
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--Subsidiary Name and EIN -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:133mm;">Name of subsidiary (if consolidated return)<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryName/BusinessNameLine1"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryName/BusinessNameLine2"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="font-weight:bold;width:50mm;padding-left:2mm;">
  		        Employer identification number<br/>
							<xsl:if test="$FormData/EmployerIdentificationNumber">
								<span style="width:50mm;text-align:left;font-weight:normal;font-size:7pt;padding-top:6mm;">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EmployerIdentificationNumber"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$FormData/MissingEINReason">
								<span style="width:50mm;text-align:left;font-weight:normal;font-size:7pt;padding-top:6mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<!-- Part I  -->
					<div class="styBB" style="width:187mm;border-top-width:0px;padding-bottom:1.5mm;padding-top:1.5mm;">
						<span class="styPartName" style="width:16mm;">Part I</span>
						<!--Part I-->
						<span style="width:150mm;" class="styPartDesc">Section 1354 Election or Termination</span>
					</div>
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:7mm;padding-top:3mm;">
							<input alt="IRS8902PriorTaxYearElection" type="checkbox" class="sty6Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PriorTaxYearElection"/>
									<xsl:with-param name="backupName">IRS8902PriorTaxYearElection</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/PriorTaxYearElection"/>
									<xsl:with-param name="BackupName">IRS8902PriorTaxYearElection</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="font-weight:bold;width:4mm;padding-top:5mm;">A</div>
						<!-- A-->
						<div class="styGenericDiv" style="width:160mm;padding-top:5mm;">
     	The corporation previously made a valid and timely section 1354 election effective for the tax year<br/>beginning
		<span style="width:4px;"/>
							<span class="styUnderlineAmount" style="width:20mm; float:none;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYearBeginningDate"/>
								</xsl:call-template>
							</span>
							<span style="width:4px;"/>
 		, and ending 
 		<span style="width:4px;"/>
							<span class="styUnderlineAmount" style="width:20mm; float:none;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/TaxYearEndingDate"/>
								</xsl:call-template>
							</span> .
   	</div>
					</div>
					<br/>
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:7mm;">
							<input alt="IRS8902CurrentSubsequentTYElection" type="checkbox" class="sty6Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentSubsequentTYElection"/>
									<xsl:with-param name="backupName">IRS8902CurrentSubsequentTYElection</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentSubsequentTYElection"/>
									<xsl:with-param name="BackupName">IRS8902CurrentSubsequentTYElection</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="font-weight:bold;width:4mm;padding-top:2mm;">B</div>
						<!-- B-->
						<div class="styGenericDiv" style="width:160mm;padding-top:2mm;">The corporation is making a section 1354 election for this tax year and all succeeding tax years.
     </div>
					</div>
					<br/>
					<div style="width:187mm;">
						<div class="styGenericDiv" style="width:7mm;">
							<input alt="IRS8902RevokingElection" type="checkbox" class="sty6Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/RevokingElection"/>
									<xsl:with-param name="backupName">IRS8902RevokingElection</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/RevokingElection"/>
									<xsl:with-param name="BackupName">IRS8902RevokingElection</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="font-weight:bold;width:4mm;padding-top:2mm;">C</div>
						<!-- C-->
						<div class="styGenericDiv" style="width:160mm;padding-top:2mm;">
     	The corporation is revoking its election under section 1354(d)(1) for its tax year beginning<br/>
							<span style="width:4px;"/>
							<span class="styUnderlineAmount" style="width:20mm; float:none;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/RevokingTaxYearBeginningDate"/>
								</xsl:call-template>
							</span>
							<span style="width:4px;"/>
		, and ending
          <span style="width:4px;"/>
							<span class="styUnderlineAmount" style="width:20mm; float:none;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/RevokingTaxYearEndingDate"/>
								</xsl:call-template>
							</span> .
      </div>
					</div>
					<br/>
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:7mm;">
							<input alt="IRS8902ElectAutomaticallyTerminated" type="checkbox" class="sty6Ckbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ElectAutomaticallyTerminated"/>
									<xsl:with-param name="backupName">IRS8902ElectAutomaticallyTerminated</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ElectAutomaticallyTerminated"/>
									<xsl:with-param name="BackupName">IRS8902ElectAutomaticallyTerminated</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styGenericDiv" style="width:4mm;font-weight:bold;padding-top:2mm;">D</div>
						<!-- D-->
						<div class="styGenericDiv" style="width:160mm;padding-top:2mm;">
        		The corporation’s election was automatically terminated under section 1354(d)(2) because the corporation ceased to be a qualifying vessel operator effective
        		<span style="width:4px;"/>
							<span class="styUnderlineAmount" style="width:20mm; float:none;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/EffectiveDate"/>
								</xsl:call-template>
							</span> . <br/>
							<br/>
						</div>
					</div>
					<!-- Part II  code -->
					<div class="styBB" style="width:187mm;padding-bottom:1.5mm;padding-top:1.5mm;">
						<div class="styPartName" style="width:16mm;border-top-width:1px;border-color:black;">Part II</div>
						<span style="width:158mm;" class="styPartDesc">Other Information (see instructions)
  		<span style="width:1px;"/>
						</span>
					</div>
					<!-- line E -->
					<div style="width:187mm; padding-top:3mm">
						<div style="float:left">
							<div class="styGenericDiv" style="width:4mm;"/>
							<div class="styIRS8902LeftLtr" style="padding-top:2mm;">E</div>
							<div style="float:left;padding-top:2mm;">
			Is the corporation a member of an electing group?
		</div>
						</div>
						<div style="float:right">
							<span class="styDotLn" style="padding-top:2mm;">  
			...................
		</span>
							<span style="width:13mm;padding-top:1mm;">
								<input type="checkbox" class="sty6Ckbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MemberOfElectingGroup"/>
										<xsl:with-param name="BackupName">MemberOfElectingGroup</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/MemberOfElectingGroup"/>
										<xsl:with-param name="BackupName">MemberOfElectingGroup</xsl:with-param>
									</xsl:call-template>
				Yes
			</label>
							</span>
							<span style="width:7mm;"/>
							<span style="width:12.5mm;padding-top:1mm;">
								<input type="checkbox" class="sty6Ckbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MemberOfElectingGroup"/>
										<xsl:with-param name="BackupName">MemberOfElectingGroup</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/MemberOfElectingGroup"/>
										<xsl:with-param name="BackupName">MemberOfElectingGroup</xsl:with-param>
									</xsl:call-template>
				No
			</label>
							</span>
						</div>
					</div>
					<div style="width:187mm;">
						<div style="float:left">
							<div class="styGenericDiv" style="width:4mm;"/>
							<div class="styIRS8902LeftLtr" style=""/>
							<div style="float:left;">
     			If “No,” skip item F and go to item G.
     	</div>
						</div>
					</div>
					<!-- line E -->
					<!-- line F -->
					<div style="width:187mm; padding-top:2mm">
						<div class="styGenericDiv" style="width:4mm;"/>
						<div class="styIRS8902LeftLtr">F</div>
						<!-- F-->
						<div style="float:left;">
         		If the answer to item E is “Yes”:
     </div>
					</div>
					<div class="IRS8902Container" style="padding-top:2mm;">
						<div class="IRS8902Index">(1)</div>
						<!-- 1-->
						<div class="IRS8902LongDesc" style="width:66mm;border-right-width:0px;">
			How many corporations are in the electing group?
		</div>
						<div style="float:right; margin-right:1mm;">
							<div class="styDotLn">................</div>
							<div class="styGenericDiv" style="padding-left:1.5mm;padding-right:1.5mm;">
								<img src="{$ImagePath}/8902_Bullet_Sm.gif" alt="Right Black Arrow for number of corporations" border="0"/>
							</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NumberOfCorporations"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index">(2)</div>
						<!-- 2-->
						<div class="IRS8902LongDesc" style="width:103mm;border-right-width:0px;">
			Enter the number of vessels included under the election for the electing group 
		</div>
						<div style="float:right; margin-right:1mm;">
							<div class="styDotLn">.......</div>
							<div class="styGenericDiv" style="padding-left:1.5mm;padding-right:1.5mm;">
								<img src="{$ImagePath}/8902_Bullet_Sm.gif" alt="Right Black Arrow for number of vessels" border="0"/>
							</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NumberOfVessels"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;padding-top:1.5mm;">
						<div class="IRS8902Index" style="">(3)</div>
						<div class="IRS8902LongDesc" style="width:134mm;border-right-width:0px;">
		Does any member of the electing group have income from qualifying secondary activities or
	</div>
					</div>
					<div style="width:187mm;padding-top:0mm;">
						<span style="float:left;padding-top:1mm;">
							<span class="IRS8902Index" style="width:18mm;"/>
							<span class="IRS8902LongDesc" style="width:42mm;border-right-width:0px;">
					qualifying incidental activities?
				</span>
						</span>
						<div style="float:right;">
							<span class="styDotLn" style="padding-top:1mm;">  
			......................
		</span>
							<span class="styGenericDiv" style="width:13mm;margin-right:1mm;padding-top:0mm;">
								<input type="checkbox" class="sty6Ckbox" name="Checkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromSecIncidentalActy"/>
										<xsl:with-param name="BackupName">IRS8902IncomeFromSecIncidentalActy</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromSecIncidentalActy"/>
										<xsl:with-param name="BackupName">IRS8902IncomeFromSecIncidentalActy</xsl:with-param>
									</xsl:call-template>
          Yes
        </label>
							</span>
							<span class="styGenericDiv" style="width:7mm;padding-top:0mm;"/>
							<span class="styGenericDiv" style="width:12.5mm;margin-right:1mm;padding-top:0mm;">
								<input type="checkbox" class="sty6Ckbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromSecIncidentalActy"/>
										<xsl:with-param name="BackupName">IRS8902IncomeFromSecIncidentalActy</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromSecIncidentalActy"/>
										<xsl:with-param name="BackupName">IRS8902IncomeFromSecIncidentalActy</xsl:with-param>
									</xsl:call-template>
          No
        </label>
							</span>
						</div>
						<div class="IRS8902Container" style="padding-top:0mm;">
							<div class="IRS8902Index" style="width:18mm;"/>
							<div class="IRS8902LongDesc" style="width:127mm;border-right-width:0px;">
			If “Yes,” attach to Form 8902 a worksheet that provides the information requested in item G for
			each such member of the electing group.
		</div>
						</div>
					</div>
					<!--end  line F -->
					<!-- line G -->
					<div style="width:187mm; padding-top:4mm">
						<span class="styGenericDiv" style="width:4mm;"/>
						<span class="styIRS8902LeftLtr">G</span>
						<!-- G-->
						<span style="float:left;">
							Enter the corporation’s gross income from:
						 </span>
					</div>
					
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index" style="width:18mm;">(1)</div>
						<!-- 1-->
						<div class="IRS8902LongDesc" style="width:34mm;border-right-width:0px;">
			Core qualifying activities
		</div>
						<div style="clear:none;float:right; margin-right:1mm;">
							<span class="styDotLn">........................</span>
							<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;">$
		 	</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CorpGrossIncomeCoreQlfyActy"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index">(2)</div>
						<!-- 2-->
						<div class="IRS8902LongDesc" style="width:44mm;border-right-width:0px;">
			Qualifying secondary activities:
		</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index" style="width:26mm;">(a)</div>
						<!-- a-->
						<div class="IRS8902LongDesc" style="width:40mm;border-right-width:0px;">
			Amount included in 20% limit
		</div>
						<div style="clear:none;float:right; margin-right:1mm;">
							<span class="styDotLn">.....................</span>
							<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;">$
			</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfySecActyIncluded20PctLimit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index" style="width:26mm;">(b)</div>
						<!-- b-->
						<div class="IRS8902LongDesc" style="width:48mm;border-right-width:0px;">
			Amount that exceeds the 20% limit
		</div>
						<div style="clear:none;float:right; margin-right:1mm;">
							<span class="styDotLn">...................</span>
							<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;">$
		 	</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfySecActyExceeding20PctLimit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index">(3)</div>
						<!-- 3-->
						<div class="IRS8902LongDesc" style="width:42mm;border-right-width:0px;">
			Qualifying incidental activities:
		</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index" style="width:26mm;">(a)</div>
						<!-- a-->
						<div class="IRS8902LongDesc" style="width:46mm;border-right-width:0px;">
			Amount included in the 0.1% limit
		</div>
						<div style="clear:none;float:right; margin-right:1mm;">
							<span class="styDotLn">...................</span>
							<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;">$
		 	</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyIncdtlActyIncldHalfPctLmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="IRS8902Container" style="padding-top:1.5mm;">
						<div class="IRS8902Index" style="width:26mm;">(b)</div>
						<!-- b-->
						<div class="IRS8902LongDesc" style="width:49mm;border-right-width:0px;">
			Amount that exceeds the 0.1% limit
		</div>
						<div style="clear:none;float:right; margin-right:1mm;">
							<span class="styDotLn">..................</span>
							<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;">$
		 	</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyIncdtlActyExcHalfPctLimit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- line G -->
					<!-- line H -->
					<div style="clear:both;width:188mm;padding-top:2mm">
						<div class="styGenericDiv" style="width:4mm;"/>
						<!-- H -->
						<div class="styIRS8902LeftLtr">H</div>
						<div class="IRS8902LongDesc" style="width:103mm;border-right-width:0px;">
         	Gross income from qualifying shipping activities excluded from gross income <br/>
		on the corporation’s income tax return. Add lines G(1), G(2)(a), and G(3)(a)
	</div>
						<div style="float:right;margin-right:1mm;">
							<div class="styDotLn" style="padding-top:6mm;">.........</div>
							<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;padding-top:6mm;">$</div>
							<div class="styUnderlineAmount" style="width:32mm;border-style:solid;text-align:right;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GrossIncome"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- line H -->
					<div class="styBB" style="width:187mm;">
						<span style="width:1px"/>
					</div>
					<!-- Page 1 Footer -->
					<div class="styIRS8902PageBreak" style="width:187mm;padding-top:1mm;border-top:1px;">
						<div style="float:left;width:100mm;font-weight:bold;">For Paperwork Reduction Act Notice, see separate instructions.</div>
						<div style="width:35mm;float:left;">Cat. No. 37711U</div>
						<div style="float:right;">Form 
  		<span style="font-weight:bold;">8902</span> (12-2007)
  	</div>
					</div>
					<!--Page 2 start-->
					<div class="styGenericDiv" style="width:187mm;padding-bottom:.5mm;">
						<div style="float:left">Form 8902 (12-2007)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!--Part III -->
					<!-- Part III Repeating table Begin -->
					<xsl:if test="$FormData/VesselInformation and ($Print != $Separated or count($FormData/VesselInformation) &lt;= 4)">
						<!-- Populating columns of property data -->
						<xsl:for-each select="$FormData/VesselInformation">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<div class="styBB" style="width:187mm;border-top-width:2px;padding-bottom:1.5mm;padding-top:1.5mm;border-color;red;">
									<span class="styPartName" style="width:16mm;">Part III</span>
									<span style="width:151mm;" class="styPartDesc"> Vessel Information
  </span>
								</div>
								<div class="sty8902TableContainerNBB">
									<table class="styTable" cellspacing="0" style="font-size:7pt;">
										<tr>
											<th style="width:58mm;border:none;text-align:center;padding-left:6mm;font-weight:medium;">
                  Description
                </th>
											<th class="styTableCell" style="text-align:center;font-weight:bold;border-left-width:1px;">
												<xsl:number value="position()" format="A"/>
												<span class="styTableCellPad"/>
											</th>
											<th class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +1" format="A"/>
												<span class="styTableCellPad"/>
											</th>
											<th class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +2" format="A"/>
												<span class="styTableCellPad"/>
											</th>
											<th class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +3" format="A"/>
												<span class="styTableCellPad"/>
											</th>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">1</div>
													<div class="styGenericDiv">
                       Vessel name
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="text-align:left;border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="VesselName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/VesselName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/VesselName"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/VesselName"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">2</div>
													<div class="styGenericDiv">
                      IMO number
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IMONumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/IMONumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/IMONumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/IMONumber"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">3</div>
													<div class="styGenericDiv">
                       USCG VIN number
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">......</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USCGVINNumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/USCGVINNumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/USCGVINNumber"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/USCGVINNumber"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">4</div>
													<div class="styGenericDiv"> 
                     Flag
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">...........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Flag"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/Flag"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/Flag"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/Flag"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">5</div>
													<div class="styGenericDiv">
                       Date flagged                                          
                    </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DateFlagged"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/DateFlagged"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/DateFlagged"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/DateFlagged"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">6</div>
													<div class="styGenericDiv">
                       Vessel type                                          
                       </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="VesselType"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/VesselType"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/VesselType"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/VesselType"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">7</div>
													<div class="styGenericDiv">
                      Vessel used in U.S. foreign trade?                                         
                       </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:left;">
												<span style="width:12mm;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
													</xsl:call-template>
													<input type="Checkbox" class="styCkbox">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
														<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
													</xsl:call-template>
             			 Yes
            		</label>
												<br/>
												<span style="width:12mm;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
													</xsl:call-template>
													<input type="Checkbox" class="styCkbox">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
														<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
													</xsl:call-template>
             			 No
            		</label>
											</td>
											<xsl:choose>
												<xsl:when test="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade">
													<td class="styTableCell" style="text-align:left;">
														<span style="width:12mm;"/>
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																	<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
																</xsl:call-template>
															</input>
														</span>
														<label>
															<xsl:call-template name="PopulateLabelYes">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
															</xsl:call-template>
             			 Yes
            		</label>
														<br/>
														<span style="width:12mm;"/>
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																	<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
																</xsl:call-template>
															</input>
														</span>
														<label>
															<xsl:call-template name="PopulateLabelNo">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
             			 No
            		</label>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCell" style="text-align:left;">
														<span style="width:12mm;"/>
														<input alt="alt" type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IRS8902VesselUsedInUSForeignTrade"/>
															</xsl:call-template>
										  Yes
										</input>
														<br/>
														<span style="width:12mm;"/>
														<input alt="alt" type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IRS8902VesselUsedInUSForeignTrade"/>
															</xsl:call-template>
										  No
										</input>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade">
													<td class="styTableCell" style="text-align:left;">
														<span style="width:12mm;"/>
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																	<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
																</xsl:call-template>
															</input>
														</span>
														<label>
															<xsl:call-template name="PopulateLabelYes">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
															</xsl:call-template>
             			 Yes
            		</label>
														<br/>
														<span style="width:12mm;"/>
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																	<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
																</xsl:call-template>
															</input>
														</span>
														<label>
															<xsl:call-template name="PopulateLabelNo">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
             			 No
            		</label>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCell" style="text-align:left;">
														<span style="width:12mm;"/>
														<input alt="alt" type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IRS8902VesselUsedInUSForeignTrade"/>
															</xsl:call-template>
										  Yes
										</input>
														<br/>
														<span style="width:12mm;"/>
														<input alt="alt" type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IRS8902VesselUsedInUSForeignTrade"/>
															</xsl:call-template>
										  No
										</input>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade">
													<td class="styTableCell" style="text-align:left;">
														<span style="width:12mm;"/>
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade"/>
																	<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
																</xsl:call-template>
															</input>
														</span>
														<label>
															<xsl:call-template name="PopulateLabelYes">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade"/>
															</xsl:call-template>
             			 Yes
            		</label>
														<br/>
														<span style="width:12mm;"/>
														<span>
															<xsl:call-template name="PopulateSpan">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
															<input type="Checkbox" class="styCkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade"/>
																	<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
																</xsl:call-template>
															</input>
														</span>
														<label>
															<xsl:call-template name="PopulateLabelNo">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos +3]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
             			 No
            		</label>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCell" style="text-align:left;">
														<span style="width:12mm;"/>
														<input alt="alt" type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IRS8902VesselUsedInUSForeignTrade"/>
															</xsl:call-template>
										  Yes
										</input>
														<br/>
														<span style="width:12mm;"/>
														<input alt="alt" type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="IRS8902VesselUsedInUSForeignTrade"/>
															</xsl:call-template>
										  No
										</input>
													</td>
												</xsl:otherwise>
											</xsl:choose>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">8</div>
													<div class="styGenericDiv">Percentage of U.S. ownership in the </div>
													<div class="styGenericDiv" style="padding-left:5mm;">vessel</div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">..........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PercentageOfUSOwnership"/>
												</xsl:call-template>
                  	%
                </td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/PercentageOfUSOwnership"/>
												</xsl:call-template>
                	%
                </td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/PercentageOfUSOwnership"/>
												</xsl:call-template>
                	%
                </td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/PercentageOfUSOwnership"/>
												</xsl:call-template>
                	%
                </td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:2mm;">9</div>
													<div class="styGenericDiv">
                       Type of ownership (see instructions)                                          
                       </div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfOwnership"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/TypeOfOwnership"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/TypeOfOwnership"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/TypeOfOwnership"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">10</div>
													<div class="styGenericDiv">
                       Type of vessel use (see instructions)                                          
                       </div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfVesselUse"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/TypeOfVesselUse"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/TypeOfVesselUse"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/TypeOfVesselUse"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">11</div>
													<div class="styGenericDiv">
                      Date placed in service                                         
                       </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DatePlacedInService"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/DatePlacedInService"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/DatePlacedInService"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/DatePlacedInService"/>
												</xsl:call-template>
											</td>
										</tr>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Part III Repeating table End -->
					<!-- Part III empty table Begin -->
					<xsl:if test="(count($FormData/VesselInformation) &lt; 1) or (($Print = $Separated) and (count($FormData/VesselInformation) &gt; 4))">
						<!-- Populating columns of property data -->
						<div class="styBB" style="width:187mm;border-top-width:2px;padding-bottom:1.5mm;padding-top:1.5mm;border-color;red;">
							<span class="styPartName" style="width:16mm;">Part III</span>
							<span style="width:151mm;" class="styPartDesc"> Vessel Information
  </span>
						</div>
						<div class="sty8902TableContainerNBB">
							<table class="styTable" cellspacing="0" style="font-size:7pt;">
								<tr>
									<th style="width:58mm;border:none;text-align:center;padding-left:6mm;font-weight:medium;">
                  Description
                </th>
									<th class="styTableCell" style="text-align:center;font-weight:bold;border-left-width:1px;">A<span class="styTableCellPad"/>
									</th>
									<th class="styTableCell" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"/>
									</th>
									<th class="styTableCell" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"/>
									</th>
									<th class="styTableCell" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/>
									</th>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">1</div>
											<div class="styGenericDiv">
                       Vessel name
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="text-align:left;border-left-width:1px;">
										<!--Add See additional Table comment to the empty table to the first field -->
										<xsl:if test="$FormData/VesselInformation">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/VesselInformation"/>
												<xsl:with-param name="ShortMessage" select="'true'"/>
											</xsl:call-template>
										</xsl:if>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">2</div>
											<div class="styGenericDiv">
                      IMO number
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">3</div>
											<div class="styGenericDiv">
                       USCG VIN number
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">......</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">4</div>
											<div class="styGenericDiv"> 
                     Flag
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">...........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">5</div>
											<div class="styGenericDiv">
                       Date flagged                                          
                    </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">6</div>
											<div class="styGenericDiv">
                       Vessel type                                          
                       </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">7</div>
											<div class="styGenericDiv">
                      Vessel used in U.S. foreign trade?                                         
                       </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">.</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;text-align:left;">
										<span style="width:12mm;"/>
										<input alt="YesCheckbox" type="Checkbox" class="styCkbox"/>  Yes 
                	<br/>
										<span style="width:12mm;"/>
										<input alt="NoCheckbox" type="Checkbox" class="styCkbox"/>  No 
                </td>
									<td class="styTableCell" style="text-align:left;">
										<span style="width:12mm;"/>
										<input alt="YesCheckbox" type="Checkbox" class="styCkbox"/>  Yes 
                	<br/>
										<span style="width:12mm;"/>
										<input alt="NoCheckbox" type="Checkbox" class="styCkbox"/>  No 
                </td>
									<td class="styTableCell" style="text-align:left;">
										<span style="width:12mm;"/>
										<input alt="YesCheckbox" type="Checkbox" class="styCkbox"/>  Yes 
                	<br/>
										<span style="width:12mm;"/>
										<input alt="NoCheckbox" type="Checkbox" class="styCkbox"/>  No 
                 </td>
									<td class="styTableCell" style="text-align:left;">
										<span style="width:12mm;"/>
										<input alt="YesCheckbox" type="Checkbox" class="styCkbox"/>  Yes 
                	<br/>
										<span style="width:12mm;"/>
										<input alt="NoCheckbox" type="Checkbox" class="styCkbox"/>  No 
                 </td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">8</div>
											<div class="styGenericDiv">Percentage of U.S. ownership in the </div>
											<div class="styGenericDiv" style="padding-left:5mm;">vessel</div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">..........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>%</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>%</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>%</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>%</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">9</div>
											<div class="styGenericDiv">
                       Type of ownership (see instructions)                                          
                       </div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">10</div>
											<div class="styGenericDiv">
                       Type of vessel use (see instructions)                                          
                       </div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">11</div>
											<div class="styGenericDiv">
                      Date placed in service                                         
                       </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">.....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</table>
						</div>
					</xsl:if>
					<!-- Part III empty table End -->
					<!-- Part IV -->
					<!-- Part IV Repeating table Begin -->
					<xsl:if test="$FormData/NotionalShippingIncome and ($Print != $Separated or count($FormData/NotionalShippingIncome ) &lt;= 4)">
						<!-- Populating columns of property data -->
						<xsl:for-each select="$FormData/NotionalShippingIncome ">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<div class="styBB" style="width:187mm;border-top-width:2px;padding-bottom:1.5mm;padding-top:1.5mm;">
									<span class="styPartName" style="width:16mm;">Part IV</span>
									<span style="width:151mm;" class="styPartDesc"> Notional Shipping Income
   </span>
								</div>
								<!-- Notational Shipping Income Table begin -->
								<div class="sty8902TableContainerNBB">
									<table class="styTable" cellspacing="0" style="font-size:7pt;">
										<tr>
											<th style="width:58mm;border:none;text-align:center;padding-left:6mm;font-weight:medium;"/>
											<td class="styTableCell" style="text-align:center;font-weight:bold;border-left-width:1px;">
												<xsl:number value="position()" format="A"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +1" format="A"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +2" format="A"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +3" format="A"/>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">12</div>
													<div class="styGenericDiv">
                       Dead weight tons
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.......</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeadWeightTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DeadWeightTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DeadWeightTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DeadWeightTons"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">13</div>
													<div class="styGenericDiv">
                      Net tons
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">..........</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/NetTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/NetTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/NetTons"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">14</div>
													<div class="styGenericDiv" style="font-size:6.3pt;">
                             Enter the smaller of line 13 or 25,000 
                           </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">..</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="QlfyPercentageOfNetTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/QlfyPercentageOfNetTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/QlfyPercentageOfNetTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/QlfyPercentageOfNetTons"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">15</div>
													<div class="styGenericDiv"> 
                     Multiply line 14 by 0.004
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="MultiplyQlfyPctNetTonsBy0004"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyQlfyPctNetTonsBy0004"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyQlfyPctNetTonsBy0004"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyQlfyPctNetTonsBy0004"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">16</div>
													<div class="styGenericDiv">
                       Subtract line 14 from line 13                                          
                    </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">...</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjustedTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/AdjustedTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/AdjustedTons"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/AdjustedTons"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">17</div>
													<div class="styGenericDiv">
                       Multiply line 16 by 0.002                                          
                       </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="MultiplyAdjustedTonsby0002"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyAdjustedTonsby0002"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyAdjustedTonsby0002"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyAdjustedTonsby0002"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">18</div>
													<div class="styGenericDiv">
														<b>Daily notional shipping income. </b> Add </div>
													<div class="styGenericDiv" style="padding-left:5mm;">lines 15 and 17</div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.......</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DailyNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DailyNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DailyNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DailyNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">19</div>
													<div class="styGenericDiv">Days operated in U.S. foreign trade </div>
													<div class="styGenericDiv" style="padding-left:5mm;">during the tax year </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">......</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;text-align:right;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DaysOperated"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:right;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DaysOperated"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:right;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DaysOperated"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:right;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DaysOperated"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">20</div>
													<div class="styGenericDiv">
                       Multiply line 18 by line 19                                          
                       </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/NetNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/NetNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/NetNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">21</div>
													<div class="styGenericDiv">
                       Ownership percentage                                          
                       </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OwnershipPercentage"/>
												</xsl:call-template>
                	%
                </td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/OwnershipPercentage"/>
												</xsl:call-template>
                	%
                </td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/OwnershipPercentage"/>
												</xsl:call-template>
                	%
                </td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/OwnershipPercentage"/>
												</xsl:call-template>
                	%
                </td>
										</tr>
										<tr>
											<td class="sty8902TableCellSmallBB" style="" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">22</div>
													<div class="styGenericDiv"> 
                      Multiply line 20 by line 21
                    </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="MultiplyLine20ByLine21"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyLine20ByLine21"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyLine20ByLine21"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyLine20ByLine21"/>
												</xsl:call-template>
											</td>
										</tr>
									</table>
								</div>
								<div class="styBB" style="width:187mm;padding-bottom:1.5mm;padding-top:1.5mm;">
        If any income from this vessel was excluded from gross income by reason of section 883 or otherwise, complete lines 23
	   through 27. Otherwise, skip lines 23 through 27 and enter the amount from line 22 on line 28.
</div>
								<div class="sty8902TableContainerNBB">
									<table class="styTable" cellspacing="0" style="font-size:7pt;">
										<tr>
											<th style="width:58mm;border:none;text-align:center;padding-left:6mm;font-weight:medium;"/>
											<td class="styTableCell" style="text-align:center;font-weight:bold;border-left-width:1px;">
												<xsl:number value="position()" format="A"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +1" format="A"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +2" format="A"/>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="text-align:center;font-weight:bold;">
												<xsl:number value="position() +3" format="A"/>
												<span class="styTableCellPad"/>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">23</div>
													<div class="styGenericDiv">Gross income excluded under section </div>
													<div class="styGenericDiv" style="padding-left:5mm;">883 or otherwise</div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">......</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncomeExcluded"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/GrossIncomeExcluded"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/GrossIncomeExcluded"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/GrossIncomeExcluded"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">24</div>
													<div class="styGenericDiv">Gross income from operation of </div>
													<div class="styGenericDiv" style="padding-left:5mm;">vessel in U.S. foreign trade </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">...</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncomeFromOperation"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/GrossIncomeFromOperation"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/GrossIncomeFromOperation"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="padding-top:4mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/GrossIncomeFromOperation"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">25</div>
													<div class="styGenericDiv">
                       Add lines 23 and 24
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/GrossIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/GrossIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/GrossIncome"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">26</div>
													<div class="styGenericDiv"> 
                     Divide line 24 by line 25
                      </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">...</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:choose>
													<xsl:when test="$Version = '2005v2.0'">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:choose>
													<xsl:when test="$Version = '2005v2.0'">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:choose>
													<xsl:when test="$Version = '2005v2.0'">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:choose>
													<xsl:when test="$Version = '2005v2.0'">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DivideLine24ByLine25"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">27</div>
													<div class="styGenericDiv">
                       Multiply line 22 by line 26                                          
                    </div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">...</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="MultiplyLine22ByLine26"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyLine22ByLine26"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyLine22ByLine26"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyLine22ByLine26"/>
												</xsl:call-template>
											</td>
										</tr>
										<tr>
											<td style="border:none;" scope="row">
												<div>
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">28</div>
													<div class="styGenericDiv">
														<b>Annual notional shipping income.</b> Enter the amount from line 22 or line </div>
													<div class="styGenericDiv" style="padding-left:5mm;">27, whichever applies</div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">.....</span>
													</div>
												</div>
											</td>
											<td class="styTableCell" style="border-left-width:1px;border-bottom-width:0px;padding-top:7.5mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AnnualNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-bottom-width:0px;padding-top:7.5mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/AnnualNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-bottom-width:0px;padding-top:7.5mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/AnnualNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-bottom-width:0px;padding-top:7.5mm;">
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/AnnualNotionalShippingIncome"/>
												</xsl:call-template>
											</td>
										</tr>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Part IV Repeating table End -->
					<!-- Part IV Empty table Begin -->
					<xsl:if test="(count($FormData/NotionalShippingIncome ) &lt; 1) or (($Print = $Separated) and (count($FormData/NotionalShippingIncome ) &gt; 4))">
						<div class="styBB" style="width:187mm;border-top-width:2px;padding-bottom:1.5mm;padding-top:1.5mm;">
							<span class="styPartName" style="width:16mm;">Part IV</span>
							<span style="width:151mm;" class="styPartDesc"> Notional Shipping Income
   </span>
						</div>
						<div class="sty8902TableContainerNBB">
							<table class="styTable" cellspacing="0" style="font-size:7pt;">
								<tr>
									<th style="width:58mm;border:none;text-align:center;padding-left:6mm;font-weight:medium;"/>
									<td class="styTableCell" style="text-align:center;font-weight:bold;border-left-width:1px;">A<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">12</div>
											<div class="styGenericDiv">
                       Dead weight tons
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">.......</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="text-align:left;border-left-width:1px;">
										<!--Add See additional Table comment to the empty table to the first field -->
										<xsl:if test="$FormData/NotionalShippingIncome ">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome "/>
												<xsl:with-param name="ShortMessage" select="'true'"/>
											</xsl:call-template>
										</xsl:if>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">13</div>
											<div class="styGenericDiv">
                      Net tons
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">..........</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">14</div>
											<div class="styGenericDiv" style="font-size:6.3pt;">
                             Enter the smaller of line 13 or 25,000 
                           </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">..</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">15</div>
											<div class="styGenericDiv"> 
                     Multiply line 14 by 0.004
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">16</div>
											<div class="styGenericDiv">
                       Subtract line 14 from line 13                                          
                    </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">...</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">17</div>
											<div class="styGenericDiv">
                       Multiply line 16 by 0.002                                          
                       </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">18</div>
											<div class="styGenericDiv">
												<b>Daily notional shipping income. </b> Add </div>
											<div class="styGenericDiv" style="padding-left:5mm;">lines 15 and 17</div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">.......</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">19</div>
											<div class="styGenericDiv">Days operated in U.S. foreign trade </div>
											<div class="styGenericDiv" style="padding-left:5mm;">during the tax year </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">......</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">20</div>
											<div class="styGenericDiv">
                       Multiply line 18 by line 19                                          
                       </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">21</div>
											<div class="styGenericDiv">
                       Ownership percentage                                          
                       </div>
											<div style="clear:none;float:right; margin-right:1mm;"/>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>%</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>%</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>%</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>%</td>
								</tr>
								<tr>
									<td class="sty8902TableCellSmallBB" style="" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">22</div>
											<div class="styGenericDiv"> 
                      Multiply line 20 by line 21
                    </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</table>
						</div>
						<div class="styBB" style="width:187mm;padding-bottom:1.5mm;padding-top:1.5mm;">
        If any income from this vessel was excluded from gross income by reason of section 883 or otherwise, complete lines 23
	   through 27. Otherwise, skip lines 23 through 27 and enter the amount from line 22 on line 28.
</div>
						<div class="sty8902TableContainerNBB">
							<table class="styTable" cellspacing="0" style="font-size:7pt;">
								<tr>
									<th style="width:58mm;border:none;text-align:center;padding-left:6mm;font-weight:medium;"/>
									<td class="styTableCell" style="text-align:center;font-weight:bold;border-left-width:1px;">A<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="text-align:center;font-weight:bold;">B<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="text-align:center;font-weight:bold;">C<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="text-align:center;font-weight:bold;">D<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">23</div>
											<div class="styGenericDiv">Gross income excluded under section </div>
											<div class="styGenericDiv" style="padding-left:5mm;">883 or otherwise</div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">......</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="text-align:left;border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">24</div>
											<div class="styGenericDiv">Gross income from operation of </div>
											<div class="styGenericDiv" style="padding-left:5mm;">vessel in U.S. foreign trade </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">...</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">25</div>
											<div class="styGenericDiv">
                       Add lines 23 and 24
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">.....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">26</div>
											<div class="styGenericDiv"> 
                     Divide line 24 by line 25
                      </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">...</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">27</div>
											<div class="styGenericDiv">
                       Multiply line 22 by line 26                                          
                    </div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">...</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell">
										<span class="styTableCellPad"/>
									</td>
								</tr>
								<tr>
									<td style="border:none;" scope="row">
										<div>
											<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">28</div>
											<div class="styGenericDiv">
												<b>Annual notional shipping income.</b> Enter the amount from line 22 or line </div>
											<div class="styGenericDiv" style="padding-left:5mm;">27, whichever applies</div>
											<div style="clear:none;float:right; margin-right:1mm;">
												<span class="styDotLn">.....</span>
											</div>
										</div>
									</td>
									<td class="styTableCell" style="border-left-width:1px;border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="border-bottom-width:0px;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</table>
						</div>
					</xsl:if>
					<!-- Part IV Empty table End -->
					<!-- Part V  -->
					<div class="styBB" style="width:187mm;border-top-width:1px;padding-bottom:1.5mm;padding-top:1.5mm;">
						<span class="styPartName" style="width:16mm;">Part V</span>
						<span style="width:150mm;" class="styPartDesc">Alternative Tax</span>
					</div>
					<div style="clear:both;float:none;width:187mm;">
						<div class="styLNLeftNumBox">
                29
          </div>
						<div class="styLNDesc" style="width:144mm;">
							<span style="float:left">Total annual notional shipping income (enter the sum of all columns of Part IV, line 28)</span>
							<!--Dotted Line-->
							<span class="styBoldText" style="float:right;padding-right:1mm">
								<span class="styDotLn">.......</span>
							</span>
						</div>
						<div class="styLNAmountBox" style="width:2mm;">$</div>
						<div class="styLNAmountBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAnnlNotionalShippingIncm"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBox" style="height:100%;">
                30
          </div>
						<div class="styLNDesc" style="width:144mm;height:100%;">
           		Alternative tax on qualifying shipping activities. Multiply line 29 by 35%. Enter here and on the "Other 
				<span style="float:left">taxes" line of Form 1120, Schedule J, or Form 1120-F, Schedule J. Be sure to check the box for Form
				8902</span>
							<!--<span class="styBoldText" style="float:right;padding-right:1mm">
                <span class="styDotLn">....</span>
              </span>-->
						</div>
						<div class="styLNAmountBox" style="width:2mm;height:100%;border-bottom-width:0px;padding-top:4mm;">$</div>
						<div class="styLNAmountBoxNBB" style="padding-top:4mm;height:100%;border-left-width:0px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/AltTaxQlfyShippingActivities"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">Form
  	  		<span style="font-weight:bold;">8902</span> (12-2007)
  	</div>
					</div>
					<!-- Part V End -->
					<br/>
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
							<xsl:with-param name="BackupName">IRS8902AdditionalDataTable</xsl:with-param>
						</xsl:call-template>
					</table>
					<!-- Additional Data Table for separated data from Part III Lines 1-11 -->
					<!-- Part III Repeating table Begin -->
					<xsl:if test="$Print = $Separated and count($FormData/VesselInformation) &gt; 4">
						<!-- Populating columns of property data -->
						<xsl:for-each select="$FormData/VesselInformation">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<div class="styRepeatingDataTitle">Form 8902, Part III - Vessel Information:</div>
								<div class="sty8902TableContainerNBB">
									<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead">
											<tr class="styDepTblHdr">
												<th class="styDepTblCell" style="width:58mm;text-align:center;padding-left:6mm;">
                 	        Description
                	      </th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position()" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 1" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 2" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 3" format="A"/>
													<span class="styTableCellPad"/>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">1</div>
														<div class="styGenericDiv">
                       	Vessel name
                      	</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">........</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;border-left-width:1px;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VesselName"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/VesselName"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/VesselName"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/VesselName"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">2</div>
														<div class="styGenericDiv">
                     	 IMO number
                      	</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">........</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="IMONumber"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/IMONumber"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/IMONumber"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/IMONumber"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">3</div>
														<div class="styGenericDiv">
                       	USCG VIN number
                    	</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">......</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USCGVINNumber"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/USCGVINNumber"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/USCGVINNumber"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/USCGVINNumber"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">4</div>
														<div class="styGenericDiv"> 
                     		Flag
                      		</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">...........</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="Flag"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/Flag"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/Flag"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/Flag"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">5</div>
														<div class="styGenericDiv">
                       		Date flagged                                          
                    		</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">........</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateFlagged"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/DateFlagged"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/DateFlagged"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/DateFlagged"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">6</div>
														<div class="styGenericDiv">
                       		Vessel type                                          
                       		</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">........</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="VesselType"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/VesselType"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/VesselType"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/VesselType"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">7</div>
														<div class="styGenericDiv">
                      		Vessel used in U.S. foreign trade?                                         
                       		</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;1px;text-align:left;">
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateYesCheckbox">
																<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	Yes
            			</label>
													<br/>
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateNoCheckbox">
																<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelNo">
															<xsl:with-param name="TargetNode" select="UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	No
            			</label>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateYesCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	Yes
            			</label>
													<br/>
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateNoCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelNo">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	No
            			</label>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateYesCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	Yes
            			</label>
													<br/>
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateNoCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelNo">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	No
            			</label>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateYesCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelYes">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 	Yes
            			</label>
													<br/>
													<span style="width:12mm;"/>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
														<input type="Checkbox" class="styCkbox">
															<xsl:call-template name="PopulateNoCheckbox">
																<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/UsedInUSForeignTrade"/>
																<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
															</xsl:call-template>
														</input>
													</span>
													<label>
														<xsl:call-template name="PopulateLabelNo">
															<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/UsedInUSForeignTrade"/>
															<xsl:with-param name="backupName">IRS8902VesselUsedInUSForeignTrade</xsl:with-param>
														</xsl:call-template>
             			 No
            		</label>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">8</div>
														<div class="styGenericDiv">Percentage of U.S. ownership in the </div>
														<div class="styGenericDiv" style="padding-left:5mm;">vessel</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">..........</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PercentageOfUSOwnership"/>
													</xsl:call-template>
                  	%
                </td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/PercentageOfUSOwnership"/>
													</xsl:call-template>
                	%
                </td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/PercentageOfUSOwnership"/>
													</xsl:call-template>
                	%
                </td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/PercentageOfUSOwnership"/>
													</xsl:call-template>
                	%
                </td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">9</div>
														<div class="styGenericDiv">
                       Type of ownership (see instructions)                                          
                       </div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TypeOfOwnership"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/TypeOfOwnership"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/TypeOfOwnership"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/TypeOfOwnership"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">10</div>
														<div class="styGenericDiv">
                       Type of vessel use (see instructions)                                          
                       </div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TypeOfVesselUse"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/TypeOfVesselUse"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/TypeOfVesselUse"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:left;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/TypeOfVesselUse"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">11</div>
														<div class="styGenericDiv">
                      Date placed in service                                         
                       </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.....</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DatePlacedInService"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 1]/DatePlacedInService"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 2]/DatePlacedInService"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$FormData/VesselInformation[$pos + 3]/DatePlacedInService"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Part III Repeating table End -->
					<!-- Additional Data Table for separated data from Part III Lines 1-11 -->
					<!-- Additional Data Table for separated data from Part IV Lines 12-28 -->
					<!-- Part IV Repeating table Begin -->
					<xsl:if test="$Print = $Separated and count($FormData/NotionalShippingIncome ) &gt; 4">
						<!-- Populating columns of property data -->
						<xsl:for-each select="$FormData/NotionalShippingIncome ">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<div class="styRepeatingDataTitle">Form 8902, Part IV - Notional Shipping Income:</div>
								<!-- Notational Shipping Income Table begin-->
								<div class="sty8902TableContainerNBB">
									<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead">
											<tr class="styDepTblHdr">
												<th class="styDepTblCell" style="width:58mm;text-align:center;padding-left:6mm;"/>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position()" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 1" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 2" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 3" format="A"/>
													<span class="styTableCellPad"/>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">12</div>
														<div class="styGenericDiv" style="float:left;">
														Dead weight tons
													</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">....</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;border-left-width:1px;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DeadWeightTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DeadWeightTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DeadWeightTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DeadWeightTons"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">13</div>
														<div class="styGenericDiv" style="float:left;">
                      Net tons
                      </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.......</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NetTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/NetTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/NetTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/NetTons"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="width:58mm;border:none;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">14</div>
														<div class="styGenericDiv">
                             Enter the smaller of line 13                             
														</div>
														<span style="float:left;padding-left:5mm;">or 25,000 </span>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.......</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="QlfyPercentageOfNetTons"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/QlfyPercentageOfNetTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/QlfyPercentageOfNetTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/QlfyPercentageOfNetTons"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">15</div>
														<div class="styGenericDiv" style="float:left;"> 
                     Multiply line 14 by 0.004
                      </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MultiplyQlfyPctNetTonsBy0004"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyQlfyPctNetTonsBy0004"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyQlfyPctNetTonsBy0004"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyQlfyPctNetTonsBy0004"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1" style="text-align:right;">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;text-align:center;">16</div>
														<div class="styGenericDiv">
                       Subtract line 14 from line 13                                          
                    </div>
														<!--<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">...</span>
														</div>-->
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AdjustedTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/AdjustedTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/AdjustedTons"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/AdjustedTons"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">17</div>
														<div class="styGenericDiv" style="float:left;">
                       Multiply line 16 by 0.002                                          
                       </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MultiplyAdjustedTonsby0002"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyAdjustedTonsby0002"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyAdjustedTonsby0002"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyAdjustedTonsby0002"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" style="width:58mm;border:none;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">18</div>
														<div class="styGenericDiv" style="font-size:7pt;">
															<b>Daily notional shipping income. </b>
														</div>
														<div class="styGenericDiv" style="float:left;padding-left:5mm;"> Add lines 15 and 17</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">....</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DailyNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DailyNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DailyNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DailyNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">19</div>
														<div class="styGenericDiv">Days operated in U.S. foreign </div>
														<div class="styGenericDiv" style="float:left;padding-left:5mm;">trade during the tax year </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">...</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="DaysOperated"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DaysOperated"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DaysOperated"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DaysOperated"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">20</div>
														<div class="styGenericDiv" style="float:left;">
                       Multiply line 18 by line 19                                          
                       </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">..</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="NetNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/NetNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/NetNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/NetNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">21</div>
														<div class="styGenericDiv" style="float:left;">
                       Ownership percentage                                          
                       </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">...</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OwnershipPercentage"/>
													</xsl:call-template>
                	%
                </td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/OwnershipPercentage"/>
													</xsl:call-template>
                	%
                </td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/OwnershipPercentage"/>
													</xsl:call-template>
                	%
                </td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/OwnershipPercentage"/>
													</xsl:call-template>
                	%
                </td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">22</div>
														<div class="styGenericDiv" style="float:left;"> 
                      Multiply line 20 by line 21
                    </div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">..</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MultiplyLine20ByLine21"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyLine20ByLine21"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyLine20ByLine21"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyLine20ByLine21"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="styBB" style="width:187mm;padding-bottom:1.5mm;padding-top:1.5mm;">
        If any income from this vessel was excluded from gross income by reason of section 883 or otherwise, complete lines 23
	   through 27. Otherwise, skip lines 23 through 27 and enter the amount from line 22 on line 28.
</div>
								<div class="sty8902TableContainerNBB">
									<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
										<thead class="styTableThead">
											<tr class="styDepTblHdr">
												<th class="styDepTblCell" style="width:58mm;text-align:center;padding-left:6mm;"/>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position()" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 1" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 2" format="A"/>
													<span class="styTableCellPad"/>
												</th>
												<th class="styDepTblCell" style="width:32mm;text-align:center;">
													<xsl:number value="position() + 3" format="A"/>
													<span class="styTableCellPad"/>
												</th>
											</tr>
										</thead>
										<tfoot/>
										<tbody>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">23</div>
														<div class="styGenericDiv">Gross income excluded under </div>
														<div class="styGenericDiv" style="float:left;padding-left:5mm;">section 883 or otherwise</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">..</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossIncomeExcluded"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/GrossIncomeExcluded"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/GrossIncomeExcluded"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/GrossIncomeExcluded"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" style="border:none;" scope="row">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;padding-left:.5mm;">24</div>
														<div class="styGenericDiv">Gross income from operation </div>
														<div class="styGenericDiv" style="padding-left:5mm;">of vessel in U.S. foreign trade </div>
														<!--<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">...</span>
													</div>-->
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossIncomeFromOperation"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/GrossIncomeFromOperation"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/GrossIncomeFromOperation"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:4mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/GrossIncomeFromOperation"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">25</div>
														<div class="styGenericDiv" style="float:left;">
                       	Add lines 23 and 24
                      	</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">...</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="GrossIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/GrossIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/GrossIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/GrossIncome"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">26</div>
														<div class="styGenericDiv" style="float:left;"> 
                     	Divide line 24 by line 25
                      	</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">..</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:choose>
														<xsl:when test="$Version = '2005v2.0'">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:choose>
														<xsl:when test="$Version = '2005v2.0'">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:choose>
														<xsl:when test="$Version = '2005v2.0'">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:center;">
													<span class="styTableCellPad"/>
													<xsl:choose>
														<xsl:when test="$Version = '2005v2.0'">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/DivideLine24ByLine25"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<tr class="styDepTblRow1">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div>
														<div class="styGenericDiv" style="width:5mm;font-weight:bold;">27</div>
														<div class="styGenericDiv" style="float:left;">
                       	Multiply line 22 by line 26                                          
                    	</div>
														<div style="clear:none;float:right; margin-right:1mm;">
															<span class="styDotLn">.</span>
														</div>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="MultiplyLine22ByLine26"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/MultiplyLine22ByLine26"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/MultiplyLine22ByLine26"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/MultiplyLine22ByLine26"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr class="styDepTblRow2">
												<td class="styDepTblCell" scope="row" style="width:58mm;">
													<div class="styGenericDiv" style="width:5mm;font-weight:bold;">28</div>
													<div class="styGenericDiv">
														<b>Annual notional shipping income.</b> Enter the amount from line 22 or line 27, </div>
													<div class="styGenericDiv" style="float:left;padding-left:5mm;">whichever applies</div>
													<div style="clear:none;float:right; margin-right:1mm;">
														<span class="styDotLn">....</span>
													</div>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:11mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:11mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 1]/AnnualNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:11mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 2]/AnnualNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
												<td class="styDepTblCell" style="width:32mm;padding-top:11mm;text-align:right;">
													<span class="styTableCellPad"/>
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="$FormData/NotionalShippingIncome [$pos + 3]/AnnualNotionalShippingIncome"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<!-- Part IV Repeating table End -->
					<!-- Additional Data Table for separated data from Part IV Lines 12-28 -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
