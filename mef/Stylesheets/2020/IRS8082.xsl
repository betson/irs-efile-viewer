<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8082Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8082Data" select="$RtnDoc/IRS8082"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8082Data)"/>
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
				<meta name="Description" content="Form IRS8082"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS8082Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8082">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<div style="width:187mm;" class="styTBB">
						<div style="width:32mm;height:24.5mm;" class="styFNBox">
							<div style="height:12mm;">Form<span class="styFormNumber">  8082</span>
								<br/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8082Data"/>
								</xsl:call-template>
								<br/>
								<br/>
								(Rev. September 2018)
							</div>
							<br/>
							<br/>
							<div style="height:11mm;padding-top:3mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div style="width:123mm;height:23.5mm;" class="styFTBox">
							<div class="styMainTitle" style="height:10mm;padding-top:1mm;">
								Notice of Inconsistent Treatment or Administrative Adjustment Request (AAR)
							</div>
							<div style="height:9mm;font-size:7pt;padding-top:.5mm;font-weight: bold;">
    (For use by partners, S corporation shareholders, estate and domestic trust beneficiaries,
    foreign trust owners and beneficiaries, REMIC residual interest holders, TMPs, and PRs.) 
							</div>
							<div style="height:3.5mm;font-size:7pt;padding-top:1.5mm;" class="styFST">
								<img src="{$ImagePath}/8082_Bullet.gif" alt="Bullet Image"/>
								Go to  			
								<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form8082" title="Link to IRS.gov"><i>www.irs.gov/Form8082</i></a>
								for instructions and the latest information.
							</div>
						</div>
						<div style="width:31mm;height:24.5mm;" class="styTYBox">
							<div style="height:8mm;padding-top:2mm;" class="styOMB">
								OMB No. 1545-0790
							</div>
							<div style="height:8mm;text-align:left;padding-left:1mm;border-bottom-width:0px;padding-top:4mm" class="styOMB">
    Attachment <br/>Sequence No. <span class="styBoldText">84</span>
							</div>
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div style="width:138mm;height:auto;font-weight:normal;font-size:7pt;" class="styNameBox">
						Name(s) shown on return<br/>
						<span>
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$Form8082Data"/>
							</xsl:call-template>
						</span>
					</div>
					<div style="width:49mm;height:auto;padding-left:2mm;font-weight:normal;font-size:7pt;" class="styEINBox">
    Identifying number<br/>
					<br/>
						<span style="font-size: 7pt; font-weight: normal;text-align:left; vertical-align: bottom;">
							<xsl:call-template name="PopulateFilerTIN">
								<xsl:with-param name="TargetNode" select="$Form8082Data"/>
							</xsl:call-template>
						</span>
						</div>
					</div>
					<!-- Begin Part I -->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
								General Information  
						</div>
					</div>
					<div style="width:187mm;" class="styBB">
						<div class="styGenericDiv" style="187mm;">
							<div class="styLNLeftNumBox">1</div>
							<div class="styLNDesc" style="width:159mm;">Check boxes that apply.  </div>
						<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;">Yes</div>
						<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;text-align:center;font-weight:bold;padding-top:.7mm;">No</div>
						</div>
						<!-- Line 1a -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:4mm;">(a)</div>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<input alt="Notice of inconsistent treatment" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/NoticeOfInconsistentTrtmntInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/NoticeOfInconsistentTrtmntInd"/>
									</xsl:call-template>            
									Notice of inconsistent treatment (go to Line 2)
								</label>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>
					<!-- Line 1b  R1-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" style="height:8mm;">(b)</div>
							<div class="styLNDesc" style="width:159mm;height:8mm;">
								<span style="width:3px;"/>
								<input alt="AAR" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/AdministrativeAdjustmentReqInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/AdministrativeAdjustmentReqInd"/>
									</xsl:call-template>            
									AAR (choose one below - see instructions)
								</label>
							</div>	
							<div class="styShadingCell" style="height:8mm;width:10mm;"/>
							<div class="styShadingCell" style="height:8mm;width:10mm;"/>
						</div>
					<!-- Line 1b  R2-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<u>For partnership tax years beginning <b>before</b> January 1, 2018 (unless electing into BBA)</u>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>
					<!-- Line 1b  R3 TEFRA AAR-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<input alt="TEFRA AAR" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/TEFRAAARInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/TEFRAAARInd"/>
									</xsl:call-template>            
									TEFRA AAR
								</label>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>						
					<!-- Line 1b  R4 ELP REMIC-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<input alt="ELPs REMICs" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/ELPREMICInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/ELPREMICInd"/>
									</xsl:call-template>            
									ELPs/REMICs
								</label>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>												
					<!-- Line 1b  R5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:8mm;">
								<u>For partnership tax years beginning <b>after</b> December 31, 2017 (or that elected into BBA for tax years beginning after November 2, 2015, and before January 1, 2018)</u>
							</div>	
							<div class="styShadingCell" style="height:8mm;width:10mm;"/>
							<div class="styShadingCell" style="height:8mm;width:10mm;"/>
						</div>
					<!-- Line 1b  R6 BBA AAR-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:6mm;">
								<span style="width:3px;"/>
								<input alt="BBA AAR" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/BBAAARInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/BBAAARInd"/>
									</xsl:call-template>            
									BBA AAR - go to Question A below
								</label>
							</div>	
							<div class="styShadingCell" style="height:6mm;width:10mm;"/>
							<div class="styShadingCell" style="height:6mm;width:10mm;"/>
						</div>		
					<!-- Line 1(b)A R1,2-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:6mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:6mm;padding-left:2.5mm;">A</div>
									<div class="styLNDesc" style="width:150mm;height:6mm;">
										Is the partnership revoking the immediately preceding Partnership Representative (and/or designated individual, if applicable) and appointing a successor (including the designated individual, if applicable) at the same time that the AAR
								</div>
							</div>	
							<div class="styShadingCell" style="height:6mm;width:10mm;"/>
							<div class="styShadingCell" style="height:6mm;width:10mm;"/>
						</div>						
					<!-- Line 1(b)A R3-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styLNDesc" style="width:150mm;height:4mm;">
										is being filed? If “Yes,” attach Form 8979
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="  $Form8082Data/RvkPROrDesgIndivApptSccssrInd"/>
									</xsl:call-template>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:2mm;">.....................</span>
								</div>
							</div>	
							<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/RvkPROrDesgIndivApptSccssrInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/RvkPROrDesgIndivApptSccssrInd"/>
								</xsl:call-template>
							</div>
						</div>						
					<!-- Line 1(b)B R1-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:3mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:3mm;padding-left:2.5mm;">B</div>
									<div class="styLNDesc" style="width:150mm;height:4mm;">
										Do the adjustments on the AAR result in an imputed underpayment for the reviewed year? If “Yes,” go to
