<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8615Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS8615"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
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
				<meta name="Description" content="IRS Form 8615"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8615Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8615">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:22mm;">
              Form <span class="styFormNumber">8615</span>
							<div class="styAgency" style="padding-top:5mm;">Department of the Treasury<br/>Internal Revenue Service (99)</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<div class="styMainTitle" style="height:auto;padding-top:2mm;">Tax for Certain Children Who<br/>Have Unearned Income</div>
							<div class="styFST" style="font-size:6.5pt;padding-top:2mm;">
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet image"/> Attach D to your Form 1040, Form 1040A, or Form 1040NR. <br/>
								<div class="styFST" style="font-size:6pt;padding-top:1mm;"/>
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet Image"/>	
								Go to <i><a href="http://www.irs.gov/form8615">www.irs.gov/Form8615 </a></i> for instructions and the latest information.
              </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm;">
							<div class="styOMB" style="height:5mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:9mm;font-size:22pt;">20<span class="styTYColor">18</span>
							</div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">Attachment<br/>
            Sequence No. <span class="styBoldText">33</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							<div>Name shown on return</div>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>Your social security number</div>
							<span style="width:42mm;text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:12mm;">
						<div class="styGenericDiv" style="width:30mm;font-weight:bold;font-style:italic;">Before you begin:</div>
						<div class="styGenericDiv" style="width:156mm;padding-bottom:2mm;">
            If you must use the Schedule  D Tax Worksheet or have income from farming or fishing, see the instructions.
            Also see <b>Pub. 929,</b> Tax Rules for Children and Dependents. It
            explains how to figure your tax using the <b>Schedule D Tax Worksheet or Schedule J</b> (Form 1040).</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;padding-right:2mm;">A</span>
                Parent's name (first, initial, and last). 
                <b>Caution: </b>
								<i>See instructions before completing.</i>
							</div>
							<br/>
							<span style="padding-left:3.8mm;font-weight:normal;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ParentNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">ParentNameControlTxt</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ParentNameControlTxt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>
								<span style="font-weight:bold;padding-right:2mm;">B</span>Parent's social security number</div>
							<span style="width:42mm;text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
		<!--			<div class="styBB" style="width:187mm;float:none;clear:left;padding-bottom:1mm;">
						<div class="styNameBox" style="width:187mm;height:auto;font-size:7pt;border-right:none;">
							<div>
								<span style="font-weight:bold;padding-right:2mm;">C</span>Parent's filing status (check one):
                <xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status Estimated Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd/@filingStatusEstimatedCd"/>
								</xsl:call-template>
							</div>
							<span style="margin:0mm 3mm;">
								<input type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">IRS8615IndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
                  Single
                </label>
							</span>
							<span style="margin:0mm 3mm;">
								<input type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">IRS8615IndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
                  Married filing jointly
                </label>
							</span>
							<span style="margin:0mm 3mm;">
								<input type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">IRS8615IndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
                  Married filing separately
                </label>
							</span>
							<span style="margin:0mm 3mm;">
								<input type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
										<xsl:with-param name="BackupName">IRS8615IndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
                  Head of household
                </label>
							</span>
							<span style="margin:0mm 3mm;">
								<input type="checkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
										<xsl:with-param name="BackupName">IRS8615IndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
                  Qualifying widow(er)
                </label>
							</span>
						</div>
					</div>-->
					<!-- Part I header -->
					<div class="styBB" style="width: 187mm">
						<div class="styPartName" style="font-family:sans-serif;height:4mm;">Part I</div>
						<div class="styPartDesc">Net Unearned Income</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Vertical spacer row -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:4.5mm">1 </div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:4.5mm;">
              Enter your unearned income (see instructions)
              <span style="letter-spacing:2.8mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;position:relative">
								<span style="bottom:0">1</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildInvestmentIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:8mm">2</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
              If you <b>did not</b> itemize deductions on <b>Schedule A</b> (Form 1040 or Form 1040NR), enter
              $2,100. <br/>Otherwise, see instructions
              <span style="letter-spacing:2.8mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="padding-top:3.5mm;bottom:0">2</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/KiddieDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:8mm">3</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
              Subtract line 2 from line 1. If zero or less, <b>stop;</b> do not complete the rest of this form but <b>do</b>
              attach it to your return
              <span style="letter-spacing:2.8mm;">.................................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="padding-top:3.5mm;bottom:0">3</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildUnearnedIncomeAdjustedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:8mm">4</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
                Enter your <b>taxable income</b> from Form 1040, line 43; Form 1040A, line 27; or Form 1040NR,
                line 41. <br/> If you file Form 2555 or 2555-EZ, see the instructions
                <span style="letter-spacing:2.8mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="padding-top:3.5mm;bottom:0">4</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:8mm">5</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
                Enter the <b>smaller</b> of line 3 or line 4. If zero, <b>stop</b>; do not complete the rest of this form but 
                <b>do</b> attach it to <br/> your return
                <span style="letter-spacing:3.0mm;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative;border-bottom:none;">
								<span style="padding-top:3.5mm;bottom:0">5</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildNetInvestmentIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>			
						
					<!-- Part II header -->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="font-family:sans-serif;height:4mm;">Part II</div>
		             		<div class="styPartDesc">Tax</div>
				   	</div>
				    <div class="styBB" style="width:187mm;">
					<!-- Vertical spacer row -->
				    <div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm;width:6mm;height:4.5mm;"/>
						<div class="styLNDesc" style="width:100mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;position:relative;text-align:left;border-bottom:none;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						<div style="float:left;border-left:1px solid black;height:4.5mm;background-color:lightgrey;width:8mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
					</div>
			    	
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:4.5mm">6</div>
						<div class="styLNDesc" style="width:100mm;height:4.5mm;">
                Subtract line 5 from line 4
                <span style="letter-spacing:3mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
                6
              </div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ChildNetIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;border-left:1px solid black;height:4.5mm;background-color:lightgrey;width:8mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- Vertical spacer row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
						<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:5mm;">7</div>
						<div class="styLNDesc" style="padding-left:1.5mm;height:14mm;width:141mm;position:relative;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ChildUnearnedIncomeInd"/>
									<xsl:with-param name="BackupName">FormDataChildUnearnedIncomeInd</xsl:with-param>
								</xsl:call-template>
							Enter the tax on the amount on line 4 (see instructions). If
							the Qualified Dividends and Capital Gain Tax Worksheet, Schedule D Tax Worksheet, or
							Schedule J (Form 1040) is used to figure the tax, check here. If applicable include this amount on your Form 1040, line 44; 
                             Form 1040A, line 28; Form 1040NR, line 42 (see instructions). If you file Form 2555 or 2555-EZ, see the instructions
							</label>
							<span style="letter-spacing:3mm;">...........</span>
							<div style="width:20mm;position:absolute;bottom:0;right:0;">
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet image"/>
								<input type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ChildUnearnedIncomeInd"/>
										<xsl:with-param name="BackupName">FormDataChildUnearnedIncomeInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;border-bottom:none;">
                7
              </div>
						<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ChildNetIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
			<!--		Vertical spacer row 
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
						<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
					</div>	-->
				</div>		
				<!--	</div>-->		
					<!-- capturing the page bottom info -->
					<div class="pageEnd" style="width:187mm; font-size:7pt; border-top:2px solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
            Cat. No. 64113U
            <span style="width:15mm"/>
            Form <b style="font-size:9pt">8615</b> (2018)
            </div>
					</div>
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
							<xsl:with-param name="Desc">Line A - Parent's Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ParentNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line C - Filing Status Estimated Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd/@filingStatusEstimatedCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 6 - Parent Taxable Income Estimated Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ParentTaxableIncomeAmt/@parentTaxableIncomeEstimatedCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 7 - Other Children Investment Income Estimated Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherChildrenInvestmentIncmAmt/@othChildrenInvestmentIncmEstCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
