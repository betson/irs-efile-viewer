<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8833Style.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8833"/>
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
				<meta name="Description" content="Form IRS 8833"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8833Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass">
				<form name="Form8833">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height: 18mm">
						<div class="styFNBox" style="width:31mm;font-size: 7pt;">
							  Form <span class="styFormNumber">8833</span>
							<br/>
							  (Rev. December 2013)      
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:120mm; ">
							<div class="styMainTitle" style="height:8mm;">Treaty-Based Return Position Disclosure<br/>Under Section 6114 or 7701(b)</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold;padding-top:2mm; ">
								<img src="{$ImagePath}/8833_Bullet.gif" alt="MediumBullet"/>  
									Attach to your tax return.<br/>
								<img src="{$ImagePath}/8833_Bullet.gif" alt="MediumBullet"/>  
								Information about Form 8833 and its instructions is at <a href="http://www.irs.gov/form8833" title="Link to IRS.gov">
								<i>www.irs.gov/form8833</i></a>.        
						    </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:18mm; border-left-width: 1px;font-size:8pt;">
							<div class="styOMB" style="padding-top:7mm; border-bottom-width: 0px; ">OMB No. 1545-1354</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<div class="styBB" style="width: 187mm;">
					Attach a separate Form 8833 for each treaty-based return position taken. Failure to disclose a treaty-based return position may
					result in a penalty of $1,000 ($10,000 in the case of a C corporation) (see section 6712).
					</div>
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm; height:14mm"><!--font-size:6pt-->
						<div class="styNameBox" style="width:70mm;height:13.7mm;">
							  Name<br/>
							<div style="font-family:verdana;"><!--font-size:7pt;-->
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnType='1040'">
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">Name</xsl:with-param>
										</xsl:call-template>
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
							</div>
						</div>
						<div class="styNameBox" style="width:40mm;height:13.7mm;padding-left:2mm;font:bold;">
							<span class="BoldText">U.S. taxpayer identifying number</span>
							<br/>

							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$FormData/SSN">
										<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
									</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/EIN">
										<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/EIN"/>
									</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/EINMissingReasonCd"/>
									</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:60mm;padding-left:2mm;border-right-width:0px;">
							<span class="BoldText">Reference ID number, if any(see instructions)</span>
							
							<xsl:choose>
								<xsl:when test="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNumber">
									<span style="font-weight:normal;">
									<xsl:choose>
										<xsl:when test="count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNumber) &gt; 1">
											See Additional Data Table
										</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNumber"/>
												</xsl:call-template>
											</xsl:otherwise>
									</xsl:choose>
									</span>
								</xsl:when>
								<xsl:when test="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
									<span style="font-weight:normal;">
										<xsl:choose>
											<xsl:when test="count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1">
												See Additional Data Table
											</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:otherwise>
										</xsl:choose>
									</span>
								</xsl:when>
							</xsl:choose>
						</div>						
					</div>
					<!--  End Name and Employer indentification number  -->
					<div style="width: 187mm; "><!--height: 11mm;font-size:6pt-->
						<div class="styNameAddr" style="height: 16mm; padding-left:0px; width: 90mm;border-right-width: 1px">Address in country of residence<br/>
							<xsl:call-template name="PopulateForeignAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignResidenceAddress"/>
							</xsl:call-template>
						</div>
						<div class="styNameAddr" style="height: 16mm;  width: 90mm;">Address in the United States<br/>
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/USAddress"/>
							</xsl:call-template>
						</div>
					</div>
    				<div style="width: 187mm;">
							Check one or both of the following boxes as applicable:<br/>
					</div>
					<!--  First Bullet  -->
					<div style="width: 187mm; line-height:2;">
						<div class="styLNLeftNumBox" style="">
							<img src="{$ImagePath}/8833_Bullet_Round.gif" alt="RoundBullet"/>
						</div>
						<div style="float: left">The taxpayer is disclosing a treaty-based return position as required by section 6114</div>
	
						
						<div style="float:right;">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">.....
							</span>
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<input type="checkbox" alt="TreatybasedPositionSec6114Ind" class="styCkbox" name="TreatybasedPositionSec6114Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec6114Ind"/>
									<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec6114Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec6114Ind"/>
									<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec6114Ind</xsl:with-param>
								</xsl:call-template>								
							</label>
						</div>
					</div>			<br/>		
					<!--  First Bullet  -->
					<!--  Second Bullet  -->
					<div style="width: 187mm; float:left; line-height:2">
						<div class="styLNLeftNumBox" style=""><!-- padding-top:1mmfloat:leftheight:4mm -->
							<img src="{$ImagePath}/8833_Bullet_Round.gif" alt="RoundBullet"/>
						</div>
						
							<div style="float:left">The taxpayer is a dual-resident taxpayer and is disclosing a treaty-based return position as required by Regulations section 301.7701(b)-7</div>
	
							<div style="float:right">
								<span style="letter-spacing:4mm; font-weight:bold; ">.....................</span>
								<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
								<span style="width: 1mm;" /><!--float:right-->
								<input type="checkbox" alt="TreatybasedPositionSec7701Ind" class="styCkbox" name="TreatybasedPositionSec7701Ind" >
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec7701Ind"/>
										<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec7701Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec7701Ind"/>
										<xsl:with-param name="BackupName">TreatybasedPositionSec7701Ind</xsl:with-param>
									</xsl:call-template>
									
								</label>
						
							</div>
						</div>
							
					<div class="styBB" style="width: 187mm;">						
						<div style="width: 187mm;padding-top:0.5mm;padding-left:2mm">
							Note: If the taxpayer is a dual-resident taxpayer and a long-term resident, by electing to be treated as a resident of a foreign country for purposes of claiming benefits under an applicable income tax treaty, the taxpayer will be deemed to have expatriated pursuant to section 877A.  For more information, see the instructions.
						</div> 
					</div>
					<!--  Second Bullet  -->
					<!--  U.S. citizen  -->
					<div class="styBB" style="width: 187mm;">
						<div style="float: left">Check this box if the taxpayer is a U.S. citizen or resident or is incorporated in the United States</div>
						
						<div style="float:right;">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">...</span>
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<input type="checkbox" alt="USCitizenOrOtherInd" class="styCkbox" name="USCitizenOrOtherInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrOtherInd"/>
									<xsl:with-param name="BackupName">IRS8833USCitizenOrOtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/USCitizenOrOtherInd"/>
									<xsl:with-param name="BackupName">IRS8833USCitizenOrOtherInd</xsl:with-param>
								</xsl:call-template>
									
						    </label>
						
						</div>
					</div>
					<!--  U.S. citizen  -->
					<div  style="width:187mm;height:auto"><!--class="styForm8833BB";-->
						<div class="styForm8833BB" style="width:90mm;float:left;border-right:1px solid black; border-bottom:0px;"><!--border-bottom:1px solid black-->
							<div style="height:24mm; border-bottom:1px solid black;width:90mm">
								<div class="styLNLeftNumBox" style="font-weight:bold; width:3mm;height:24mm">1</div>
								<span style="padding-left:2mm;"> Enter the specific treaty position relied on:</span><br/>
								<span style="height:4mm;padding-top:1mm;">
									<span style="font-weight:bold;padding-left:2mm">a</span>
									<span style="padding-left:2mm;">Treaty country: </span>
									<span style="width:40mm;"><!--class="styUnderlinedText"  font-size:7pt-->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TreatyCountryCd"/>
										</xsl:call-template>
									</span>
									
								</span><br/>
								<span style="font-weight:bold;padding-left:2mm;vertical-align:top">b</span>
								<span style="padding-left:2mm;vertical-align:top">Article(s):</span>
								<span style="padding-left:7mm;width:65mm;font-size:7pt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TreatyArticleTxt"/>
									</xsl:call-template>
								</span>
							</div>