Question C. 
								</div>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>						
					<!-- Line 1(b)B R2-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styLNDesc" style="width:150mm;height:4mm;">
										If “No,” go to Question D
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:2mm;">.........................</span>
								</div>
							</div>	
							<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/AARAdjImputedUnderpaymentInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/AARAdjImputedUnderpaymentInd"/>
								</xsl:call-template>
							</div>
						</div>						
					<!-- Line 1(b)C R1-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:3mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:3mm;padding-left:2.5mm;">C</div>
									<div class="styLNDesc" style="width:150mm;height:4mm;">
										Is the partnership making an election under section 6227(b)(2) to have the adjustments taken into account by the 
								</div>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>						
					<!-- Line 1(b)C R2-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styLNDesc" style="width:150mm;height:4mm;">
										reviewed year partners? If “Yes,” go to Question D. If “No,” go to Question E
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
								</div>
							</div>	
							<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/Section6227b2ElectonInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8082LNYesNoBox" style="height:4mm;width:10mm;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/Section6227b2ElectonInd"/>
								</xsl:call-template>
							</div>
						</div>						
					<!-- Line 1(b)D R1,2-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:6mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:6mm;padding-left:2.5mm;">D</div>
									<div class="styLNDesc" style="width:150mm;height:6mm;">
										The partnership is required to provide statements to the reviewed year partners containing their share of the adjustments. By signing below, the Partnership Representative declares, under penalties of perjury, that all statements
								</div>
							</div>	
							<div class="styShadingCell" style="height:6mm;width:10mm;"/>
							<div class="styShadingCell" style="height:6mm;width:10mm;"/>
						</div>						
					<!-- Line 1(b)D R3-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:4mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styLNDesc" style="width:150mm;height:4mm;">
										 have been provided to the reviewed year partners as required by the instructions.
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:2mm;">..........</span>
								</div>
							</div>	
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
							<div class="styShadingCell" style="height:4mm;width:10mm;"/>
						</div>						
					<!-- Line 1(b)D R4-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:12mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:12mm;"/>
								<br/>
								<div style="width:135mm;height:12mm;">
									<div style="width: 100mm; float: left; clear none;">
										<div style="width: 4mm; float: left; clear: none;">
											<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
										</div>
										<div class="styBB" style="float: left; clear: none; width:90mm; height:4mm; border-style:solid">
											<span style="width:90mm">
