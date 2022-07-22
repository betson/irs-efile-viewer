<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 9/14/2010 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040ScheduleRData" select="$RtnDoc/IRS1040ScheduleR"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040ScheduleRData)"/>
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
				<meta name="Description" content="IRS Form 1040ScheduleR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 1040ScheduleR CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS1040ScheduleRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1040ScheduleR">
					<!-- WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;height:21.5mm;">
						<div class="styFNBox" style="width:28mm;height:21.5mm;">
							<div style="line-height:180%;">
								<span class="styFormNumber" style="font-size:9pt;">Schedule R</span>
								<span class="styFormNumber" style="font-size:8pt;">(Form 1040A<br/>or 1040)</span>
							</div>
							<div style="padding-top:1.3mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:105.6mm;height:22mm; padding-top:0.5mm;">
							<div class="styLNDesc" style="height:10mm;font-size: 13pt;font-weight: bold;width:104.6mm;padding-bottom:4.3mm;text-align:center;padding-right:4mm;">Credit for the Elderly or the Disabled
							</div>
				<div class="styGenericDiv" style="height:3mm;margin-top:0.5mm;font:size:6pt;width:97mm;">
				                <span style="font-weight: bold;  ;">
								<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
								<span style="width:0.5mm;"/>
								Complete and attach to Form 1040A or 1040.</span>
       <br/>
                                <span style="font-weight: bold;  ;">
								<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
								<span style="width:0.5mm;"/>
								Information about Schedule R and its separate instructions is at<br/> www.irs.gov/scheduler.</span>
        </div>
  						</div>
					<div class="styLNDesc" style="height:5mm;width:23mm;padding-top:6mm;">
							<img src="{$ImagePath}/1040SchR_Top_Forms.gif" alt="Bullet Image"/>
					</div>
						<div class="styTYBox" style="width:30mm;height:21.5mm;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-0074</div>
							<div class="styTaxYear">20<span class="styTYColor">15</span>
							</div>
							<div style="margin-left:3mm; text-align:left;padding-top:1.5mm;">
          Attachment<br/>Sequence No. <span class="styBoldText">16</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
        Name(s) shown on Form 1040A or 1040<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:45mm;height:8mm;font-size:7pt;padding-left:2mm;">
        Your social security number<br/>
							<span class="styEINFld" style="width:30mm; text-align:left;font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styNBB" style="width:187mm;height:14mm;font-size:8.5pt;padding-top:1.5mm;">
						<div class="styLNDesc" style="width:187mm;height:5mm;padding-top:1.5mm;">
            You may be able to take this credit and reduce your tax if by the end of 2015:</div>
						<div class="styLNDesc" style="width:53mm;height:5mm;">
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
               You were age 65 or older <span class="styBoldText">
								<span style="width:8px"/>or</span>
						</div>
						<div class="styLNDesc" style="width:4mm;height:5mm;">
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
							<span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:125mm;height:5mm;"> 
				You were under age 65, you retired on <b>permanent and total </b>disability, and<br/>
          		you received taxable disability income.</div>
					</div>
					<div class="styBB" style="width:187mm;font-size:8.5pt;">
						<div class="styLNDesc" style="width:187mm;height:4mm;">
            But you must also meet other tests. See instructions.</div>
						<div class="styLNDesc" style="width:187mm;height:8mm;padding-bottom:2.5mm;">
							<img src="{$ImagePath}/1040SchR_Tip.gif" alt="Tip Image" align="middle"/>
							<span style="height:4mm;padding-left:1mm;padding-bottom:1.5mm;">In most cases, the IRS can figure the credit for you. See instructions.</span>
						</div>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:12mm;font-size: 9pt;">Part l</div>
						<div class="styPartDesc" style="font-size: 9pt;padding-left:6mm;width:160mm;">Check the Box for Your Filing Status and Age</div>
					</div>
						<!-- END Part I Title -->
					<div class="styBB" style="width:187mm;font-size: 9pt;">
						<span class="styBoldText">
							<span style="width:55mm;">If your filing status is:  </span>
							<span style="width:85mm;font-size: 9pt;">And by the end of 2017:</span>
							<span style="width:44.5mm;font-size: 9pt;text-align:right;">Check only one box:</span>
						</span>
					</div>
					<div class="styBB" style="width:45mm;;padding-top:2mm;height:16mm;font-size: 8.5pt;">Single,<br/>Head of household,<br/>or Qualifying widow(er)</div>
					<!-- Primary 65 or Older Ind. -->
					<div class="styNBB" style="width:142mm;height:10mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">1</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">
								You were 65 or older
							</span>	
          <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....................</span>	  
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">1</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Primary65OrOlderInd"/>
									<xsl:with-param name="BackupName">SchRPrimary65OrOlderInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Primary65OrOlderInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="65 or older">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Primary65OrOlderInd"/>
									<xsl:with-param name="BackupName">SchRPrimary65OrOlderInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Under 65 Retired on Permanent Disability -->
					<div class="styBB" style="width:142mm;height:6mm;font-size: 8pt;padding-top:0mm;padding-bottom:2mm;float:left;clear:none;">
						<div class="styForm1040SchRLNRightNumBox" style="height:6mm;width:6mm;padding-left:0mm;">2</div>
						<div class="styLNDesc" style="width:118mm;">
							<span style="float:left;clear:none;">
								You were under 65 and you retired on permanent and total disability
							</span>	
          <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>	  
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:6mm;width:6mm;padding-left:0mm;">2</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Und65RtdPermnntTotDsbltyInd"/>
									<xsl:with-param name="BackupName">SchRUnd65RtdPermnntTotDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Und65RtdPermnntTotDsbltyInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="under 65">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Und65RtdPermnntTotDsbltyInd"/>
									<xsl:with-param name="BackupName">SchRUnd65RtdPermnntTotDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styBB" style="width:45mm;;padding-top:19mm;height:20mm;font-size: 8.5pt;border-bottom:0px;">Married filing<br/>jointly</div>
					<!-- Both Spouses 65 or Older -->
					<div class="styNBB" style="width:142mm;height:6mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styForm1040SchRLNRightNumBox" style="height:2mm;width:6mm;padding-left:0mm;">3</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">	
								Both spouses were 65 or older
							</span>	
          <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>	
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:6mm;width:6mm;padding-left:0mm;">3</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothSpouses65OrOlderInd"/>
									<xsl:with-param name="BackupName">SchRBothSpouses65OrOlderInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Und65RtdPermnntTotDsbltyInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt=" Both spouses were 65 or older">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothSpouses65OrOlderInd"/>
									<xsl:with-param name="BackupName">SchRBothSpouses65OrOlderInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Both Under 65, One Retired on Permanent Disability -->
					<div class="styNBB" style="width:142mm;height:10mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">4</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
							Both spouses were under 65, but only one spouse retired on permanent and<br/>
							total disability
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">......................</span>	
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-top:4mm;padding-left:0mm;">4</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;padding-top:4mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothUnder65OneRtdDsbltyInd"/>
									<xsl:with-param name="BackupName">SchRBothUnder65OneRtdDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothUnder65OneRtdDsbltyInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox"  alt="Both spouses were under 65">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothUnder65OneRtdDsbltyInd"/>
									<xsl:with-param name="BackupName">SchRBothUnder65OneRtdDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Both Under 65, Both Retired on Permanent Disability -->
					<div class="styNBB" style="width:142mm;height:10mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">5</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
							Both spouses were under 65, and both retired on permanent and total<br/>
							disability
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">........................</span>
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-top:4mm;padding-left:0mm;">5</div>
						<div class="styForm1040SchRCkBox" style="width:11mm;padding-top:4mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothUnder65BothRtdDsbltyInd"/>
									<xsl:with-param name="BackupName">SchRBothUnder65BothRtdDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothUnder65BothRtdDsbltyInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox"  alt="Both spouses were under 65 and retired">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/BothUnder65BothRtdDsbltyInd"/>
									<xsl:with-param name="BackupName">SchRBothUnder65BothRtdDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- One Over 65, Other Retired on Permanent Disability -->
					<div class="styNBB" style="width:187mm;height:10mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:45mm;padding-bottom:0mm;"/>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">6</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">One spouse was 65 or older, and
									 the other spouse was under 65 and retired<br/>on permanent and total disability
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-top:4mm;padding-left:0mm;">6</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;padding-top:4mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/One65OrOlderOtherRtdDsbltyInd"/>
									<xsl:with-param name="BackupName">SchROne65OrOlderOtherRtdDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/One65OrOlderOtherRtdDsbltyInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="One spouse was 65 or older">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/One65OrOlderOtherRtdDsbltyInd"/>
									<xsl:with-param name="BackupName">SchROne65OrOlderOtherRtdDsbltyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- One Over 65, Other Not Retired -->
					<div class="styBB" style="width:187mm;height:12mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:45mm;padding-bottom:0mm;"/>
						<div class="styForm1040SchRLNRightNumBox" style="height:12mm;width:6mm;padding-left:0mm;">7</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
							One spouse was 65 or older, and the other spouse was under 65 and <b>not </b><br/>
							retired on permanent and total disability
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">............</span>
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:12mm;width:6mm;padding-top:4mm;padding-left:0mm;">7</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;padding-top:4mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/One65OrOlderOtherNotRtdInd"/>
									<xsl:with-param name="BackupName">SchROne65OrOlderOtherNotRtdInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/One65OrOlderOtherNotRtdInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="One spouse was 65 or older not retired">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/One65OrOlderOtherNotRtdInd"/>
									<xsl:with-param name="BackupName">SchROne65OrOlderOtherNotRtdInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Over 65, Did Not Live With Spouse -->
					<div class="styNBB" style="width:187mm;height:10mm;font-size: 8.5pt;padding-top:2mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:45mm;padding-top:4mm;padding-bottom:0mm;">Married filing<br/>separately</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">8</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
							<span style="float:left;clear:none;">		
								You were 65 or older and you lived apart from your spouse for all of 2017</span>	 
          <!--Dotted Line-->
							<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">.</span>
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-top:1mm;padding-left:0mm;">8</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;padding-top:1mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Age65OrOldrNotLvngTogetherInd"/>
									<xsl:with-param name="BackupName">SchRAge65OrOldrNotLvngTogetherInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Age65OrOldrNotLvngTogetherInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="You were 65 or older">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Age65OrOldrNotLvngTogetherInd"/>
									<xsl:with-param name="BackupName">SchRAge65OrOldrNotLvngTogetherInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Under 65, Did Not Live With Spouse -->
					<div class="styBB" style="width:187mm;height:10mm;font-size: 8.5pt;padding-bottom:2mm;float:left;clear:none;">
						<div class="styLNDesc" style="width:45mm;padding-bottom:0mm;"/>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-left:0mm;">9</div>
						<div class="styLNDesc" style="width:118mm;padding-bottom:0mm;">
								You were under 65, you retired on permanent and total disability, and you<br/>
								lived apart from your spouse for all of 2017
          <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........</span>
						</div>
						<div class="styForm1040SchRLNRightNumBox" style="height:10mm;width:6mm;padding-top:4mm;padding-left:0mm;">9</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;padding-top:4mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Under65DidNotLiveTogetherInd"/>
									<xsl:with-param name="BackupName">SchRUnder65DidNotLiveTogetherInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Under65DidNotLiveTogetherInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="You were under 65">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/Under65DidNotLiveTogetherInd"/>
									<xsl:with-param name="BackupName">SchRUnder65DidNotLiveTogetherInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:21mm;font-size: 8.5pt;padding-top:.5mm;padding-bottom:.5mm;float:left;clear:none;">
					<span class="styPartDesc" style="height:4mm;"/>
						<div class="styPartDesc" style="width:32mm;height:13mm;padding-left:.5mm;       padding-top:1.5mm;padding-bottom:1.5mm;border-style: solid; border-color: black;       border-top-width: 2px;border-bottom-width: 2px; border-left-width: 2px;border-right-width: 2px;">
						Did you check<br/>box 1, 3, 7, or <br/>8?
						</div>
						<div class="styPartDesc" style="width:120mm;height:2mm;padding-left:0mm;padding-top:0mm;padding-bottom:0mm;float:left;clear:none;">
							<div class="styLNDesc" style="padding-bottom:5mm;">
								<img src="{$ImagePath}/1040SchR_Line.gif" alt="Line Image"/> Yes 
						<img src="{$ImagePath}/1040SchR_Line.gif" alt="Line Image"/>
								<img src="{$ImagePath}/1040SchR_Bullet_Sm.gif" alt="Bullet Image"/>
								<span style="width:2mm;"/>
								<span style="font-weight:normal;">Skip Part ll and complete Part lll on the back.</span>
							</div>
							<img src="{$ImagePath}/1040SchR_Line.gif" alt="Line Image"/> No <span style="width:1mm;"/>
							<img src="{$ImagePath}/1040SchR_Line.gif" alt="Line Image"/>
							<img src="{$ImagePath}/1040SchR_Bullet_Sm.gif" alt="Bullet Image"/>
							<span style="width:2mm;"/>
							<span style="font-weight:normal;">Complete Parts ll and lll.</span>
						</div>
						<span class="styPartDesc" style="height:4mm;"/>
					</div>
					<!-- BEGIN Part II Title Statement of Permanent and Total Disability-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:14mm;font-size: 9pt;">Part ll</div>
						<div class="styPartDesc" style="width:173mm;font-size: 8.5pt;padding-left:4mm;">Statement of Permanent and Total Disability
						 <span style="font-weight:normal;"> (Complete </span> only <span style="font-weight:normal;"> if you checked box 2, 4, 5, 6, or 9 above.)</span>
						</div>
					</div>
					<!-- END Part II Title -->
					<div class="styNBB" style="width:187mm; height:9mm;font-size: 8.5pt;padding-left:0mm;padding-top:1mm;padding-bottom:.5mm;float:left;clear:none;">
						<div class="styPartDesc" style="height:9mm;width:5mm;padding-right:1mm;padding-top:0.5mm;padding-bottom:0mm;">If:</div>
						<div class="styLNLeftNumBox" style="height:9mm;width:5mm;padding-left:3mm;padding-right:3mm;">1</div>
						<div class="styLNDesc" style="height:9mm;width:163mm;padding-left:0mm;padding-bottom:0mm;">You filed a physician&#39;s statement for this disability for 1983 or
						 an earlier year, or you filed or got a<br/>statement for tax years after 1983 and your physician signed line B on the statement,<b> and</b>
						  						</div>
					</div>
					<!-- Prior Year Statement Indicator -->
					<div class="styNBB" style="width:187mm;height:9mm;font-size: 8.5pt;padding-left:0mm;padding-top:1mm;padding-bottom:.5mm;float:left;clear:none;">
						<div class="styForm1040SchRLNRightNumBox" style="width:6mm;padding-top:1mm;padding-left:8mm;padding-right:3mm;float:left;clear:none;">2</div>
						<div class="styLNDesc" style="width:162mm;padding-left:2mm;padding-right:0mm;padding-top:.5mm;padding-bottom:0mm;float:left;clear:none;">
 						Due to your continued disabled condition, you were unable to engage in any substantial gainful activity<br/>in 2015, check this box
          <!--Dotted Line-->
							 <span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span> 
                            <xsl:call-template name="LinkToLeftoverDataTableInline">
                                <xsl:with-param name="Desc">Part II Line 2  -  Spouse Name</xsl:with-param>
                                <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd/@spouseNm"/>
                            </xsl:call-template>
                            <xsl:call-template name="LinkToLeftoverDataTableInline">
                                <xsl:with-param name="Desc">Part II Line 2  -  Person First Name</xsl:with-param>
                                <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd/@personFirstNm"/>
                            </xsl:call-template>
                            <span style="width:3px;"/>
							<img src="{$ImagePath}/1040SchR_Bullet_Sm.gif" alt="Bullet Image"/>
							<span style="width:3mm"/>
						</div>
						<div class="styForm1040SchRCkBox" style="width:12mm;padding-top:4mm;">
							<span style="width:2mm;"/>
							<span style="width:1px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd"/>
									<xsl:with-param name="BackupName">SchRPriorYearStatementInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="PopulateSpan">
							    <xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox" alt="disabled condition">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd"/>
									<xsl:with-param name="BackupName">SchRPriorYearStatementInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;padding-left:10mm;padding-top:1mm;padding-bottom:.5mm;float:left;clear:none;">
						<div class="styPartDesc" style="width:5mm;padding-right:1mm;padding-bottom:0mm;">
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
						</div>
						<div class="styLNDesc" style="width:163mm;padding-left:.5mm;padding-right:2mm;padding-top:.5mm;padding-bottom:0mm;float:left;clear:none;">
 						     If you checked this box, you do not have to get another statement for
 						     2015. 							   
						</div>
					</div>
					<div class="styBB" style="width:187mm;height:9mm;font-size: 8.5pt;padding-left:10mm;padding-top:1mm;padding-bottom:.5mm;float:left;clear:none;">
						<div class="styPartDesc" style="width:5mm;padding-right:1mm;padding-bottom:0mm;">
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
						</div>
						<div class="styLNDesc" style="width:163mm;padding-left:.5mm;padding-right:2mm;padding-top:.5mm;padding-bottom:0mm;float:left;clear:none;">
 						    If you <b>did not </b>check this box, have your physician complete the 
 						    statement in the instructions. You<b> must</b> keep the statement for your records.						   
						</div>
					</div>
					<!-- Start of Page End For Page 1 -->
					<!-- END of Page 1 -->
					<div class="pageEnd"  style="width:187mm;padding-top:1mm;padding-bottom:4mm;font-size:6.5pt;">
						<div style="width:105mm;font-weight:bold;float:left;clear:none;">For Paperwork Reduction Act Notice, see your tax return instructions.</div>
						<div style="width:25mm;float:left;clear:none;">Cat. No. 11359K</div>
						<div class="styPartDesc" style="width:55mm;text-align:right;font-size:6.5pt;float:right;clear:none;">Schedule R (Form 1040A or 1040) 2015</div>
					</div>
					<br/>
					<!-- Start of Page 2 -->
					<div class="styBB" style="width:187mm;font-size:7pt;">
						<div class="styLNDesc" style="width:90mm;padding-top:0mm;">Schedule R (Form 1040A or 1040) 2015</div>
						<div class="styLNDesc" style="width:90mm;text-align:right;float:right;clear:none;">Page  
						<span class="styBoldText" style="font-size:8pt;">2 </span>
						</div>
					</div>
					<!-- BEGIN Part III Title Figure Your Credit-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:14mm;font-size: 9pt;">Part lll</div>
						<div class="styPartDesc" style="width:173mm;font-size: 9pt;padding-left:4mm;">Figure Your Credit 
		 </div>
					</div>
					<!-- END Part III Title -->
					<!-- Filing Status Amount -->
					<div class="styNBB" style="width:187mm;font-size:8.5pt;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;padding-top:2mm;">10</div>
						<div class="styLNDesc" style="width:80.5mm;height:2mm;padding-top:2mm;">
							<b> If you checked (in Part l):</b>
						</div>
						<div class="styLNDesc" style="width:60mm;height:2mm;padding-right:0mm;padding-top:2mm;">
							<b>Enter:</b>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:10mm;width:5.7mm;padding-top:0mm;text-align:center;border-style:solid;   border-right-width:0px;border-left-width:1px;border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:10mm;padding-top:0mm;border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<div class="styNBB" style="width:187mm;font-size:8.5pt;">
						<span style="float:left;"><div class="styLNDesc" style="width:100.1mm;height:12mm;padding-left:8mm;padding-top:0mm;padding-right:5px;"><span style="float:left;">Box 1, 2, 4, or 7
							          <!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span></span><span style="float:right;">$5,000</span>
									 <span style="float:left;">Box 3, 5, or 6
									 <!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span></span><span style="float:right;">$7,500</span>
									 <span style="float:left;">Box 8 or 9
									 <!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..............</span></span><span style="float:right;">$3,750</span>
						</div>
						<div class="styLNDesc" style="height:12mm;width:1mm;padding-top:0mm;">
							<img src="{$ImagePath}/1040SchR_Bracket_Sm.gif" alt="Bullet Image"/>
						</div>
						<div class="styLNDesc" style="height:12mm;width:47.1mm;padding-top:3.5mm; ">
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.........</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:12mm;width:5.7mm;padding-top:5.5mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
					<span style="height:6mm;font-size: 8.5pt;width:5mm;padding-bottom:0mm; padding-top:1mm;        background-color: white;">10</span>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:6mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/FilingStatusAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;padding-top:0mm;padding-left:8mm;float:left;clear:none;">
						<div class="styPartDesc" style="width:27mm;height:11mm;padding-left:.5mm;border-style: solid;         border-color: black;border-top-width: 2px;          border-bottom-width: 2px; border-left-width: 2px;border-right-width: 2px;float:left;clear:none;">
						 		Did you check<br/>box 2, 4, 5, 6,<br/>or 9 in Part l?
						</div>
						<div class="styPartDesc" style="width:53mm;height:1mm;padding-left:0mm;padding-top:0mm;         float:left;clear:none;">
							<img src="{$ImagePath}/1040SchR_Long_Line.gif" alt="Line Image"/> Yes 
									<img src="{$ImagePath}/1040SchR_Long_Line.gif" alt="Line Image"/>
							<img src="{$ImagePath}/1040SchR_Bullet_Sm.gif" alt="Bullet Image"/>
						</div>
						<div class="styPartDesc" style="width:61.3mm;height:1mm;padding-top:0mm;float:left;clear:none;">
							<span style="width:2mm;"/>
							<span style="font-weight:normal;">You<b> must </b>complete line 11.</span>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:6.5mm;width:5.7mm;padding-top:0mm;         text-align:center;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:6.5mm;padding-top:0mm;border-left:1px solid black;         border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styPartDesc" style="width:53mm;height:1mm;padding-top:0mm;padding-left:0mm;         float:left;clear:none;">
							<img src="{$ImagePath}/1040SchR_Long_Line.gif" alt="Line Image"/> No 
									<span style="width:1mm;"/>
							<img src="{$ImagePath}/1040SchR_Long_Line.gif" alt="Line Image"/>
							<img src="{$ImagePath}/1040SchR_Bullet_Sm.gif" alt="Bullet Image"/>
						</div>
						<div class="styPartDesc" style="width:61.3mm;height:2mm;float:left;clear:none;">
							<span style="width:2mm;"/>
							<span style="font-weight:normal;">
									Enter the amount from line 10</span><br/>
							<span style="width:2mm;"/>
							<span style="font-weight:normal;">
									on line 12 and go to line 13.</span>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:6.8mm;width:5.7mm;padding-top:0mm;         text-align:center;border-style:solid;border-right-width:0px;border-left-width:1px;border-top-width:0px;         border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:6.8mm;padding-top:0mm;border-left:1px solid black;         border-bottom-width:0px;border-right-width:0px;width:10mm;"/>
					</div>
					<!-- Taxable Disability -->
					<div class="styNBB" style="width:187mm;font-size:8.5pt;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:2mm;padding-left:0mm;padding-top:0mm;">11</div>
						<div class="styLNDesc" style="width:140.5mm;height:4mm;padding-top:0mm;">
							<b> If you checked (in Part l):</b>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:5mm;width:5.7mm;padding-top:0mm;         text-align:center;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:5mm;padding-top:0mm;border-left:1px solid black;         border-bottom-width:0px;border-right-width:0px;"/></span>
						<span style="float:left;"><div class="styLNDesc" style="width:102.2mm;height:18mm;padding-left:8mm;padding-top:0mm;">
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
						        Box 6, add $5,000 to the taxable disability income of the<br/>
							<span style="width:3mm;"/> spouse who was under age 65. Enter the total.<br/>
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
						        Box 2, 4, or 9, enter your taxable disability income.<br/>
							<img src="{$ImagePath}/1040SchR_Bullet_Round.gif" alt="Bullet Image"/>
						        Box 5, add your taxable disability income to your spouse&#39;s<br/>
							<span style="width:3mm;"/> taxable disability income. Enter the total.
						</div>
						<div class="styLNDesc" style="height:14mm;width:1mm;padding-top:0mm;">
							<img src="{$ImagePath}/1040SchR_Bracket_Lg.gif" alt="Bullet Image"/>
						</div>
						<div class="styLNDesc" style="height:14mm;width:45mm;padding-top:7mm;">
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">..........</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:12mm;width:5.7mm;padding-top:7.5mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
						<span style="height:4mm;font-size: 8.5pt;width:5.7mm;padding-bottom:0mm;         background-color: white;">11</span>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:7.5mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/TaxableDisabilityAmt"/>
							</xsl:call-template>
						</div></span> 
					   <span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:5mm;width:5.7mm;padding-top:0mm;         text-align:center;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:5mm;padding-top:0mm;border-left:1px solid black;         border-bottom-width:0px;border-right-width:0px;"/></span>
						<span style="float:left;"><div class="styLNDesc" style="width:148.5mm;height:2mm;">
							<img src="{$ImagePath}/1040SchR_Tip.gif" alt="Tip Image" align="middle"/>
							<span style="height:2mm;padding-bottom:1mm;padding-left:2mm;">For more details on what to 
								  include on line 11,  See <i> Figure Your Credit </i> in the instructions.</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:8mm;width:5.7mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:8mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Smaller of Filing Status Amount or Taxable -->
					<div class="styNBB" style="width:187mm;height:8mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:2mm;padding-left:0mm;padding-top:0mm;">12</div>
						<div class="styLNDesc" style="width:140.5mm;height:4mm;padding-top:0mm;">If you completed line 11,
								 enter the<b> smaller </b>of line 10 or line 11.<b> All others, </b>enter the<br/>amount from line 10
						<!--Dotted Line-->		 
							<span class="styDotLn" style="float:none;clear:none;padding-left:.5mm;">.........................</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:8mm;width:5.7mm;padding-top:3.5mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:4mm;font-size: 8.5pt;width:5mm;padding-bottom:0mm;         background-color: white;">12</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/SmallerOfFSOrTaxableAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<!-- Nontaxable Social Security and Railroad Benefits Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;padding-top:0mm;       padding-bottom:0mm;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:0mm;       padding-bottom:0mm;">13</div>
						<div class="styLNDesc" style="height:4mm;width:102.4mm;padding-top:0mm;       padding-bottom:0mm;">
								 Enter the following pensions, annuities, or disability income that<br/>you (and your spouse if filing jointly) received in 2015.							
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:7.3mm;width:5.9mm;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:7.3mm;         border-left-width:1px solid black;border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:7.3mm;width:5.7mm;         border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:7.3mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<div class="styNBB" style="width:187mm;font-size: 7.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftLtrBox" style="height:2mm;">a</div>
						<div class="styLNDesc" style="width:102.4mm;height:4mm;">
								 Nontaxable part of social security benefits and nontaxable part of <br/>railroad retirement benefits
								 treated as social security (see <br/>
								 <span style="float:left;">instructions)</span>
						<!--Dotted Line-->		 
								 <span class="styDotLn" style="float:right;padding-right:2mm;">...................</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:11.2mm;width:5.9mm;padding-top:7mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:4mm;font-size: 7.5pt;width:5.6mm;background-color: white;">13a</span>
						</div>
						<div class="styLNAmountBox" style="height:11.2mm;padding-top:7.8mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/NontxSocSecAndRlrdBenefitsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:11.2mm;width:5.7mm;         text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:11.2mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Nontaxable Other Amount -->
					<div class="styNBB" style="width:187mm;font-size: 7.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftLtrBox" style="height:7mm;">b</div>
						<div class="styLNDesc" style="width:102.4mm;height:11.3mm;">
								 Nontaxable veterans&#39; pensions and any other pension, annuity, or <br/>disability benefit 
								 that is excluded from income	under any other<br/>
								 <span style="float:left;">provision of law (see instructions)</span>
						<!--Dotted Line-->		 
							<span class="styDotLn" style="float:right;padding-right:2mm;">............</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:11.3mm;width:5.9mm;padding-top:7.1mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:4mm;font-size: 7.5pt;width:5.6mm;background-color:white;">13b</span>
						</div>
						<div class="styLNAmountBox" style="height:11.3mm;padding-top:7.9mm;padding-bottom:0mm;         border-left-width:1px solid black;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/NontaxableOtherAmt"/>
							</xsl:call-template>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:11.3mm;width:5.7mm;         padding-bottom:0mm;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;"/>
						<div class="styLNAmountBox" style="height:11.3mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Total Nontaxable Amount -->
					<div class="styNBB" style="width:187mm;font-size: 7.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftLtrBox" style="height:2mm;">c</div>
						<div class="styLNDesc" style="width:102.4mm;height:12mm;padding-bottom:0mm;">
								 Add lines 13a and 13b. (Even though these income items are not<br/>taxable, they
								 <span class="styBoldText"> must</span> be included here to figure your credit.)
								 If you<br/>did not receive any of the types of nontaxable income
								 listed on<br/>line 13a or 13b, enter -0- on line 13c
						<!--Dotted Line-->		 
							<span class="styDotLn" style="float:none;padding-left:2mm;">...........</span>		 
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:14.4mm;width:5.9mm;padding-top:10mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:4mm;font-size: 7.5pt;width:5.6mm;background-color: white;">13c</span>
						</div>
						<div class="styLNAmountBox" style="height:14.4mm;padding-bottom:0mm;padding-top:10.7mm;         border-left-width:1px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/TotalNontaxableAmt"/>
							</xsl:call-template>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:14.4mm;width:5.7mm;padding-top:8.9mm;         padding-bottom:1.5mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:14.4mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Tax Return AGI Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:0mm;">14</div>
						<div class="styLNDesc" style="width:64.3mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
								 Enter the amount from Form 1040A, <br/>line 22, or Form 1040, line 38
						<!--Dotted Line-->		 
							<span class="styDotLn" style="float:none;padding-left:2mm;">...</span>		 		 
						</div></span>
						<span style="float:right;"><div class="styLNRightNumBox" style="height:7.8mm;width:6mm;padding-top:3.7mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:1px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">14
						</div>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:3.7mm;padding-bottom:0mm;         border-left-width:0px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/TaxReturnAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:7.8mm;width:5.9mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:0mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:7.8mm;width:5.7mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:7.8mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Exemption Amount -->
					<div class="styNBB" style="width:187mm;font-size:8.5pt;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="padding-left:0mm;">15</div>
						<div class="styLNDesc" style="width:64.3mm;padding-right:15px;">
							<span style="float:left;"><b> If you checked (in Part l):</b></span>
							<span style="float:right;"><b>Enter:</b></span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:4.8mm;width:6mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:1px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="padding-top:0mm;padding-bottom:0mm;         border-left-width:0px;border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:4.8mm;width:5.9mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:4.8mm;padding-top:0mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:4.8mm;width:5.7mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:4.8mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<div class="styNBB" style="width:187mm;font-size:8.5pt;">
						<span style="float:left;"><div class="styLNDesc" style="width:69.6mm;height:auto;padding-left:8mm;padding-top:0mm;padding-right:5px;"><span style="float:left;">Box 1 or 2
							          <!--Dotted Line-->
											<span class="styDotLn" style="float:none;padding-left:2mm;">.......</span></span><span style="float:right;">$7,500</span>
									<span style="float:left;">
									 Box 3, 4, 5, 6, or 7
									 <!--Dotted Line-->
										<span class="styDotLn" style="float:none;padding-left:0mm;">....</span></span><span style="float:right;">$10,000</span>
									 <span style="float:left;">
									 Box 8 or 9
									 <!--Dotted Line-->
										<span class="styDotLn" style="float:none;padding-left:2mm;">.......</span></span><span style="float:right;">$5,000</span>
						</div>
						<div class="styLNDesc" style="height:4mm;width:3.7mm;padding-top:0mm;">
							<img src="{$ImagePath}/1040SchR_Bracket_Sm.gif" alt="Bullet Image"/>
						</div></span>	
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:0mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:0px;border-right-width:0px;float:right"/>
						<div class="styForm1040SchRColBoxGrey" style="height:7.5mm;width:5.7mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;float:right"/>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;float:right"/>
						<div class="styForm1040SchRColBoxGrey" style="height:7.5mm;width:5.9mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;float:right"/>
						<div class="styForm1040SchRColBoxGrey" style="height:7.5mm;width:6mm;padding-top:3.5mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:1px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:3.5mm;font-size:8.5pt;width:5.4mm;background-color: white;">15</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;padding-bottom:0mm;         border-left-width:0px;border-bottom-width:1px;border-right-width:0px;float:right">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/ExemptionAmt"/>
							</xsl:call-template>
						</div>
						<!-- Start -->
						<div class="styLNAmountBox" style="height:5.8mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;float:right;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:5.8mm;width:5.7mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;border-left-width:1px;         border-top-width:0px;border-bottom-width:0px;border-color:black;float:right;"/>
						
						<div class="styLNAmountBox" style="height:5.8mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;float:right;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:5.8mm;width:5.9mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;float:right;"/>
						
						<div class="styLNAmountBox" style="height:5.8mm;padding-top:0mm;padding-bottom:0mm;float:right;         border-left:0px solid black;border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:5.8mm;width:6mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:1px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;float:right;"/>
					</div>
					<!-- Adjusted Gross Income Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;padding-top:0mm;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:0mm;">16</div>
						<div class="styLNDesc" style="width:64.3mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
								 Subtract line 15 from line 14. If zero or<br/>less, enter -0-
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;padding-left:1mm;">.........</span>		 
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:8mm;width:6mm;padding-top:3.7mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:1px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:4mm;font-size:8.5pt;width:5.5mm;background-color: white;">16</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:3.7mm;padding-bottom:0mm;         border-left-width:0px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/AdjustedGrossIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:8mm;width:5.9mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:8mm;padding-top:0mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:0px;border-right-width:0px;"/>
						<div class="styForm1040SchRColBoxGrey" style="height:8mm;width:5.7mm;padding-top:0mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:8mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Half Adjusted Gross Income Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;padding-top:0mm;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:1mm;">17</div>
						<div class="styLNDesc" style="width:102.4mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">
								 Enter one-half of line 16
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;padding-left:1mm;">...............</span>		  
						</div></span>
						<span style="float:right;"><div class="styLNRightNumBox" style="height:5mm;width:5.9mm;padding-top:1mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">17
						</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/HalfAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styForm1040SchRColBoxGrey" style="height:5.2mm;width:5.7mm;padding-top:0mm;         padding-bottom:1.5mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:0px;         border-color:black;"/>
						<div class="styLNAmountBox" style="height:5.2mm;padding-top:0mm;padding-bottom:0mm;         border-left:1px solid black;border-bottom-width:0px;border-right-width:0px;"/></span>
					</div>
					<!-- Adjusted Credit Amount -->
					<div class="styNBB" style="width:187mm;height:8mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:3mm;">18</div>
						<div class="styLNDesc" style="width:140.5mm;height:4mm;padding-top:3mm;">Add lines 13c and 17
						<!--Dotted Line-->
								<span class="styDotLn" style="float:none;padding-left:2mm;">........................</span>		  
						</div></span>
						<span style="float:right;"><div class="styLNRightNumBox" style="height:8mm;width:5.7mm;padding-top:3mm;         padding-bottom:.5mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">18
						</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:3mm;padding-bottom:.5mm;         border-left-width:1px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/AdjustedCreditAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<!-- Net Credit Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:7mm;padding-left:0mm;padding-top:.5mm;">19</div>
						<div class="styLNDesc" style="width:140.5mm;height:7mm;padding-top:.5mm;">Subtract line 18 from line
					  12. If zero or less, <b> stop;</b> you <b>cannot</b> take the credit. Otherwise,<br/>go to line 20
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;padding-left:2mm;">...........................</span>		   
						</div></span>
						<span style="float:right;"><div class="styLNRightNumBox" style="height:7.5mm;width:5.7mm;padding-top:3mm;         padding-bottom:.5mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">19
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-top:3mm;padding-bottom:.5mm;         border-left-width:1px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/NetCreditAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<!-- Calculated Amount of Net Credit Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:.5mm;">20</div>
						<div class="styLNDesc" style="width:140.5mm;height:4mm;padding-top:.5mm;">
							<span style="float:left;clear:none;">
								Multiply line 19 by 15% (.15)
							</span>	
						<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;">......................</span>		   
						</div></span>
						<span style="float:right;"><div class="styLNRightNumBox" style="height:4.7mm;width:5.7mm;padding-top:.7mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">20
						</div>
						<div class="styLNAmountBox" style="height:4.7mm;padding-top:.7mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/CalculatedAmountOfNetCreditAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<!-- Total Tax Less Credits Amount -->
					<div class="styNBB" style="width:187mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="padding-left:0mm;">21</div>
						<div class="styLNDesc" style="width:140.5mm;">
							 Tax liability limit. Enter the amount from the Credit Limit Worksheet in the instructions
							 <span class="styDotLn" style="float:none;padding-left:.5mm;">.</span>
						</div></span>
						<span style="float:right;"><div class="styLNRightNumBox" style="height:4.7mm;width:5.7mm;         padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">21</div>
						<div class="styLNAmountBox" style="height:4.7mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:1px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/TotalTaxLessCreditsAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<!-- Credit for Elderly or Disabled Amount -->
					<div class="styBB" style="width:187mm;height:12mm;font-size: 8.5pt;float:left;clear:none;">
						<span style="float:left;"><div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;padding-top:0mm;padding-bottom:0mm;">22</div>
						<div class="styLNDesc" style="width:140.5mm;height:12mm;padding-top:0mm;padding-bottom:0mm;">
							<b>Credit for the elderly or the disabled.</b> Enter the<b> smaller </b>
							of line 20 or line 21. Also enter this amount on Form 1040A, line 32, or include on Form 1040, line 54 (check box <b>c</b> and enter "Sch R" on the line next to that box)
							<span class="styDotLn" style="float:none;padding-left:2mm;">.................</span>
						</div></span>
						<span style="float:right;"><div class="styForm1040SchRColBoxGrey" style="height:12mm;width:5.7mm;   padding-top:7.5mm;    padding-bottom:0mm;text-align:center;border-style:solid;border-right-width:0px;         border-left-width:1px;border-top-width:0px;border-bottom-width:1px;         border-color:black;">
							<span style="height:4mm;font-size: 8.5pt;width:5mm;background-color: white;padding-bottom:0mm; ">22</span>
						</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:7.3mm;padding-bottom:0mm;         border-left-width:1px;border-bottom-width:0px;border-right-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/CreditForElderlyOrDisabledAmt"/>
							</xsl:call-template>
						</div></span>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div style="width:187mm;padding-top:1mm">
						<span style="width:187mm;font-weight:bold;font-size: 7pt;text-align:right;">Schedule R (Form 1040A or 1040) 2015</span>
					</div>
					<br/>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="pageEnd" style="width:187mm;"/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II Line 2  -  Spouse Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd/@spouseNm"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II Line 2 - Person First Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleRData/PriorYearStatementInd/@personFirstNm"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>