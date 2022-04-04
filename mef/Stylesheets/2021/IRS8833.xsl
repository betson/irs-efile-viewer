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
						<div class="styFNBox" style="width:31mm;font-size: 7pt;height: 19mm">
      Form <span class="styFormNumber">8833</span>
							<br/>
      (Rev. December 2021)      
      <span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm; height: 18mm">
							<div class="styMainTitle" style="height:8mm;">Treaty-Based Return Position Disclosure<br/>Under Section 6114 or 7701(b)</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:3mm;font-weight:bold; padding-top: 5mm">
								<img src="{$ImagePath}/8833_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return.
      </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px">
							<div class="styOMB" style="height:18mm; border-bottom-width: 0px; padding-top: 7mm">OMB No. 1545-1354</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<div class="styBB" style="width: 187mm">
    Attach a separate Form 8833 for each treaty-based return position taken. Failure to disclose a treaty-based return position may<br/>
    result in a penalty of $1,000 ($10,000 in the case of a C corporation) (see section 6712).
  </div>
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm; height: 8mm">
						<div class="styNameBox" style="width:139mm; height: 8mm;font-size:7pt;">
      Name<br/>
							<div style="font-family:verdana;font-size:6pt;height:6.25mm">
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
						<div class="styEINBox" style="padding-left:2mm;font-size:7pt;">
							<span class="BoldText">U.S. taxpayer identifying number</span>
							<br/>
							<br/>
							<span style="font-weight:normal;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/ReturnType='1040'">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<div style="width: 187mm; height: 11mm">
						<div class="styNameAddr" style="height: 26mm; padding-left:0px; width: 100mm; font-size:7pt;border-right-width: 1px">Address in country of residence<br/>
							<xsl:call-template name="PopulateForeignAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/AddressInCountryOfResidence"/>
							</xsl:call-template>
						</div>
						<div class="styNameAddr" style="height: 26mm;  width: 86mm;font-size:7pt;">Address in the United States<br/>
							<xsl:call-template name="PopulateUSAddressTemplate">
								<xsl:with-param name="TargetNode" select="$FormData/AddressInTheUS"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm">
    Check one or both of the following boxes as applicable:<br/>
						<br/>
					</div>
					<!--  First Bullet  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">
							<img src="{$ImagePath}/8833_Bullet_Round.gif" alt="RoundBullet"/>
						</div>
						<div style="float: left">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec6114"/>
									<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec6114</xsl:with-param>
								</xsl:call-template>
        The taxpayer is disclosing a treaty-based return position as required by section 6114
      </label>
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ............
      </span>
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<input type="checkbox" class="styCkbox" name="TreatybasedPositionSec6114">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec6114"/>
									<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec6114</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--  First Bullet  -->
					<!--  Second Bullet  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox">
							<img src="{$ImagePath}/8833_Bullet_Round.gif" alt="RoundBullet"/>
						</div>
						<div style="float: left">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec7701"/>
									<xsl:with-param name="BackupName">TreatybasedPositionSec7701</xsl:with-param>
								</xsl:call-template>
        The taxpayer is a dual-resident taxpayer and is disclosing a treaty-based return position as required by
      </label>
						</div>
					</div>
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox"/>
						<div style="float: left">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec7701"/>
									<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec7701</xsl:with-param>
								</xsl:call-template>
        Regulations section 301.7701(b)-7
      </label>
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
        .........................
      </span>
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<input type="checkbox" class="styCkbox" name="TreatybasedPositionSec7701">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TreatybasedPositionSec7701"/>
									<xsl:with-param name="BackupName">IRS8833TreatybasedPositionSec7701</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--  Second Bullet  -->
					<!--  U.S. citizen  -->
					<div class="styBB" style="width: 187mm; padding-top: 2mm; padding-bottom:2mm">
						<div style="float: left">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IsUSCitizenOrOther"/>
									<xsl:with-param name="BackupName">IRS8833IsUSCitizenOrOther</xsl:with-param>
								</xsl:call-template>
        Check this box if the taxpayer is a U.S. citizen or resident or is incorporated in the United States
      </label>
						</div>
						<div style="float:right">
							<span style="letter-spacing:4mm; font-weight:bold; float:left">  
        ..........
      </span>
							<img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<input type="checkbox" class="styCkbox" name="IsUSCitizenOrOther">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IsUSCitizenOrOther"/>
									<xsl:with-param name="BackupName">IRS8833IsUSCitizenOrOther</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--  U.S. citizen  -->
					<div class="styForm8833BB" style="width:187mm;height:31mm;">
						<div style="width:93.75mm;float:left;height:31mm;">
							<div class="styForm8833BB" style="height:12mm;">
								<span style="width:2mm;"/>
								<span style="font-weight:bold;">1</span>
								<span style="width:4mm;"/> Enter the specific treaty position relied on:<br/>
								<span style="height:4mm;padding-top:1mm;">
									<span style="width:4mm;"/>
									<span style="font-weight:bold;">a</span>
									<span style="width:3mm;"/>Treaty country
          <span class="styForm8833BB" style="width:63mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TreatyCountry"/>
										</xsl:call-template>
									</span>
								</span>
								<span style="width:4mm;"/>
								<span style="font-weight:bold;">b</span>
								<span style="width:3mm;"/>Article(s)<span style="width:3mm;"/>
								<br/>
								<span style="padding-left:8.75mm;width:85mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Article"/>
									</xsl:call-template>
								</span>
							</div>
							<div>
								<span style="width:2mm;"/>
								<span style="font-weight:bold;">2</span>
								<span style="width:4.75mm;"/>List the Internal Revenue Code provision(s) overruled or<br/>
								<span style="width:8.5mm"/>modified by the treaty-based return position<br/>
								<span style="padding-left:8.75mm;width:85mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRCProvisions"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styForm8833BB" style="width:93.5mm;float:right;height:31mm;border-bottom:0;border-left-width:1px;">
							<div class="styLNLeftNumBox" style="padding-left: 2mm">3</div>
							<div style="float:left">
      Name, identifying number (if available to the taxpayer),<br/>and address in the United States of the payor of the income (if<br/>fixed or determinable annual or periodical). See instructions.<br/>
								<div style="font-family:verdana;font-size:6pt;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/NameOfPayor/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/NameOfPayor/BusinessNameLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/NameOfPayor/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<xsl:if test="$FormData/PayorIdentificationNumber != ''">
									<br/>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/PayorIdentificationNumber"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/MissingEINReason !=' '">
									<span style="font-weight:normal;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
										</xsl:call-template>
									</span>
								</xsl:if>
								<xsl:if test="$FormData/USAddressOfPayor !=' '">
									<br/>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/USAddressOfPayor"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/ForeignAddressOfPayor !=' '">
									<br/>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignAddressOfPayor"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<!--  Line 4 -->
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">4</div>
						<span style="width: 175mm">
      List the provision(s) of the limitation on benefits article (if any) in the treaty that the taxpayer relies on to prevent application<br/>of that article
      <img src="{$ImagePath}/8833_Bullet.gif" alt="lBullet"/>
							<span style="width: 1mm"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ProvisionsOfLimitation"/>
							</xsl:call-template>
						</span>
					</div>
					<!--  Line 4 -->
					<!--  Line 5 -->
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">5</div>
						<div>
      Explain the treaty-based return position taken. Include a brief summary of the facts on which it is based. Also, list the nature<br/>
      and amount (or a reasonable estimate) of gross receipts, each separate gross payment, each separate gross income item,<br/>
							<span style="width: 9mm"/>or other item (as applicable) for which the treaty benefit is claimed
      <div style="margin-left: 9mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExplainTreatybsdPosOnBenefit"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  Line 5 -->
					<div style="width:187mm;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see page 3. </span>
						<span style="width:100px;"/>                      
    Cat. No. 14895L 
    <span style="width:133px;"/>  
    Form <span class="styBoldText">8833</span> (Rev. 12-2021)
  </div>
					<br/>
					<br class="pageEnd"/>
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
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