<!--												<xsl:call-template name="PopulateReturnHeaderPartner">
													<xsl:with-param name="TargetNode">Name</xsl:with-param>
													</xsl:call-template>
-->												</span>
										</div>
										<div style="float: left; clear: none; width:90mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left">
											Partnership Representative Name (or designated individual, if appropriate)
										</div>
									</div>
									<div style="width:30mm; float: right;clear none;">
										<div style="width: 4mm; float: left; clear: none;">
											<img src="{$ImagePath}/1120_Bullet_Lg.gif" alt="LargeBullet"/>
										</div>
										<div class="styBB" style="float: right; clear: none; width:25mm;height:4mm; border-style:solid;">
											<span style="width:80px">
<!--												<xsl:call-template name="PopulateReturnHeaderPartner">
													<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
												</xsl:call-template>
-->											</span>
										</div> 
										<div style="float: right; clear: none; width:25mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left;">Date</div>
									</div>
								</div>
							</div>
							<div class="styShadingCell" style="height:12mm;width:10mm;"/>
							<div class="styShadingCell" style="height:12mm;width:10mm;"/>
						</div>						
					<!-- Line 1(b)E-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD"/>
							<div class="styLNDesc" style="width:159mm;height:6mm;">
								<span style="width:3px;"/>
								<div class="styLNLeftNumBox" style="height:6mm;padding-left:2.5mm;">E</div>
								<div class="styLNDesc" style="width:150mm;height:6mm;">
										 Is the partnership applying modifications to the imputed underpayment? If “Yes,” attach Form 8980
									<!--Dotted Line-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8082Data/ImputedUnderpaymentModifInd"/>
								</xsl:call-template>
									<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
								</div>
							</div>	
							<div class="styIRS8082LNYesNoBox" style="height:6mm;width:10mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateYesBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/ImputedUnderpaymentModifInd"/>
								</xsl:call-template>
							</div>
							<div class="styIRS8082LNYesNoBox" style="height:6mm;width:10mm;border-bottom-width: 0px;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/ImputedUnderpaymentModifInd"/>
								</xsl:call-template>
							</div>
						</div>						
					</div>
					<div style="width:187mm;height:auto;padding-bottom:1mm;" class="styBB">
						<div style="width:187mm">
							<div class="styLNLeftNumBox">2</div>
							<div style="float:left;padding-top:0.5mm;padding-bottom:.5mm;">
     Identify type of pass-through entity in which you are a partner, shareholder, or member.
    </div>
						</div>
						<div style="width:187mm">
							<div class="styLNLeftNumBox"/>
							<div style="float:left;width:179mm;">
								<span class="styBoldText">(a)</span>
								<span style="width:1mm;"/>
								<input alt="TEFRA Partnership" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/TEFRAPartnershipEntityInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/TEFRAPartnershipEntityInd"/>
									</xsl:call-template>            
        TEFRA Partnership
      </label>
								<span style="width:4mm;"/>
								<span class="styBoldText">(b)</span>
								<span style="width:1mm;"/>
								<input alt="S corporation" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/SCorporationEntityInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/SCorporationEntityInd"/>
									</xsl:call-template>            
        S corporation
      </label>
								<span style="width:4mm;"/>
								<span class="styBoldText">(c)</span>
								<span style="width:1mm;"/>
								<input alt="Estate" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/EstateEntityInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/EstateEntityInd"/>
									</xsl:call-template>            
        Estate
      </label>
								<span style="width:4mm;"/>
								<span class="styBoldText">(d)</span>
								<span style="width:1mm;"/>
								<input alt="Trust" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/TrustEntityInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/TrustEntityInd"/>
									</xsl:call-template>            
        Trust
      </label>
								<span style="width:4mm;"/>
								<span class="styBoldText">(e)</span>
								<span style="width:1mm;"/>
								<input alt="REMIC" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/REMICEntityInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/REMICEntityInd"/>
									</xsl:call-template>            
									REMIC
								</label>
								<span style="width:4mm;"/>
								<span class="styBoldText">(f)</span>
								<span style="width:1mm;"/>
								<input alt="BBA Partnership" type="checkbox" class="styCkbox" onclick="return false;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form8082Data/BBAPartnershipEntityInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form8082Data/BBAPartnershipEntityInd"/>
									</xsl:call-template>            
									BBA Partnership
								</label>
							</div>
						</div>
					</div>
					<div style="width:187mm;height:10mm;" class="styBB">
						<div style="width:87mm;height:10mm;" class="styIRS8082AddRightLine">
							<div class="styLNLeftNumBox" style="width:6mm;">3</div>
							<div style="padding-top:0.5mm;padding-bottom:.5mm;width:80mm;padding-left:2mm;">
							  Employer identification number of pass-through entity
								<xsl:if test="$Form8082Data/PassThroughEntityEIN !=' '">
									<span style="text-align:left;width:60mm;padding-top:1mm;"  valign="bottom;">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form8082Data/PassThroughEntityEIN"/>
										</xsl:call-template>
									</span>
								</xsl:if>
								<xsl:if test="$Form8082Data/MissingEINReasonCd !=' '">
									<span style="font-weight:normal;text-align:left;width:60mm;padding-top:1mm;" valign="bottom;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8082Data/MissingEINReasonCd"/>
										</xsl:call-template>
									</span>
								</xsl:if>
							</div>
						</div>
						<div style="width:100mm;height:10mm;" class="styGenericDiv">
							<div class="styLNLeftNumBox" style="width:6mm;">5</div>
							<div style="padding-top:0.5mm;padding-bottom:.5mm;">
								<span style="font-size:6pt;">Internal Revenue Service Center where pass-through entity filed its return</span>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/ServiceCenterWhereRetFiledCd"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  <div style="width:100mm;height:10mm;" class="styGenericDiv">        
    <div class="styLNLeftNumBox" style="width:6mm;">6</div>
    <div style="float:right;padding-top:0.5mm;padding-bottom:.5mm;">
      Tax shelter registration number (if applicable) of pass-through entity <br /><span style="text-align:center;width:60mm;padding-top:3mm;" valign="bottom;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form8082Data/ TaxShelterRegistrationNumber"/>
      </xsl:call-template></span>
    </div>
  </div>  -->
					</div>
					<div class="styBB" style="width:187mm;float:none;">
						<div class="styIRS8082AddRightLine" style="width:87mm;height:auto;min-height:24mm;">
							<div class="styLNLeftNumBox">4</div>
							<div class="styGenericDiv" style="width:78.5mm;">
      Name, address, and ZIP code of pass-through entity <br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8082Data/PassThroughEntityName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="$Form8082Data/PassThroughEntityName/BusinessNameLine2Txt != ''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8082Data/PassThroughEntityName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8082Data/PassThroughEntityName/InCareOfName != ''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8082Data/PassThroughEntityName/InCareOfName"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8082Data/PassThroughEntityUSAddress">
									<br/>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form8082Data/PassThroughEntityUSAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form8082Data/PassThroughEntityFrgnAddress">
									<br/>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$Form8082Data/PassThroughEntityFrgnAddress"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<div class="styGenericDiv" style="width:100mm;height:24mm;border-right-width:0px;">
							<div style="width:100mm;height:12mm;" class="styBB">
								<div class="styLNLeftNumBox" style="width:6mm;">6</div>
								<div style="padding-top:0.5mm;padding-bottom:.5mm;width:94mm;" class="styLnDesc">
        Tax year of pass-through entity
        <span style="width:8px;"/>
									<span style="width:18mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8082Data/TaxYearOfPassThruEntityFromDt"/>
										</xsl:call-template>
									</span>
									<span style="width:8px;"/>to
        <span style="width:8px;"/>
									<span style="width:18mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8082Data/TaxYearOfPassThruEntityToDt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div style="width:100mm;height:12mm;border-bottom-width:0px;" class="styBB">
								<div class="styLNLeftNumBox" style="width:6mm;">7</div>
								<div style="padding-top:0.5mm;padding-bottom:.5mm;width:94mm;" class="styLnDesc">
        Your tax year<span style="width:12px;"/>
									<span style="width:18mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8082Data/YourTaxYearFromDt"/>
										</xsl:call-template>
									</span>
									<span style="width:12px;"/>to<span style="width:12px;"/>
									<span style="width:18mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8082Data/YourTaxYearToDt"/>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Begin Part II -->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
    Inconsistent or Administrative Adjustment Request (AAR) Items
  </div>
						<div class="styGenericDiv" style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'TPctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Beginning table -->
					<div style="height:auto;" id="TPctn" class="styTableContainer">
						<xsl:call-template name="SetInitialState"/>
						<table id="TYTable" name="TYTable" cellspacing="0" class="styTable">
							<thead class="styTableThead" style="border-color:black;">
								<tr>
									<th scope="col" style="width:66mm;font-weight:normal;text-align:center" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(a)</span> Description of inconsistent or <br/>
										administrative adjustment request (AAR) items<br/>
                    (see instructions)
        </th>
									<th scope="col" style="width:28mm;font-weight:normal;" class="styTableCellHeader" colspan="2">
										<span class="styBoldText">(b)</span> Inconsistency is in, or AAR is to correct (check boxes that apply)
        </th>
									<th scope="col" style="width:32mm;border-right-width:1px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(c)</span> Amount as shown on Schedule K-1, Schedule Q,<br/> or similar statement, a foreign trust statement, or
          your return, whichever applies (see instructions)
        </th>
									<th scope="col" style="width:34mm;border-left-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(d)</span> Amount you are reporting
        </th>
									<th scope="col" style="width:27mm;border-right-width:0px;font-weight:normal;" class="styTableCellHeader" rowspan="2">
										<span class="styBoldText">(e)</span> Difference between (c) and (d)
        </th>
								</tr>
								<tr>
									<th scope="col" style="width:13mm;font-weight:normal;" class="styTableCellHeader">
          Amount of item
        </th>
									<th scope="col" style="width:13mm;font-weight:normal;" class="styTableCellHeader">
          Treatment of item
        </th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:choose>
								<xsl:when test="$Form8082Data/InconOrAdminAdjRequestItems">
									<tbody style="border-color:black;">
										<xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &lt; 5))">
											<xsl:for-each select="$Form8082Data/InconOrAdminAdjRequestItems">
												<tr style="vertical-align:bottom;height:8mm;">
													<td style="width:66mm;text-align:left;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">
                    width:66mm;text-align:left;border-bottom-width:0px;
                  </xsl:attribute>
														</xsl:if>
														<div style="width:5mm;text-align:right;padding-right:2mm;" class="styGenericDiv">
															<xsl:if test="position() = 1">
																<span style="font-weight:bold;">8</span>
															</xsl:if>
															<xsl:if test="position() = 2">
																<span style="font-weight:bold;">9</span>
															</xsl:if>
															<xsl:if test="position() = 3">
																<span style="font-weight:bold;">10</span>
															</xsl:if>
															<xsl:if test="position() = 4">
																<span style="font-weight:bold;">11</span>
															</xsl:if>
														</div>
														<div class="styGenericDiv" style="vertical-align:bottom">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ReferenceLineNum"/>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="LineNumberDescOfInconItemTxt"/>
															</xsl:call-template>
															<span style="width:1px;"/>
														</div>
													</td>
													<td style="width:13mm;text-align:center;vertical-align:bottom;padding-top:3mm;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">
                    width:13mm;text-align:center;border-bottom-width:0px;vertical-align:bottom;padding-top:2mm;
                  </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AmountOfItemInd"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:13mm;text-align:center;vertical-align:bottom;padding-top:2mm;" valign="bottom" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">
                    width:13mm;text-align:center;border-bottom-width:0px;
                  </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TreatmentOfItemInd"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:32mm;border-right-width:1px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">
                    width:32mm;border-right-width:1px;border-bottom-width:0px;text-align:right;vertical-align:bottom;
                  </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="AdjustmentRequestAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:34mm;border-left-width:0px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">
                    width:34mm;border-right-width:1px;border-bottom-width:0px;text-align:right;vertical-align:bottom;
                  </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="ReportingAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
													<td style="width:27mm;border-right-width:0px;" class="styTableCell">
														<xsl:if test="position() = last() and position() &gt;= 4">
															<xsl:attribute name="style">
                    width:27mm;border-right-width:0px;border-bottom-width:0px;text-align:right;vertical-align:bottom;
                  </xsl:attribute>
														</xsl:if>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="AdjustmentAndReportedDiffAmt"/>
														</xsl:call-template>
														<span style="width:1px;"/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 1) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
