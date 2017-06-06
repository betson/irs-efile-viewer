<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by Daniel Ashton (IRS) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4972Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8891Data" select="$RtnDoc/IRS8891"/>

	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8891Data)"/>
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
				<meta name="Description" content="IRS Form 8891"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4972Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form8891">
					<div class="styGenericDiv" style="width:187mm;border-bottom:1px solid;heigh:21mm">
						<div class="styFNBox" style="width:31mm;height:21mm;padding-bottom:0mm;border-right:1px solid;">
              Form <span class="styFormNumber">8891</span>
							<span style="line-height:2.6mm">
              (Rev. July 2008)<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8891Data"/>
								</xsl:call-template>
								<div class="styAgency" style="padding-top:0mm;height:0mm;padding:bottom:0mm;">
                Department of the Treasury<br/>
                Internal Revenue Service
              </div>
							</span>
						</div>
	<div class="styFTBox" style="width:125mm;height:17mm;">
							<div class="styMainTitle" style="height:5mm;padding-bottom:0mm;">U.S. Information Return for Beneficiaries of<br/>
              Certain Canadian Registered Retirement Plans</div>
							<div class="styFBT" style="font-size:7.5pt;height:5mm;margin-top:6.2mm;">
								<img src="{$ImagePath}/8891_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040.<span style="width:24mm;height:3mm"/>
								<img src="{$ImagePath}/8891_Bullet.gif" alt="MediumBullet"/> See instructions on back of form.</div>
						</div>
						<div class="styTYBox" style="width:31mm; height:17mm;border-left:1px solid black;">
							<div style="padding-top:0mm;border-bottom:1px solid black;font:7pt;height:9.5mm">
								<span style="padding-top:1mm">OMB No. 1545-0074</span>
							</div>
							<br/>
							<div class="styGenericDiv" style="font-size:6.5pt;text-align:left">

								Attachment <span style="width:5mm"/>Sequence No. 
								<span style="width:0.5mm"/>
								<span>
									<b style="font-size:11.5pt;font-family:'Arial';">139</b>
								</span>
							</div>
						</div>
					</div>
					<!-- Name shown on Form 1040 -->
					<div class="styGenericDiv" style="width:187mm;border-bottom:1px  solid;font-size:7.0pt;">
						<div class="styFNBox" style="width:70%; height:8mm; ">
              Name shown on Form 1040<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
							<br/>
						</div>
						<div class="styFNBox" style="width:30%; height:8mm;border-right-width:0;padding-left:1mm ">
						<b> Identifying number</b> (see instructions)
            <br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
						</div>
					</div>
	
					<!-- Part I - Body -->
					  <div class="styGenericDiv" style="width:187mm">
						<!-- Line 1 -->
						<div class="styGenericDiv" style="width:93.5mm;height:17mm;border-bottom: 1px solid black;border-right: 1px solid black">
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:2.5mm;">1</div>
							<span style="width:5mm"/>
							<span style="font-size:7 pt">Name of plan custodian</span>
							<div class="styGenericDiv" style="padding-left:7mm;font-size: 7pt; ">
								<xsl:if test="$Form8891Data/CanadaRetirePlanCustodianName/BusinessNameLine1">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanCustodianName/BusinessNameLine1"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8891Data/CanadaRetirePlanCustodianName/BusinessNameLine2">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanCustodianName/BusinessNameLine2"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="styGenericDiv" style="width:93.5mm;height:17mm;border-bottom: 1px solid black;">
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:2.5mm;">2</div>
							<span style="width:5mm"/>Account number of plan
                <div class="styGenericDiv" style="padding-left:7mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanAccountNum"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div class="styGenericDiv" style="width:93.5mm;height:17mm;border-bottom: 1px solid black;border-right: 1px solid black">
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:2.5mm;">3</div>
							<span style="width:5mm"/>Address of plan custodian
                  <div class="styGenericDiv" style="padding-left:7mm">
								<xsl:call-template name="MakeAddressLines">
						</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div class="styGenericDiv" style="width:93.5mm;height:17mm;border-bottom: 1px solid black;">
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:2.5mm;">4</div>
							<span style="width:5mm"/> Type of plan (check one box):
				 <div class="styGenericDiv" style="padding-left:7mm">
								<input type="checkbox" class="sty4972Ckbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRegdRetireSavingPlanInd"/>
										<xsl:with-param name="BackupName" select="'IRS8891CanadaRegdRetireSavingPlanInd'"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRegdRetireSavingPlanInd"/>
										<xsl:with-param name="BackupName" select="'IRS8891CanadaRegdRetireSavingPlanInd'"/>
									</xsl:call-template>
					  Registered Retirement Savings Plan (RRSP)
					  </label>
								<div/>
								<input type="checkbox" class="sty4972Ckbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRegdRetireIncomeFundInd"/>
										<xsl:with-param name="BackupName" select="'IRS8891CanadaRegdRetireIncomeFundInd'"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRegdRetireIncomeFundInd"/>
										<xsl:with-param name="BackupName" select="'IRS8891CanadaRegdRetireIncomeFundInd'"/>
									</xsl:call-template>
                  Registered Retirement Income Fund (RRIF)
                  </label>
							</div>
						</div>
						</div>
						<!-- Line 5 -->
						<div class="styGenericDiv" style="width:187mm">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">5</div>
						<div class="styGenericDiv" style="padding-left:3mm;width:155mm;">
							Check the applicable box for your status in the plan (see <i>Definitions</i> in the instructions):
						</div>
										<div class="styGenericDiv" style="width:187mm;padding-left:10mm;">
											<input type="checkbox" class="sty4972Ckbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanBeneficiaryInd"/>
													<xsl:with-param name="BackupName" select="'IRS8891CanadaRetirePlanBeneficiaryInd'"/>
												</xsl:call-template>
											</input>
										
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanBeneficiaryInd"/>
												<xsl:with-param name="BackupName" select="'IRS8891CanadaRetirePlanBeneficiaryInd'"/>
											</xsl:call-template>
                  Beneficiary</label>
									</div>
									<div class="styGenericDiv" style="width:187mm;padding-left:10mm;">
											<input type="checkbox" class="sty4972Ckbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanAnnuitantInd"/>
													<xsl:with-param name="BackupName" select="'IRS8891CanadaRetirePlanAnnuitantInd'"/>
												</xsl:call-template>
											</input>
									
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetirePlanAnnuitantInd"/>
												<xsl:with-param name="BackupName" select="'IRS8891CanadaRetirePlanAnnuitantInd'"/>
											</xsl:call-template>
                  Annuitant (Complete only lines 7a, 7b, and 8.)</label>
							</div>
						</div>
						<!-- Line 6a -->
						<div class="styGenericDiv" style="187mm;border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="width:5mm;padding-left:2.5mm;">6a</div>
						<div class="styGenericDiv" style="padding-left:3mm;width:155mm;">					 
							Have you previously made an election under Article XVIII(7) of the U.S.-Canada income tax 	treaty to defer U.S. income tax on the undistributed earnings of the plan?
								 <span style="letter-spacing:3mm;font-weight:bold;width:20mm"> .....................</span>
								 <span style="">
									 <img alt="arrow" src="{$ImagePath}/4972_Bullet_Md.gif"/>
								  </span>
								  </div>
						<div style="width:32mm;text-align:left;padding-left:1mm;padding-top:3.5mm;height:7mm;">
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox">
									  <xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralElectPreviousInd"/>
										<xsl:with-param name="BackupName">IRS8891USTaxDeferralElectPreviousInd</xsl:with-param>
									  </xsl:call-template>
									</input>
									<label>
									  <xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralElectPreviousInd"/>
										<xsl:with-param name="BackupName">IRS8891USTaxDeferralElectPreviousInd</xsl:with-param>
									  </xsl:call-template>
									  <span class="styBoldText" style="padding-left:1mm;">Yes</span>
									</label>
									 <span style="padding-left:5mm;"></span> 
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox">
									  <xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralElectPreviousInd"/>
										<xsl:with-param name="BackupName">IRS8891USTaxDeferralElectPreviousInd</xsl:with-param>
									  </xsl:call-template>
									</input>
									
									<label>
									  <xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralElectPreviousInd"/>
										<xsl:with-param name="BackupName">IRS8891USTaxDeferralElectPreviousInd</xsl:with-param>
									  </xsl:call-template>
									  <span class="styBoldText" style="padding-left:1mm;">No</span>
									</label>
									
								</div>
						</div>

						<!-- Line (6)b -->
						<div class="styGenericDiv" style="187mm;">
							<div class="styLNLeftNumBox" style="width:5mm;padding-left:3.5mm;">b</div>
							<div class="styGenericDiv" style="padding-left:3mm;width:155mm">
								If &#8220;Yes,&#8221; enter the first year the election came into effect
								<span style="width:24.5mm;border-bottom:1px solid;text-align:center">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralElectionFirstYr"/>
										</xsl:call-template>
								</span>
                and go to line 7a. If &#8220;No,&#8221; go to line 6c.
							</div>
						</div>
						<!-- Line (6)c -->
						
						<div class="styGenericDiv" style="187mm;border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="width:5mm;padding-left:3.5mm;">c</div>
						<div class="styGenericDiv" style="padding-left:3mm;width:156mm;">					 
							If you have not previously made the election described on line 6a above, you can make an irrevocable election for this year and subsequent years by checking this box
								 <span style="letter-spacing:3mm;font-weight:bold;width:20mm"> ......................</span>
								 <span style="">
									 <img alt="arrow" src="{$ImagePath}/4972_Bullet_Md.gif"/>
								  </span>
								  </div>
						<div style="width:32mm;text-align:left;padding-left:1mm;padding-top:3.5mm;height:7mm">
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox">
									  <xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralNewElectionInd"/>
										<xsl:with-param name="BackupName">IRS8891USTaxDeferralNewElectionInd</xsl:with-param>
									  </xsl:call-template>
									</input>
									<label>
									  <xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8891Data/USTaxDeferralElectPreviousInd"/>
										<xsl:with-param name="BackupName">IRS8891USTaxDeferralElectPreviousInd</xsl:with-param>
									  </xsl:call-template>
									  <span class="styBoldText" style="padding-left:1mm;"></span>
									</label>
								</div>
						</div>
					<!-- Line 7a -->
					<div class="styGenericDiv" style="width:187mm;border-top:1px solid black;padding-top:2mm;">
					<div class="styLNLeftNumBox" style="width:6mm;padding-left:2.5mm;">7a</div>
					<div class="styGenericDiv" style="padding-left:3mm;width:142mm;">
                  Distributions received from the plan during the year. Enter here and include on Form 1040,
                  line 16a
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">7a</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireCYDistributionAmt"/>
								</xsl:call-template>
							</div>
					</div>
					<!-- Line (7)b -->
					<div class="styGenericDiv" style="width:187mm">
					<div class="styLNLeftNumBox" style="width:6mm;padding-left:3.5mm;">b</div>
					<div class="styGenericDiv" style="padding-left:3mm;width:142mm;">
                  Taxable distributions received from the plan during the year. Enter here and include on
                  Form 1040, line 16b
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">7b</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireCYTxblDistriAmt"/>
								</xsl:call-template>
							</div>
					</div>
					<!-- Line 8 -->
					<div class="styGenericDiv" style="width:187mm">
					<div class="styLNLeftNumBox" style="width:6mm;padding-left:2.5mm;">8</div>
					<div class="styGenericDiv" style="padding-left:3mm;width:142mm;">
								Plan balance at the end of the year. If you checked the &#8220;Annuitant&#8221; box on line 5, the &#8220;Yes&#8221; box
								on line 6a, or the box on line 6c, <b>stop here. Do not </b>complete the rest of the form
					</div>
					<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">8</div>
					<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireEOYPlanBalanceAmt"/>
						</xsl:call-template>
					</div>
					</div>
					<!-- Line 9 -->
					<div class="styGenericDiv" style="width:187mm">
					<div class="styLNLeftNumBox" style="width:6mm;padding-left:2.5mm;">9</div>
					<div class="styGenericDiv" style="padding-left:3mm;width:142mm;">
					Contributions to the plan during the year
					</div>
                <div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">9</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireCYContributionAmt"/>
								</xsl:call-template>
							</div>
					</div>
					<!-- Line 10 -->
					<div class="styGeneric Div" style="width:187mm;height:8mm;">
								<div class="styLNLeftNumBox" style="width:6mm;padding-top:4mm">10</div>
								<div class="styGenericDiv" style="width:142mm;padding-left:3mm;padding-top:4mm">
								<b>Undistributed earnings of the plan during the year:</b>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;background-color:lightgrey"/>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:28mm;"/>
					</div>
					<!-- Line (10)a -->
					
					<div class="styGenericDiv" style="height:8mm;width:187mm">
								<div class="styLNLeftNumBox" style="padding-left:3.5mm;width:6mm;padding-top:4mm">a</div>
								<div class="styGenericDiv" style="padding-left:3mm;width:142mm;padding-top:4mm">Interest income. Enter here and include on Form 1040, line 8a
										<span style="letter-spacing:3mm;font-weight:bold;width:20mm"> ...............</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">10a</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CARetireCYUndistrIntIncAmt"/>
								</xsl:call-template>
								</div>
					</div>
					<!-- Line (10)b -->
					<div class="styGenericDiv" style="width:187mm">
						<div class="styLNLeftNumBox" style="padding-left:3.5mm;width:6mm;padding-top:4mm">b</div>
								<div class="styGenericDiv" style="width:142mm;padding-top:4mm;padding-left:3mm">Total ordinary dividends. Enter here and include on Form 1040, line 9a
										<span style="letter-spacing:3mm;font-weight:bold;width:20mm"> ............</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">10b</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireCYUndistrOrdDivAmt"/>
								</xsl:call-template>
								</div>
					</div>
					<!-- Line (10)c -->
					<div class="styGenericDiv" style="width:187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;width:6mm;padding-top:4mm">c</div>
					<div class="styGenericDiv" style="width:142mm;padding-top:4mm;padding-left:3mm">
