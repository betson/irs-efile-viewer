<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]><!-- Last Modified by Eugenia McDonald on 06/20/2014 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8959Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>  
	<xsl:param name="FormData" select="$RtnDoc/IRS8959"/>  
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
				<meta name="Description" content="IRS Form 8959"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8959Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="IRS8959">
					<xsl:call-template name="DocumentHeader"/>
					<!-- header -->
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:20mm;">
							<div style="width:29mm;height:13mm;">
								Form <span class="styFormNumber">8959</span><br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
								</xsl:call-template>
							</div>
							<span class="styAgency">Department of the Treasury<br/>
							Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:126.8mm;">
							<span class="styMainTitle" style="font-size:12pt;padding-top:3mm;">Additional Medicare Tax</span><br/>
							<div class="styFBT">
								<img alt="Bullet" src="{$ImagePath}/8959_Bullet.gif" height="9" width="9"/>
								If any line does not apply to you, leave it blank. See separate instructions.
								<br/>
								<img alt="Bullet" src="{$ImagePath}/8959_Bullet.gif" height="9" width="9"/>
								Attach to Form 1040, Form 1040-SR, 1040-NR, 1040-PR, or 1040-SS.
								<br/>
								<img alt="Bullet" src="{$ImagePath}/8959_Bullet.gif" height="9" width="9"/>
								Go to <i><a href="http://www.irs.gov/form8959">www.irs.gov/Form8959 </a></i> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;">
							<div class="styOMB" style="width:100%;height:4mm;">OMB No. 1545-0074</div>
							<span class="styTaxYear">20<span class="styTYColor">21</span></span>
							<div class="stySequence" style="width:100%;height:8mm;padding-left:3mm;">
								Attachment<br/>Sequence No. <span style="font-weight:bold;font-size:10pt;">71</span>
							</div>
						</div>
					</div>
					<!-- Primary Taxpayer -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:146.1mm;height:10mm;">
							Name(s) shown on return<br/>
							<span style="font-size:7pt;padding-top:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
								</xsl:call-template>
								<!--<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>-->
							</span>
						</div>
						<div class="styEINBox" style="width:40.7mm;height:10mm;padding-left:2px;">
							Your social security number<br/>
							<span style="width:100%;text-align:center;font-size:7pt;font-weight:normal;padding-top:2mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
								<!--<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>-->
							</span>
						</div>
					</div>
					<!-- Header row -->
					<!-- Part I -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part I</div>
						<div class="styPartDesc">
							Additional Medicare Tax on Medicare Wages							
						</div>
					</div>
					<!-- Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Medicare wages and tips from Form W-2, box 5. If you have<br/>
							more than one Form W-2, enter the total of the amounts <br/>
							<span style="float:left;">from box 5</span>
							<span class="styIRS8959Dots">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.8mm;"><br/><br/>1</div>
						<div class="styLNAmountBox" style="height:10.8mm;width:35mm;"><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/TotalW2MedicareWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:10.8mm;width:35mm;"/>
					</div>
					<!-- Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:92.8mm;">
							<span style="float:left;">Unreported tips from Form 4137, line 6</span>
							<span class="styIRS8959Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">2</div>
						<div class="styLNAmountBox" style="height:4.4mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/TotalUnreportedMedicareTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;width:35mm;"/>
					</div>
					<!-- Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:92.8mm;">
							<span style="float:left;">Wages from Form 8919, line 6</span>
							<span class="styIRS8959Dots">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">3</div>
						<div class="styLNAmountBox" style="height:4.4mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/TotalWagesWithNoWithholdingAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;width:35mm;"/>
					</div>
					<!-- Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:92.8mm;">
							<span style="float:left;">Add lines 1 through 3</span>
							<span class="styIRS8959Dots">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">4</div>
						<div class="styLNAmountBox" style="height:4.4mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/TotalMedicareWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;width:35mm;"/>
					</div>
					<!-- Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Enter the following amount for your filing status:<br/>
							Married filing jointly
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">............</span>	
							<span style="float:right;padding-right:3mm;">$250,000</span>
							<br/>
							Married filing separately					
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...........</span>	
							<span style="float:right;padding-right:3mm;">$125,000</span>
							<br/>
							Single, Head of household, or Qualifying widow(er)
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..</span>	
							<span style="float:right;padding-right:3mm;">$200,000</span>					
						</div>
						<div class="styLNRightNumBox" style="height:14mm;width:8mm;"><br/><br/><br/>5</div>
						<div class="styLNAmountBox" style="height:14mm;width:35mm;"><br/><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/FilingStatusThresholdCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:14mm;width:35mm;"/>
					</div>					
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:135.86mm;">
							<span style="float:left;">Subtract line 5 from line 4. If zero or less, enter -0-</span>
							<span class="styIRS8959Dots">.............</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/WagesTipsSubjToAddlMedcrTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:135.86mm;">
							Additional Medicare tax on Medicare wages. Multiply line 6 by 0.9% (0.009). Enter here and<br/>
							<span style="float:left;">go to Part II</span>
							<span class="styIRS8959Dots">......................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;"><br/>7</div>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;width:35mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/AdditionalMedicareTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>					
					<!-- Part II -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part II</div>
						<div class="styPartDesc">Additional Medicare Tax on Self-Employment Income</div>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Self-employment income from Schedule SE (Form 1040), Part 1, line 6. <br/>
							If you had a loss, enter -0- 
							<span style="float:left;">(Form 1040-PR or Form 1040-SS filers, see instructions.)</span>
							<span class="styIRS8959Dots">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.8mm;"><br/><br/>8</div>
						<div class="styLNAmountBox" style="height:10.8mm;width:35mm;"><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlSelfEmploymentTaxGrp/TotalSelfEmploymentIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:10.8mm;width:35mm;"/>
					</div>					
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Enter the following amount for your filing status:<br/>
							Married filing jointly
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">............</span>	
							<span style="float:right;padding-right:3mm;">$250,000</span>
							<br/>
							Married filing separately					
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...........</span>	
							<span style="float:right;padding-right:3mm;">$125,000</span>
							<br/>
							Single, Head of household, or Qualifying widow(er)
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..</span>	
							<span style="float:right;padding-right:3mm;">$200,000</span>					
						</div>
						<div class="styLNRightNumBox" style="height:14mm;"><br/><br/><br/>9</div>
						<div class="styLNAmountBox" style="height:14mm;width:35mm;"><br/><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/FilingStatusThresholdCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:14mm;width:35mm;"/>
					</div>					
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:92.8mm;">
							<span style="float:left;">Enter the amount from line 4</span>
							<span class="styIRS8959Dots">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">10</div>
						<div class="styLNAmountBox" style="height:4.4mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/TotalMedicareWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;width:35mm;"/>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:92.8mm;">
							<span style="float:left;">Subtract line 10 from line 9. If zero or less, enter -0-
							</span>
							<span class="styIRS8959Dots">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlSelfEmploymentTaxGrp/MedcrWagesTipsBelowThrshldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;width:35mm;"/>
					</div>					
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:135.86mm;">
							<span style="float:left;">Subtract line 11 from line 8. If zero or less, enter -0-</span>
							<span class="styIRS8959Dots">............</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlSelfEmploymentTaxGrp/SEIncomeSubjToAddSETaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:135.86mm;">
							Additional Medicare Tax on self-employment income. Multiply line 12 by 0.9% (0.009). Enter<br/>
							<span style="float:left;">here and go to Part III</span>
							<span class="styIRS8959Dots">....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;"><br/>13</div>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;width:35mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlSelfEmploymentTaxGrp/AddlSelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part III</div>
						<div class="styPartDesc">Additional Medicare Tax on Railroad Retirement Tax Act (RRTA) Compensation</div>
					</div>
					<!-- Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:92.8mm;">							
							Railroad retirement (RRTA) compensation and tips from Form(s) W-2, <br/>
							<span style="float:left;">box 14 (see instructions)</span>
							<span class="styIRS8959Dots">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>14</div>
						<div class="styLNAmountBox" style="height:7.8mm;width:35mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlRailroadRetirementTaxGrp/TotalRailroadRetirementCompAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;width:35mm;"/>
					</div>					
					<!-- Line 15 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Enter the following amount for your filing status:<br/>
							Married filing jointly
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">............</span>	
							<span style="float:right;padding-right:3mm;">$250,000</span>
							<br/>
							Married filing separately					
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...........</span>	
							<span style="float:right;padding-right:3mm;">$125,000</span>
							<br/>
							Single, Head of household, or Qualifying widow(er)
							<!--Dotted Line-->
							    <span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..</span>	
							<span style="float:right;padding-right:3mm;">$200,000</span>					
						</div>
						<div class="styLNRightNumBox" style="height:14mm;"><br/><br/><br/>15</div>
						<div class="styLNAmountBox" style="height:14mm;width:35mm;"><br/><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/FilingStatusThresholdCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:14mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:14mm;width:35mm;"/>
					</div>
					<!-- Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:135.86mm;">
							<span style="float:left;">Subtract line 15 from line 14. If zero or less, enter -0-</span>
							<span class="styIRS8959Dots">............</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlRailroadRetirementTaxGrp/RRTCompSubjToAddRRTTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:135.86mm;">
							Additional Medicare Tax on railroad retirement (RRTA) compensation.  Multiply line 16 by <br/>
							<span style="float:left;">0.9% (0.009).  Enter here and go to Part IV</span>
							<span class="styIRS8959Dots">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;padding-top:1mm"><br/>17</div>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;width:35mm;padding-top:1mm"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AddnlRailroadRetirementTaxGrp/AddlRailroadRetirementTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part IV -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part IV</div>
						<div class="styPartDesc">Total Additional Medicare Tax</div>
					</div>
					<!-- Line 18 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:135.86mm;">
							Add lines 7, 13, and 17. Also include this amount on Schedule 2 (Form 1040), line 11<br/>
							<span style="float:left;">(Form 1040-PR or 1040-SS filers, see instructions), and go to Part V</span>
							<span class="styIRS8959Dots">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;"><br/>18</div>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;width:35mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/TotalAMRRTTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part V -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="height:4mm;">Part V</div>
						<div class="styPartDesc">Withholding Reconciliation</div>
					</div>
					<!-- Line 19 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Medicare tax withheld from Form W-2, box 6. If you have<br/>
							more than one Form W-2, enter the total of the amounts <br/>
							<span style="float:left;">from box 6</span>
							<span class="styIRS8959Dots">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.8mm;"><br/><br/>19</div>
						<div class="styLNAmountBox" style="height:10.8mm;width:35mm;"><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalW2MedicareTaxWithheldAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:10.8mm;width:35mm;"/>
					</div>	
					<!-- Line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:92.8mm;">
							<span style="float:left;">Enter the amount from line 1</span>
							<span class="styIRS8959Dots">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">20</div>
						<div class="styLNAmountBox" style="height:4.4mm;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxGrp/AdditionalMedicareTaxGrp/TotalW2MedicareWagesAndTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;width:35mm;"/>
					</div>
					<!-- Line 21 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:92.8mm;">
							Multiply line 20 by 1.45% (0.0145). This is your regular<br/>
							<span style="float:left;">Medicare tax withholding on Medicare wages</span>
							<span class="styIRS8959Dots">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>21</div>
						<div class="styLNAmountBox" style="height:7.8mm;width:35mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalMedicareTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.8mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.8mm;width:35mm;"/>
					</div>
					<!-- Line 22 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:135.86mm;">
							Subtract line 21 from line 19. If zero or less, enter -0-.  This is your Additional Medicare Tax <br/>						
							<span style="float:left;">withholding on Medicare	wages</span>
							<span class="styIRS8959Dots">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;"><br/>22</div>
						<div class="styLNAmountBox" style="height:7.8mm;width:35mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareTaxWithholdingAmt"/>
							</xsl:call-template>
						</div>
					</div>					
					<!-- Line 23 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:135.86mm;">
							Additional Medicare Tax withholding on railroad retirement (RRTA) compensation from 
							Form W-2, <br/><span style="float:left;">box 14 (see instructions) </span>
							<span class="styIRS8959Dots">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.8mm;padding-top:3mm">23</div>
						<div class="styLNAmountBox" style="height:7.8mm;width:35mm;padding-top:3mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalW2AddlRRTTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 24 -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:135.86mm;">
							<b>Total Additional Medicare Tax withholding.</b> Add lines 22 and 23. Also include this amount with<br/>
							  federal income tax withholding on Form 1040, 1040-SR, or 1040-NR, line 25c (Form 1040-PR or
							<span style="float:left;"> 1040-SS filers, see instructions)</span>
							<span class="styIRS8959Dots">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:10.8mm;"><br/><br/>24</div>
						<div class="styLNAmountBoxNBB" style="height:10.8mm;width:35mm;"><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AddlMedcrRRTTaxWithholdingAmt"/>
							</xsl:call-template>
						</div>
					</div>
					
					
					<!-- Footer Page 1 -->
					<div class="pageEnd" style="width:187mm;float:none;clear:both;">
						<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="float:left;clear:none;margin-left:20mm;">Cat. No. 59475X</span>
						<span style="float:right;clear:none;">Form <span style="font-weight:bold;font-size:9pt;">8959</span> (2021)</span>
					</div>
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
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>