<!--											<div style="width:5mm;text-align:right;padding-right:2mm;" class="styGenericDiv">
-->												<xsl:call-template name="populateirs8082partiiemptycells">
													<xsl:with-param name="index">8</xsl:with-param>
												</xsl:call-template>
											<!--</div>-->
										</xsl:if>
										<xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 2) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
<!--											<div style="width:5mm;text-align:right;padding-right:2mm;" class="styGenericDiv">
-->												<xsl:call-template name="populateirs8082partiiemptycells">
													<xsl:with-param name="index">9</xsl:with-param>
												</xsl:call-template>
											<!--</div>-->
										</xsl:if>
										<xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 3) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
<!--											<div style="width:5mm;text-align:right;padding-right:2mm;" class="styGenericDiv">
-->												<xsl:call-template name="populateirs8082partiiemptycells">
													<xsl:with-param name="index">10</xsl:with-param>
												</xsl:call-template>
<!--											</div>
-->										</xsl:if>
										<xsl:if test="(count($Form8082Data/InconOrAdminAdjRequestItems)&lt; 4) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4))">
<!--											<div style="width:5mm;text-align:right;padding-right:2mm;" class="styGenericDiv">
-->												<xsl:call-template name="populateirs8082partiiemptycells">
													<xsl:with-param name="index">11</xsl:with-param>
													<xsl:with-param name="end">true</xsl:with-param>
												</xsl:call-template>