Qualified dividends. Enter here and include on Form 1040, line 9b
						<span style="letter-spacing:3mm;font-weight:bold;width:20mm"> ..............</span>
					</div>
								<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">10c</div>
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CARetireCYUndistrQlfyDivAmt"/>
								</xsl:call-template>
					</div>
					</div>
					<!-- Line (10)d -->
					<div class="styGenericDiv" style="width:187mm">
					<div class="styLNLeftNumBox" style="padding-left:3mm;width:6mm;padding-top:4mm">d</div>
					<div class="styGenericDiv" style="width:142mm;padding-top:4mm;padding-left:3mm">
Qualified dividends. Enter here and include on Form 1040, line 9b
						<span style="letter-spacing:3mm;font-weight:bold;width:20mm"> ..............</span>
					</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;">10d</div>
					
								<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireCYUndistrCapGnAmt"/>
								</xsl:call-template>
							</div>
					</div>
					<!-- Line (10)e -->
					<div class="styGenericDiv" style="width:187mm">
						<div class="styLNLeftNumBox" style="padding-left:3mm;width:6mm;padding-top:4mm">e</div>
						<div class="styGenericDiv" style="width:142mm;padding-top:4mm">Other income. Enter here and include on Form 1040, line 21. List type and amount 			
							  <img alt="arrow" src="{$ImagePath}/4972_Bullet_Md.gif"/> <span style="border-bottom:dashed 1px black;width:20mm"></span>
						</div>

						<div class="styLNRightNumBoxNBB" style="height:8mm;width:7.755mm;padding-top:4mm;border-bottom:1px solid black;background-color:lightgrey"/>
						<div class="styLNAmountBoxNBB" style="height:8mm;width:31mm;padding-top:4mm;border-bottom:1px solid black"/>			
									
					</div> 
					
					
					<xsl:for-each select="$Form8891Data/CanadaRetireUndistrOthIncome">
						<div style="width:187mm;height:7mm;padding-left:8mm">
							<div class="styGenericDiv" style="height:7mm;border-bottom:1 dashed;width:140.25mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="UndistributedOtherIncomeType"/>
								</xsl:call-template>
								<span style="width:4mm;"/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="UndistributedOtherIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;width:7.755mm;background-color:lightgrey"/>
							<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm"></div>
						</div>
					
					</xsl:for-each>

		<!-- Line after (10)e -->
					<div class="styGenericDiv" style="width:187mm">
						<div class="styGenericDiv" style="width:148.2mm"/>
						<div class="styLNRightNumBoxNBB" style="height:7mm;width:7.755mm">10e</div>
						<div class="styLNAmountBoxNBB" style="padding-top:3mm;width:31mm;height:7mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8891Data/CanadaRetireCYUndistrOthIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Footer-->
					<div class="pageEnd" style="width:187mm;border-top: 2px solid black;padding-top:0mm;">
						<div class="styGenericDiv">
							<span class="styBoldText" style="font-size:8pt">For Paperwork Reduction Act Notice, see page 2.</span>
						</div>
						<div style="float:right;width:81mm;text-align:right;font-size:7pt">
              Cat. No. 37699X
              <span style="width:20mm;"/>
              Form <span class="styBoldText" style="font-size:9pt;">8891</span> (Rev. 7-2008)
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
							<xsl:with-param name="TargetNode" select="$Form8891Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<br/>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="MakeAddressLines">
		<xsl:choose>
			<xsl:when test="$Form8891Data/USAddress != ''">
				<xsl:call-template name="PopulateUSAddressTemplate">
					<xsl:with-param name="TargetNode" select="$Form8891Data/USAddress"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateForeignAddressTemplate">
					<xsl:with-param name="TargetNode" select="$Form8891Data/ForeignAddress"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="FlattenAndPopulateOtherIncome">
		<xsl:param name="OtherIncome"/>
		<xsl:for-each select="$OtherIncome">
			<tr style="border-color:black;font-size:7pt">
				<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td style="border-bottom:0.17mm;border-right:0.17mm;text-align:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="UndistributedOtherIncomeType"/>
					</xsl:call-template>
				</td>
				<td>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="UndistributedOtherIncomeAmt"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
