<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2120Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form2120Data" select="$RtnDoc/IRS2120"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2120Data)"/>
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
				<meta name="Description" content="IRS Form 2120"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2120Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form2120">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;height:22mm;">
						<div class="styFNBox" style="width:31mm;height:22mm">
            Form<span class="styFormNumber" style="padding-left:2mm"> 2120</span>
            <div>(Rev. October 2005)</div>
							<div class="styAgency" style="padding-top:3mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm;">
							<div class="styMainTitle" style="padding-top:2mm;">Multiple Support Declaration</div><br/>
						<div class="styFST" style="font-size:7pt;padding-top:4mm;">
							<img src="{$ImagePath}/2120_Bullet.gif" width="9" height="9" alt="bullet image"/> Attach to Form 1040 or Form 1040A.</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:22mm;">
							<div class="styOMB" style="padding-top:3mm;padding-bottom:4mm;">OMB No. 1545-0074</div>
							<div class="stySequence" style="border-bottom-width:0px;padding-left:1mm;padding-top:2mm;border-left-width:0px;">
								Attachment<br/>
								Sequence No. <span class="styBoldText">114</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							Name(s) shown on return<br/>
				 <xsl:choose>
				 		<xsl:when test="normalize-space($Form2120Data/QualifyingPersonName) != ''">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2120Data/QualifyingPersonName/PersonFirstNm"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2120Data/QualifyingPersonName/PersonLastNm"/>
							</xsl:call-template>
							</xsl:when>
					    <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
					   </xsl:when>
				</xsl:choose>			
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;display:block;">
							Your social security number<br/>
							<span style="width:40mm;text-align:center;font-weight:normal;">
							<xsl:choose>
							<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
							   </xsl:call-template>
				   		  </xsl:when>
					    </xsl:choose>
      				   </span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
						<div style="width:187mm;font-size:8pt;"><span style="line-height:8mm;">During the calendar year 
						<span style="border-bottom:1px dashed black;width:30mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2120Data/CalendarYr"/>
							</xsl:call-template>
						</span>, the eligible persons listed below each paid over 10% of the support of:</span>
						</div>
						<div style="width:187mm;border-bottom:1px dashed black;"><span style="line-height:8mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2120Data/QualifyingPersonName/PersonFirstNm"/>
							</xsl:call-template>
							<span style="width:1mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form2120Data/QualifyingPersonName/PersonLastNm"/>
							</xsl:call-template>
						</span></div>
						<div style="width:187mm;text-align:center;">Name of your qualifying relative</div>
						<div style="width:187mm;font-size:8pt;padding:2mm 0mm;">
							I have a signed statement from each eligible person waiving his or her right to claim this person as a dependent for any tax year that began in the above calendar year.
						</div>
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="$Form2120Data/EligiblePersonWaivingDepdRight[1]"/>
						</xsl:call-template>
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="$Form2120Data/EligiblePersonWaivingDepdRight[2]"/>
						</xsl:call-template>
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="$Form2120Data/EligiblePersonWaivingDepdRight[3]"/>
						</xsl:call-template>
						<xsl:call-template name="makeRow">
							<xsl:with-param name="TargetNode" select="$Form2120Data/EligiblePersonWaivingDepdRight[4]"/>
						</xsl:call-template>
						<xsl:for-each select="$Form2120Data/EligiblePersonWaivingDepdRight[position() &gt; 4]">
							<xsl:call-template name="makeRow">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</xsl:for-each>
					<!-- capturing the page bottom info -->
					<div class="pageEnd" style="width:187mm; font-size:7pt;  border-top:1 solid black; padding-top:0.5mm">
						<div style="float:right">
						Cat. No. 11712F
						<span style="width:35mm"/>
						Form <b style="font-size:9pt">2120</b> (Rev. 10-2005)
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
							<xsl:with-param name="TargetNode" select="$Form2120Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Additional Data Table -->
				</form>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="makeRow">
		<xsl:param name="TargetNode"/>
		<div style="width:135mm;float:left;">
			<div style="width:135mm;border-bottom:1px dashed black;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/PersonFullName/PersonFirstNm"/>
				</xsl:call-template>
				<span style="width:4px;"/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode/PersonFullName/PersonLastNm"/>
				</xsl:call-template>
			</div>
			Eligible person's name
		</div>
		<div style="width:55mm;text-align:center;padding-left:10mm">
			<div style="width:35mm;border-bottom:1px dashed black;padding-left:10mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="$TargetNode/SSN"/>
				</xsl:call-template>
			</div>
			<span  style="padding-left:3mm;"> Social security number</span>
		</div>
		<div style="width:187mm;clear:both;padding-top:1.5mm;padding-bottom:4mm;">
			<div style="width:187mm;border-bottom:1px dashed black;">
				<xsl:choose>
					<xsl:when test="$TargetNode/USAddress">
						<xsl:call-template name="PopulateUSAddressTemplate">
							<xsl:with-param name="TargetNode" select="$TargetNode/USAddress"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$TargetNode/ForeignAddress">
						<xsl:call-template name="PopulateForeignAddressTemplate">
							<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</div>
			Address (number, street, apt. no., city, state, and ZIP code)
		</div>
	</xsl:template>
</xsl:stylesheet>