<!--											</div>
-->										</xsl:if>
									</tbody>
								</xsl:when>
								<xsl:otherwise>
									<tbody style="border-color:black;">
										<xsl:call-template name="populateirs8082partiiemptycells">
											<xsl:with-param name="index">8</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8082partiiemptycells">
											<xsl:with-param name="index">9</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8082partiiemptycells">
											<xsl:with-param name="index">10</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="populateirs8082partiiemptycells">
											<xsl:with-param name="index">11</xsl:with-param>
											<xsl:with-param name="end">true</xsl:with-param>
										</xsl:call-template>
									</tbody>
								</xsl:otherwise>
							</xsl:choose>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'TPctn' "/>
					</xsl:call-template>
						<!--footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 49975G</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8082</span> (Rev. 9-2018)</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- header -->
					<div class="styBB" style="width:187mm;clear:both;padding-bottom:.5mm;">
						<div style="width:90mm;" class="styGenericDiv">Form 8082 (Rev. 9-2018)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Begin Part III -->
					<div style="width:187mm;height:12mm" class="styBB">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							Explanations—Enter the Part II item number before each explanation. If more space is needed, continue your explanations on the back. Also, show how the imputed underpayment was calculated and how modifications were applied.
						</div>
					</div>
					<!-- Start part III table -->
					<table id="TYTable" name="TYTable" cellspacing="0" class="styTable" style="width:187mm;border-style: solid; border-color: black;       border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;clear:both;">
						<thead class="styTableThead">
  </thead>
						<tfoot/>
						<tbody>
							<xsl:choose>
								<xsl:when test="$Form8082Data/InconOrAdminAdjRequestItems">
									<xsl:if test="($Print != $Separated) or (($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &lt;8))">
										<xsl:call-template name="populateirs8082partiiidatarows"/>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="populateirs8082partiiiemptyrows"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$Form8082Data/InconOrAdminAdjRequestItems">
								<xsl:if test="($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
									<xsl:call-template name="populateirs8082partiiiemptyrows"/>
								</xsl:if>
							</xsl:if>
						</tbody>
					</table>
					<div style="width:187mm;clear:both;border-top:1px solid black;">
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8082</span> (Rev. 9-2018)</div>
					</div>
					<div class="pageEnd"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
    Additional Data        
  </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8082Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4)">
						<br/>
						<span class="styRepeatingDataTitle">Form 8082 - Inconsistent or Administrative Adjustment Request (AAR) Items  </span>
						<table class="styDepTbl" style="font-size: 6pt">
							<thead class="styDepTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" style="width:78mm;font-weight:normal;text-align:center;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(a)</span> Description of inconsistent or <br/>administrative adjustment request (AAR) items<br/>
                    (see instructions)
        </th>
									<th scope="col" style="width:30mm;font-weight:normal;vertical-align:middle;" class="styDepTblCell" colspan="2">
										<span class="styBoldText">(b)</span> Inconsistency is in, or AAR is to correct (check boxes that apply)
        </th>
									<th scope="col" style="width:24mm;border-right-width:1px;font-weight:normal;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(c)</span> Amount as shown on Schedule K-1, Schedule Q,<br/> or similar statement, a foreign trust statement, or
          your return, whichever applies (see instructions)
        </th>
									<th scope="col" style="width:24mm;font-weight:normal;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(d)</span> Amount you are reporting
        </th>
									<th scope="col" style="width:24mm;font-weight:normal;vertical-align:middle;" class="styDepTblCell" rowspan="2">
										<span class="styBoldText">(e)</span> Difference between (c) and (d)
        </th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" style="width:15mm;font-weight:normal;vertical-align:middle;" class="styDepTblCell">
          Amount of item
        </th>
									<th scope="col" style="width:15mm;font-weight:normal;vertical-align:middle;" class="styDepTblCell">
          Treatment of item
        </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="border-color:black;">
								<xsl:for-each select="$Form8082Data/InconOrAdminAdjRequestItems">
									<tr style="vertical-align:bottom;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td style="width:78mm;text-align:left;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 4">
												<xsl:attribute name="style">
                    width:78mm;text-align:left;border-bottom-width:0px;
                  </xsl:attribute>
											</xsl:if>
											<span style="width:4mm;font-weight:bold;text-align:right;padding-right:1mm;" class="styGenericDiv">
												<xsl:value-of select="position()+7"/>
											</span>
											<span class="styGenericDiv">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ReferenceLineNum"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNumberDescOfInconItemTxt"/>
												</xsl:call-template>
											</span>
										</td>
										<td style="width:15mm;text-align:center;vertical-align:bottom;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 4">
												<xsl:attribute name="style">
                    width:15mm;text-align:center;border-bottom-width:0px;vertical-align:bottom;
                  </xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AmountOfItemInd"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:15mm;text-align:center;vertical-align:bottom;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 4">
												<xsl:attribute name="style">
                    width:15mm;text-align:center;border-bottom-width:0px;vertical-align:bottom;
                  </xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TreatmentOfItemInd"/>
											</xsl:call-template>
											<span style="width:1px;"/>
										</td>
										<td style="width:24mm;border-right-width:1px;vertical-align:bottom;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 4">
												<xsl:attribute name="style">
                    width:24mm;border-right-width:1px;border-bottom-width:0px;vertical-align:bottom;
                  </xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentRequestAmt"/>
											</xsl:call-template>
										</td>
										<td style="width:24mm;border-left-width:0px;vertical-align:bottom;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 4">
												<xsl:attribute name="style">
                    width:24mm;border-right-width:1px;border-bottom-width:0px;vertical-align:bottom;
                  </xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ReportingAmt"/>
											</xsl:call-template>
										</td>
										<td style="width:24mm;border-right-width:0px;vertical-align:bottom;" class="styDepTblCell">
											<xsl:if test="position() = last() and position() &gt;= 4">
												<xsl:attribute name="style">
                    width:24mm;border-right-width:0px;border-bottom-width:0px;vertical-align:bottom;
                  </xsl:attribute>
											</xsl:if>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustmentAndReportedDiffAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
						<br/>
						<span class="styRepeatingDataTitle">Form 8082 - Explanations—Enter the Part II item number before each explanation. If more space is needed, continue
