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
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet image"/> Attach only to the child's Form 1040 or Form 1040-NR. <br/>
								<div class="styFST" style="font-size:6pt;padding-top:1mm;"/>
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet Image"/>	
								Go to <i><a href="http://www.irs.gov/form8615">www.irs.gov/Form8615 </a></i> for instructions and the latest information.
              </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm;">
							<div class="styOMB" style="height:5mm;">OMB No. 1545-0074</div>
							<div class="styTY" style="height:9mm;font-size:22pt;">20<span class="styTYColor">20</span>
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
							<div>Child's name shown on return</div>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>Child's social security number</div>
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
           If the child, the parent, or any of the parent’s other children for whom Form 8615 must be filed must 
           use the Schedule D Tax Worksheet or has income from farming or fishing, see <b>Pub. 929,</b> Tax Rules 
           for Children and Dependents. It explains how to figure the child’s tax using the <b>Schedule D Tax 
           Worksheet</b>
            or <b>Schedule J</b> (Form 1040).</div>
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
	             	<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styGenericDiv" style="width:156mm;height:10mm;padding-bottom:2mm;">
							<div>
								<span style="font-weight:bold;padding-right:2mm;">C</span>
                Parent’s filing status (check one):                 
							</div>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">IndividualReturnFilingStatusCd</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
							</xsl:call-template>
					<!--	</div>-->
						<div style="width:162mm;min-height:5mm;padding-top:1mm;float:left;">
							<span style="display:inline;font-family:Arial;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;margin-bottom:1.5mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>Single</label>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
									</xsl:call-template>Married filing jointly</label>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>Married filing separately</label>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
									</xsl:call-template>Head of Household</label>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>Qualifying widow(er)</label>
							</span>
							<br />
						</div>
					  </div>
					</div>
					<!-- Part I header -->
					<div class="styBB" style="width: 187mm">
						<div class="styPartName" style="font-family:sans-serif;height:4mm;">Part I</div>
						<div class="styPartDesc">Child's Net Unearned Income</div>
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
              Enter the child’s unearned income (see instructions)
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
              If the child <b>did not</b> itemize deductions on <b>Schedule A</b> (Form 1040), enter
              $2,200. Otherwise, see <br/>instructions
              <span style="letter-spacing:2.8mm;">.................................</span>
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
              Subtract line 2 from line 1. If zero or less, <b>stop;</b> do not complete the rest of this form 
              but <b>do</b> attach it to <br/>child's return
              <span style="letter-spacing:2.8mm;">................................</span>
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
                Enter the child's <b>taxable income</b> from Form 1040 or 1040-NR, line 15. If the child files 
                Form 2555, <br/>see the instructions
                <span style="letter-spacing:2.8mm;">..............................</span>
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
                Enter the <b>smaller</b> of line 3 or line 4. If zero, <b>stop</b>; do not complete the rest of
                 this form but <b>do</b> attach it to <br/> the child's return
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
		             		<div class="styPartDesc">Tentative Tax Based on the Tax Rate of the Parent</div>
				   	</div>
						    	
					<!-- Line 6 -->
							<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:8mm">6</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
                Enter the parent's <b>taxable income</b> from Form 1040 or 1040-NR, line 15. If zero or less, 
                enter -0-.  If the parent files Form 2555, see the instructions
                <span style="letter-spacing:2.8mm;">.....................</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">ParentTaxableIncomeAmt</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ParentTaxableIncomeAmt"/>
							</xsl:call-template>
							</div>
									
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="padding-top:3.5mm;bottom:0">6</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ParentTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
									
					<!-- Line 7 -->
					<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:8mm">7</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
                Enter the total, if any, from Forms 8615, line 5, of <b>all other</b> children of the parent named above.<b> Do not </b>include the amount from line 5 above
                <span style="letter-spacing:2.8mm;">.......................</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">OtherChildrenInvestmentIncmAmt</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OtherChildrenInvestmentIncmAmt"/>
							</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="padding-top:3.5mm;bottom:0">7</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherChildrenInvestmentIncmAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.75mm;width:5mm;height:6mm;padding-top:1.5mm;">8</div>
						<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:6mm;padding-top:1.5mm;">
               Add lines 5, 6, and 7 (see instructions)
                <span style="letter-spacing:2.8mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;position:relative">
								<span style="padding-top:1.5mm;bottom:0">8</span>
							</div>
							<div class="styLNAmountBox" style="height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FamilyIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:5mm;padding-left:2.5mm;">9</div>
						<div class="styLNDesc" style="padding-left:1.5mm;height:11mm;width:141mm;position:relative;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/FamilyCapitalGainsTaxInd"/>
									<xsl:with-param name="BackupName">FormDataFamilyCapitalGainsTaxInd</xsl:with-param>
								</xsl:call-template>
							Enter the tax on the amount on line 8 based on the <b>parent's</b>
							filing status above (see instructions). If the Qualified Dividends and Capital Gain Tax Worksheet, Schedule D Tax Worksheet, or Schedule J (Form 1040) <br/>is used to figure the tax, check here
							</label>
							<span style="letter-spacing:3mm;">...................</span>
							<div style="width:20mm;position:absolute;bottom:0;right:0;">
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet image"/>
								<input type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FamilyCapitalGainsTaxInd"/>
										<xsl:with-param name="BackupName">FormDataFamilyCapitalGainsTaxInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">9
                         </div>
						<div class="styLNAmountBox" style="height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FamilyTentativeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
						<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:14mm;width:5mm;">10</div>
						<div class="styLNDesc" style="padding-left:1.5mm;height:14mm;width:141mm;position:relative;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ParentCapitalGainsTaxInd"/>
									<xsl:with-param name="BackupName">FormDataParentCapitalGainsTaxInd</xsl:with-param>
								</xsl:call-template>
							Enter the parent’s tax from Form 1040 minus any alternative minimum tax;
							<b>Do not</b> include any tax from <br/><b>Form 4972, 8814, or 8885</b>
							or any tax from recapture of an education credit. If the parent files Form 2555,
							 see the instructions. If the Qualified Dividends and Capital Gain Tax Worksheet,
							  Schedule D Tax Worksheet,<br/> or Schedule J (Form 1040) was used to figure
							  the tax, check here
							</label>
							<span style="letter-spacing:3mm;">.........</span>
							<div style="width:20mm;position:absolute;bottom:0;right:0;">
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet image"/>
								<input type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ParentCapitalGainsTaxInd"/>
										<xsl:with-param name="BackupName">FormDataParentCapitalGainsTaxInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">10
                         </div>
						<div class="styLNAmountBox" style="height:14mm;padding-top:10mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ParentTentativeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1.50mm;width:5mm;height:8mm">11</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
               Subtract line 10 from line 9 and enter the result. If line 7 is blank, also enter this amount on line