<!-- item 2 -->	
							<div class="styForm8833BB" style="width:90mm;height:24mm;border-bottom:0px; "><!--font-size:10pt border-bottom:1px solid black;background-color:purple-->
								<!--<span style="font-weight:bold; width:3mm; vertical-align:top">2</span>-->
								<div class="styLNLeftNumBox" style="width:3mm;height:24mm;">2</div>		
								<!--<div>-->								
								<span style="width:80mm;">
								<span style="padding-left:2mm"><!--width:80mm;padding-left:4mm;-->
									List the Internal Revenue Code provision(s) overruled or modified by the treaty-based return position
									<br/>
									<span  style="font-size:8pt;padding-top:1mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRCProvisionsTxt"/>
										</xsl:call-template>
									</span>
								</span></span><!--</div>-->	
							</div>
						</div>
						<div  class="styForm8833BB" style="float:left;width:95mm;height:42mm;border-bottom:0px;">
							<span class="styLNLeftNumBox" style="font-weight:bold; width:4mm; height:44mm; vertical-align:top">3</span>
							
							<!--<div style="width:90mm">-->
							<span style="float:none;width:80mm"> <!--padding-left:4mm-->
							  Name, identifying number (if available to the taxpayer),
							  and address in the United States of the payor of the income (if fixed  or determinable annual or periodical). See instructions.<br/>
								<span style="float:none; font-family:verdana;font-size:6pt;padding-top:1mm">
									<!--<xsl:choose>
										<xsl:when test="$Type = '2290' or $Type = '720' or $Type = '8849' and $Type = '941' or $Type = '941PR' or $Type = '941SS'">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PayorName/BusinessNameLine1"/>
									</xsl:call-template><br/>
									<xsl:if test="$FormData/PayorName/BusinessNameLine2 != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PayorName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
									</xsl:when>
									<xsl:otherwise>-->
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PayorName/BusinessNameLine1Txt"/>
									</xsl:call-template><br/>
									<xsl:if test="$FormData/PayorName/BusinessNameLine2Txt != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PayorName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<!--</xsl:otherwise>
									</xsl:choose>--><br/>
								<!--</div>-->
								<xsl:if test="$FormData/PayorEIN != ''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PayorEIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/MissingEINReasonCd !=' '">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
										</xsl:call-template>
									</span>
								</xsl:if>
								<br/>
								<xsl:if test="$FormData/PayorUSAddress !=' '">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/PayorUSAddress"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/PayorForeignAddress !=' '">
									<br/>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/PayorForeignAddress"/>
									</xsl:call-template>
								</xsl:if>
							</span>	
							<!--	</div>-->
							</span>
						</div>
					</div>
					
					<!--  Line 4 -->
					<div class="styBB" style="width: 187mm; padding-top:3mm; border-top:1px solid black; height:auto">
						<div class="styLNLeftNumBox" style="padding-left: 2mm; height:10mm">4</div>
						<span style="width: 175mm">
							 List the provision(s) of the limitation on benefits article (if any) in the treaty that the taxpayer relies on to prevent application of that article
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<span  class="styUnderlinedText" style="  font-size:8pt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ProvisionsOfLimitationTxt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--  Line 4 -->
					<!--  Line 5 -->
					<div class="styBB" style="width: 187mm;">
						<div class="styLNLeftNumBox" style="padding-left: 2mm; height:14mm">5</div>
						<span style="width: 177mm;">
      					<div style="float:none;width:177mm;">
									  Is the taxpayer disclosing a treaty-based return position for which reporting is specifically required pursuant 
									  to Regulations section 301.6114-1(b)?
									  <span style="width:5mm"></span>
										<span style="letter-spacing:4mm; font-weight:bold;">........</span>
								<!--<span style="width:7mm"></span>-->
							<!--<div class="styLNDesc" style="width:9mm;height:4.5mm;padding-top:1.5mm;text-align:right;">-->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DisclosingTreatySec3016114Ind"/>
									</xsl:call-template>
									<input type="checkbox" alt="DisclosingTreatySec3016114IndYes" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DisclosingTreatySec3016114Ind"/>
											<xsl:with-param name="BackupName">IRS8833DisclosingTreatySec3016114Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/DisclosingTreatySec3016114Ind"/>
										<xsl:with-param name="BackupName">IRS8833DisclosingTreatySec3016114Ind</xsl:with-param>
									</xsl:call-template>
									  Yes
								</label>
							<!--</div>-->
							<!--<div class="styLNDesc" style="width:15mm;height:4.5mm;padding-top:1.5mm;text-align:right;">-->
								<span>
								<span style="width:5mm"></span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DisclosingTreatySec3016114Ind"/>
									</xsl:call-template>
									<input type="checkbox" alt="DisclosingTreatySec3016114IndNo" class="styCkbox" name="Checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/DisclosingTreatySec3016114Ind"/>
											<xsl:with-param name="BackupName">IRS8833DisclosingTreatySec3016114Ind</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/DisclosingTreatySec3016114Ind"/>
										<xsl:with-param name="BackupName">IRS8833DisclosingTreatySec3016114Ind</xsl:with-param>
									</xsl:call-template>
										  No
							    </label><br/>
							<!--</div>-->
						<!--</div>	-->
							If "Yes", enter the specific subsection(s) 301.6114-1(b) requiring reporting
							<span style="letter-spacing:4mm; font-weight:bold; float:none;">.....</span>
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 2mm;"/>
							<span  class="styUnderlinedText" style="width:50mm;  font-size:8pt">						
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRCSubsectionTxt"/>
								</xsl:call-template>
							</span>
							. Also include the information requested in line 6.					
						</div></span>
						
					</div>
					<!--  Line 5 -->					
					<!--  Line 6 -->
					<div  style="width: 187mm; border-top:0px ; border-bottom:1px solid black;float:left;">

						<span class="styLNLeftNumBox" style=";padding-left: 2mm; height:14mm">6</span>
						<span style=" width:178mm;float:left">
						Explain the treaty-based return position taken. Include a brief summary of the facts on which it is based. Also, list the nature
						and amount (or a reasonable estimate) of gross receipts, each separate gross payment, each separate gross income item,
						or other item (as applicable) for which the treaty benefit is claimed</span><br/>
							<span  style="margin-left: 9mm;float:left"><!--class="styUnderlinedText"-->
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExplainTreatybasedPosOnBnftTxt"/>
								</xsl:call-template>
							</span>
						</div>
					<!--</div>-->
					<!--  Line 6 -->
	
						<!--BEGIN FOOTER-->
					<div class="pageEnd" style="clear:both;width:187mm;page-break-after:always">
						<span style=" float: left; clear: none;font-size:6pt;">
							<span class="styBoldText">For Privacy Act and Paperwork Reduction Act Notice, see Instructions.</span>
						</span>
						<span style="width:90mm; float:right;  font-size:7pt;"><span style="width:50mm">Cat. No. 14895L</span>
						<span style="width:40mm; font-size:7pt; float:right;">Form  <span class="styBoldText" style="font-size: 7pt;"> 8833 </span>  (Rev. 12-2013)</span></span>
					</div> 
					<!--END FOOTER-->					
					
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" >
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
					<!-- END Left Over Table -->
					<xsl:if test="count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum)  &gt; 1 or count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNumber)  &gt; 1">
				<!--BEGIN Reference ID number -->
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;text-align:left;">
										Reference ID number
								</th>
							</tr>
						</thead>
						<tbody>
						<xsl:choose>
							<xsl:when test="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
							<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellText" style="width:179mm;">
										<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
							</xsl:when>
							<xsl:when test="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNumber">
							<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNumber">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellText" style="width:179mm;">
										<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
							</xsl:when>
						</xsl:choose>
						</tbody>
					</table>
					<!-- END Reference ID number  -->
				</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