your explanations on the back.</span>
						<table class="styDepTbl" style="font-size: 7pt">
							<thead class="styTableThead"/>
							<tfoot/>
							<tbody>
								<xsl:call-template name="populateirs8082partiiidatarows"/>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="populateirs8082partiiiemptyrows">
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;text-align: left; font-size: 7pt" class="styTableCell">
				<xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems/ExplanationTxt"/>
					</xsl:call-template>
				</xsl:if>
				<span style="width:1px;"/>
			</td>
		</tr>
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell">
				<span style="width:1px;"/>
			</td>
		</tr>
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell">
				<span style="width:1px;"/>
			</td>
		</tr>
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell">
				<span style="width:1px;"/>
			</td>
		</tr>
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell">
				<span style="width:1px;"/>
			</td>
		</tr>
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell">
				<span style="width:1px;"/>
			</td>
		</tr>
		<tr style="height:8mm;vertical-align:bottom;">
			<td style="width:187mm;border-style:solid;border-right-width:0px;" class="styTableCell">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="populateirs8082partiiidatarows">
		<xsl:for-each select="$Form8082Data/InconOrAdminAdjRequestItems">
			<tr style="height:8mm;vertical-align:bottom;">
				<xsl:if test="($Print = $Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;7)">
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				</xsl:if>
				<td style="width:187mm;text-align:left;border-style:solid;border-right-width:0px;" class="styTableCell">
					<xsl:if test="position() = last()">
						<xsl:attribute name="style">
            width:187mm;text-align:left;border-style:solid;border-right-width:0px;border-bottom-width:0px;
          </xsl:attribute>
					</xsl:if>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ReferenceLineNum"/>
					</xsl:call-template>
					<span style="width:4mm;"/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
					</xsl:call-template>
					<span style="width:1px;"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="populateirs8082partiiemptycells">
		<xsl:param name="index"/>
		<xsl:param name="end">false</xsl:param>
		<tr style="height:8mm;vertical-align:bottom;">
			<xsl:if test="($end = 'false')">
				<td class="styTableCell" style="width:66mm;text-align:left;font-weight:bold;font-size: 7pt">
					<span style="width:5mm;text-align:right;padding-right:2mm;">
						<xsl:value-of select="$index"/>
					</span>
					<span style="font-weight: normal">
						<xsl:if test="($Print=$Separated) and (count($Form8082Data/InconOrAdminAdjRequestItems) &gt;4) and ($index = 8)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form8082Data/InconOrAdminAdjRequestItems/LineNumberDescOfInconItemTxt"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</td>
				<!--td style="width:57mm;" class="styTableCell"> <span style="width:1px;"></span></td-->
				<td style="width:13mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:13mm;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:32mm;border-right-width:1px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:34mm;border-left-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:27mm;border-right-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
			<xsl:if test="($end != 'false')">
				<td class="styTableCell" style="width:66mm;text-align:left;font-weight:bold;border-bottom-width:0px;">
					<xsl:value-of select="$index"/>
				</td>
				<!--td style="width:57mm;border-bottom-width:0px;" class="styTableCell"> <span style="width:1px;"></span></td-->
				<td style="width:13mm;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:13mm;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:32mm;border-right-width:1px;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:34mm;border-left-width:0px;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
				<td style="width:27mm;border-right-width:0px;border-bottom-width:0px;" class="styTableCell">
					<span style="width:1px;"/>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
</xsl:stylesheet>