13 and go to <b>Part III</b> 
                <span style="letter-spacing:2.8mm;">..................................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="padding-top:3.5mm;bottom:0">11</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildrenTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
								    	
					<!-- Line 12a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:7mm;height:5mm;">12a</div>
						<div class="styLNDesc" style="width:99mm;height:5mm;">
                Add lines 5 and 7
                <span style="letter-spacing:3mm;">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">
                12a
              </div>
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChildrenInvestmentIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;border-left:1px solid black;height:5mm;background-color:lightgrey;width:8mm;"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom:none;"/>
					</div>
					<!-- Line 12b -->
					<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;width:5mm;height:5mm">b</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:5mm;">
              Divide line 5 by line 12a. Enter the result as a decimal (rounded to at least three places) 
                <span style="letter-spacing:2.8mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;position:relative">
								<span style="padding-top:1mm;bottom:0">12b</span>
							</div>
							<div class="styLNAmountBox" style="height:5mm;padding-top:1.5mm;">
							<span class="styBoldText" style="font-size:8pt;">x.</span>
							<span style="width:1mm"/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildrenInvestmentPct"/>
								</xsl:call-template>
							</div>
						</div>
				<!-- Line 13 -->
				<div style="width:187mm;">
					<div class="styLNLeftNumBox" style="padding-left:1.50mm;padding-top:2mm;width:5mm;
					 height:6mm">13</div>
				    	<div class="styLNDesc" style="padding-left:1.5mm;padding-top:2mm;width:141mm;
				    	 height:6mm;">
                               Multiply line 11 by line 12b
                     <span style="letter-spacing:2.8mm;">............................</span>
					</div>
					<div class="styLNRightNumBox" style="height:6mm;position:relative;border-bottom:none;">
						<span style="padding-top:2.5mm;bottom:0">13</span>
					</div>
					<div class="styLNAmountBox" style="height:6mm;padding-top:3mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildrenInvestmentAllcblTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					<div class="styBB" style="width:187mm"></div>
					<!-- Part III header -->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="font-family:sans-serif;height:4mm;">Part III</div>
		             		<div class="styPartDesc" style="font-weight: normal;"><b>Child’s Tax—</b>
		             		If lines 4 and 5 above are the same, enter -0- on line 15 and go to line 16.
		             	</div>		            	
					</div>					
					<!-- Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;height:5mm">14</div>
						<div class="styLNDesc" style="width:100mm;height:5mm;">
               Subtract line 5 from line 4
                <span style="letter-spacing:3mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;">14 </div>             
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ChildNetIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div style="float:left;border-left:1px solid black;height:5mm;background-color:lightgrey;width:8mm;"/>
						<div class="styLNAmountBox" style="height:5mm;border-bottom:none;"/>
					</div>
					<!-- Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:5mm;padding-left:1mm;">15</div>
						<div class="styLNDesc" style="padding-left:1.5mm;height:11mm;width:141mm;position:relative;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ChildUnearnedIncomeInd"/>
									<xsl:with-param name="BackupName">FormDataChildUnearnedIncomeInd</xsl:with-param>
								</xsl:call-template>
							Enter the tax on the amount on line 14 based on the <b>child’s</b> filing status (see 
							instructions).<br/>If the Qualified Dividends and Capital Gain Tax Worksheet, Schedule D
							 Tax Worksheet, or Schedule J (Form 1040) is used to figure the tax, check here
							</label>
							<span style="letter-spacing:3mm;">...................</span>
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
						<div class="styLNRightNumBox" style="height:11mm;padding-top:5mm;">15
                         </div>
						<div class="styLNAmountBox" style="height:11mm;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ChildNetIncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1.5mm;width:5mm;height:4.5mm">16</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:4.5mm;">
             Add lines 13 and 15
              <span style="letter-spacing:2.8mm;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;position:relative">
								<span style="bottom:0">16</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAllocableAndNetTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					<!-- Vertical spacer row -->
				<!--		<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;height:4.5mm"/>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;"/>
							<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:4.5mm;border-bottom:none;"/>
						</div>-->
					<!-- Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;width:5mm;padding-left:1.5mm;">17</div>
						<div class="styLNDesc" style="padding-left:1.5mm;height:11mm;width:141mm;position:relative;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ChildCapitalGainInd"/>
									<xsl:with-param name="BackupName">FormDataChildCapitalGainInd</xsl:with-param>
								</xsl:call-template>
							Enter the tax on the amount on line 4 based on the <b>child’s</b> filing status (see
							instructions).<br/>If the Qualified Dividends and Capital Gain Tax Worksheet, 
							Schedule D Tax Worksheet, or Schedule J (Form 1040) is used to figure the tax, check here
							</label>
							<span style="letter-spacing:3mm;">...................</span>
							<div style="width:20mm;position:absolute;bottom:0;right:0;">
								<img src="{$ImagePath}/8615_Bullet.gif" width="9" height="9" alt="bullet image"/>
								<input type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ChildCapitalGainInd"/>
										<xsl:with-param name="BackupName">FormDataChildCapitalGainInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:5mm;">17
                         </div>
						<div class="styLNAmountBox" style="height:11mm;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnChildTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>		
					<!-- Line 18 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1.5mm;width:5mm;height:8mm">18</div>
							<div class="styLNDesc" style="padding-left:1.5mm;width:141mm;height:8mm;">
                Enter the <b>larger</b> of line 16 or line 17 here and on the <b>child's</b> Form 1040 or 1040-NR,
                line 16. If the child files Form 2555, see the instructions
                <span style="letter-spacing:3.0mm;">.........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative;border-bottom:none;">
								<span style="padding-top:3.5mm;bottom:0">18</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/KiddieTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
								
				<!--	</div>-->		
					<!-- capturing the page bottom info -->
					<div class="pageEnd" style="width:187mm; font-size:7pt; border-top:2px solid black;
					padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
						</div>
						<div style="float:right">
            Cat. No. 64113U
            <span style="width:15mm"/>
            Form <b style="font-size:9pt">8615</b> (2020)
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
