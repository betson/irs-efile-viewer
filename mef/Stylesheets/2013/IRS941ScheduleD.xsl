<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS941ScheduleDStyle.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />  
	<xsl:param name="FormData" select="$RtnDoc/IRS941ScheduleD" />  
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
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 941 Schedule D" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS941ScheduleDStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form id="IRS941ScheduleD">
					<xsl:call-template name="DocumentHeader"/>
					<!-- header -->
					<div class="styTBB" style="width:187mm;height:16mm;border-bottom-width:0px;padding-bottom:0mm;float:none;clear:both;">
						<div class="styMainTitle" style="width:160mm;float:left;font-size:14pt;line-height:100%;">
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							Schedule D (Form 941):
							<div class="styFBT" style="font-size:10.5pt;">Report of Discrepancies Caused by Acquisitions, Statutory Mergers, or Consolidations</div>
							<div class="styAgency" style="font-weight:normal;font-size:6pt;">(Rev. June 2011)<span style="width:4mm;"/>Department of the Treasury — Internal Revenue Service</div>
						</div>
						<div class="styTYBox" style="width:26mm;height:100%;float:right;border-left-width:0px;">
							<div class="styOMB" style="border-bottom-width:0px;padding-top:12mm;text-align:right;font-size:6pt;padding-bottom:0mm;">OMB No. 1545-0029</div>
						</div>
					</div>
					
					<div style="width:187mm;padding-bottom:0mm;">
						<span style="width:187mm;">
							<div style="width:124mm;padding-top:0mm;">
								<span style="float:left;padding-top:2mm;font-size:6pt;"><b>Employer Identification Number (EIN)</b></span>
								<span class="styLNCtrNumBox" style="width:70mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:124mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;padding-right:5mm;font-size:6pt;"><b>Name</b><i> (not your trade name)</i></span>
								<span class="styLNCtrNumBox" style="width:87.5mm;border-top-width:1px;float:left;height:auto;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styBB" style="width:54mm;height:17mm;float:right;box-shadow: 5px 5px 5px #888;border-left-width:1px;
			border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:48mm;height:4mm;text-align:left;padding-left:1mm;font-size:7pt;padding-top:0.4mm;padding-bottom:0.4mm;">Tax Year of Discrepancies 
									<span style="font-weight:normal;">(Fill in)</span>
								</div>
								<div class="styBB" style="padding-top:3mm;width:48mm;border-bottom-width:0px;padding-bottom:0mm;padding-left:2mm;">
									<span class="styLNCtrNumBox" style="float:left;width:20mm;height:4mm;background-color:white;border-top-width:1px;padding-top:0mm;">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyTaxYr"/>
										</xsl:call-template>
									</span>
									<span style="width:20mm;padding-left:1mm;padding-top:0.5mm;">Format: YYYY</span>
								</div>
							</div>
							<div style="width:124mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;padding-right:5mm;font-size:6pt;"><b>Trade name</b><i> (if any)</i></span>
								<span class="styLNCtrNumBox" style="width:96.3mm;border-top-width:1px;float:left;height:auto;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2"/>
									</xsl:call-template>
								</span>
							</div>
						</span>
							<div style="width:124mm;padding-bottom:0mm;">
								<span style="width:19mm;float:left;padding-top:2mm;font-weight:bold;height:15mm;font-size:6pt;">Address</span>
									<span class="styLNCtrNumBox" style="width:105mm;height:7mm;float:right;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>&nbsp;
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:105mm;font-size:6pt;padding-left:1mm;padding-right:3mm;">
										<span style="float:left;">Number
										<span style="width:34mm"/>Street</span>
										<span style="float:right;">Suite or room number</span>
									</span>
									<xsl:choose>
										<xsl:when test="$RtnHdrData/Filer/USAddress">
											<span class="styLNCtrNumBox" style="width:64mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;padding-left:1mm;">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">City</xsl:with-param>
												</xsl:call-template>
											</span>
											<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
											<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:6mm;">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">State</xsl:with-param>
												</xsl:call-template>
											</span>
											<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
											<span class="styLNCtrNumBox" style="width:23mm;border-top-width:1px;padding-top:1mm;height:6mm;">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:124mm;font-size:6pt;padding-left:19mm;">
												<span style="width:66mm;padding-left:1mm;">City</span>
												<span style="width:12mm;text-align:center;">State</span>
												<span style="width:24mm;text-align:center;">ZIP code</span>
											</span>
										</xsl:when>
										<xsl:otherwise>
										<span class="styLNCtrNumBox" style="width:43.5mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:21mm;border-top-width:1px;padding-top:1mm;height:6mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:9mm;border-top-width:1px;padding-top:1mm;height:6mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
											</xsl:call-template>
										</span>
										<span class="styLNCtrNumBox" style="width:1.5mm;float:left;border:none"/>
										<span class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;padding-top:1mm;height:6mm;word-wrap:break-word;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
											</xsl:call-template>
										</span>
										<span style="width:107mm;font-size:6pt;">
											<span style="width:45mm;padding-left:1mm;">City</span>
											<span style="width:21mm;text-align:center;">Prov./St.</span>
											<span style="width:12mm;text-align:center;">Country</span>
											<span style="width:29mm;text-align:center;">Postal Code</span>
										</span>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div style="width:124mm;height:6mm;padding-bottom:0mm;padding-top:0mm;">
								<span style="width:19mm;float:left;padding-top:2mm;font-size:6pt;">Phone number</span>
								<span class="styLNCtrNumBox" style="width:58mm;height:6mm;border-top-width:1px;padding-top:1mm;float:left;">
									<xsl:if test="$FormData/PhoneNumber">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$FormData/PhoneNumber"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/ForeignPhoneNumber">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPhoneNumber"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
					</div>
				<div class="styBB" style="width:187mm;float:none;clear:both;font-size:8pt;padding-bottom:2mm;padding-top:0.5mm;border-bottom-width:0px;">
					<span style="font-weight:bold;font-size:9pt;line-height:200%;">About this schedule</span><br/>Each year the Internal Revenue Service (IRS) and the Social Security 	
					Administration (SSA) compare the totals on your Forms 941, <i>Employer’s QUARTERLY Federal Tax Return,</i> 
					with the totals on Forms W-2, <i>Wage and Tax Statement,</i> to verify that:
				</div>
				<div class="styBB" style="width:187mm;float:none;clear:both;font-size:8pt;padding-left:10mm;border-bottom-width:0px;">
					<li>The wages you reported on Forms 941 match those you reported on Forms W-2 (Copy A) so that your<br/>
					employees’ social security earnings records are complete for benefit purposes; and</li>
					<li>You have paid the appropriate taxes.</li>
				</div>
				<div class="styBB" style="width:187mm;float:none;clear:both;font-size:8pt;padding-bottom:1.5mm;padding-top:1mm;">
					Generally, the totals on your Forms W-2 (Copy A) should equal the totals you reported on Forms 941. Use this schedule if discrepancies
					exist between the totals you reported on those forms ONLY as a result of an acquisition, statutory merger, or consolidation. <b>In many cases,
					the information on this schedule should help the IRS resolve discrepancies without contacting you.</b> If you are an eligible employer
					who elects to use the alternate procedure set forth in Rev. Proc. 2004-53, explained in the instructions, you should file this schedule.<br/><br/><b>Read the separate
					instructions before you fill out this schedule.</b>
				</div>

				<!--Part 1-->
				<div class="styPartName" style="width:187mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;float:none;clear:both;">Part 1: Answer these background questions.</div>
				<div style="width:187mm;padding-left:0mm;padding-top:3mm;padding-bottom:0px;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">1.</div>
					<div class="styLNDesc" style="width:182mm;padding-left:1mm;font-weight:bold;"> Are you filing this schedule —<br/></div>
					<div style="width:182mm;padding-left:5mm;padding-top:0mm;">
						<div style="width:182mm;padding-top:0mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AfterMergerConsolGrp/AfterMergerConsolInd"/>
									<xsl:with-param name="BackupName">941SDAfterMergerConsolInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AfterMergerConsolGrp/AfterMergerConsolInd"/>
									<xsl:with-param name="BackupName">941SDAfterMergerConsolInd</xsl:with-param>
								</xsl:call-template>
								<b>After a statutory merger or consolidation? (See Rev. Rul. 62-60, 1962-1 C.B. 186 and Rev. Proc. 2004-53, 2004-2 C.B. 320.)</b><br/>
							</label>
							<span style="height:12mm;width:132mm;float:left;text-align:right;padding-top:3mm;">
								You are either:<br/><br/><br/>
								<span style="padding-right:60mm;">OR</span>
						    </span>
						    <span style="width:48mm;float:right;padding-top:3mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AfterMergerConsolGrp/AcquiredCorpInd"/>
										<xsl:with-param name="BackupName">941SDAcquiredCorpInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/AfterMergerConsolGrp/AcquiredCorpInd"/>
										<xsl:with-param name="BackupName">941SDAcquiredCorpInd</xsl:with-param>
									</xsl:call-template>
									An acquired corporation or<br/><br/>
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AfterMergerConsolGrp/SurvivingCorpInd"/>
										<xsl:with-param name="BackupName">941SDSurvivingCorpInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/AfterMergerConsolGrp/SurvivingCorpInd"/>
										<xsl:with-param name="BackupName">941SDSurvivingCorpInd</xsl:with-param>
									</xsl:call-template>
									A surviving corporation.
								</label>
						    </span>
						</div>
						<div style="width:182mm;padding-top:2mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AcquisitionAlternateProcGrp/AcquisitionAlternateProcInd"/>
									<xsl:with-param name="BackupName">941SDAcquisitionAlternateProcInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AcquisitionAlternateProcGrp/AcquisitionAlternateProcInd"/>
									<xsl:with-param name="BackupName">941SDAcquisitionAlternateProcInd</xsl:with-param>
								</xsl:call-template>
								<b><span style="width:1mm;"/>After an acquisition and you are using the alternate procedure under Rev. Proc. 2004-53, 2004-2 C.B. 320?</b><br/>
							</label>
							<span style="height:15mm;width:132mm;float:left;text-align:right;padding-top:3mm;">
								You are either:
						    </span>
						    <span style="width:48mm;float:right;padding-top:3mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AcquisitionAlternateProcGrp/PredecessorEmployerInd"/>
										<xsl:with-param name="BackupName">941SDPredecessorEmployerInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/AcquisitionAlternateProcGrp/PredecessorEmployerInd"/>
										<xsl:with-param name="BackupName">941SDPredecessorEmployerInd</xsl:with-param>
									</xsl:call-template>
									A predecessor or<br/><br/>
								</label>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AcquisitionAlternateProcGrp/SuccessorEmployerInd"/>
										<xsl:with-param name="BackupName">941SDSuccessorEmployerInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/AcquisitionAlternateProcGrp/SuccessorEmployerInd"/>
										<xsl:with-param name="BackupName">941SDSuccessorEmployerInd</xsl:with-param>
									</xsl:call-template>
									A successor.
								</label>
						    </span>
						</div>
					</div>
					<div style="width:187mm">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;padding-top:3mm;padding-bottom:0mm;">2.</div>
					<div class="styLNDesc" style="width:134mm;padding-left:1mm;font-weight:bold;padding-top:3mm;padding-bottom:0mm;">
						<span style="float:left;">The effective date of the statutory merger/consolidation or acquisition is </span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:2mm;">.......</span>
					</div>
					<div style="float:right;padding-right:5mm;">
						<div class="styLNCtrNumBox" style="width:43mm;border-top-width:1px;height:6mm;padding-top:1mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/ConsolidationAcquisitionDt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;padding-left:139mm;font-weight:bold;padding-right:5mm;padding-top:0mm;padding-bottom:0mm;">
							<span style="width:43mm;text-align:center;font-size:6pt;">
								MM<span style="width:10mm;text-align:center">/</span>DD<span style="width:10mm;text-align:center">/</span>YYYY
							</span>
					</div>
					</div>
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;clear:both;padding-top:0mm;">3.</div>
					<div class="styLNDesc" style="width:170mm;padding-left:1mm;font-weight:bold;padding-top:0mm;">
							The OTHER PARTY in this transaction is . . .
					</div>
					<div class="styBB" style="width:187mm;height:auto;border-bottom-width:0px;float:left;padding-left:5mm;padding-bottom:0px;">
						<div style="width:182mm;padding-top:2mm;">
							<span style="float:left;padding-top:2mm;width:28.5mm;">Other party’s EIN</span>
							<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:1mm;float:left;height:6mm;">
								<xsl:call-template name="PopulateEIN">
								  <xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/EIN"/>
								</xsl:call-template>
							</span>
						</div>
						<div style="width:182mm;">
							<span style="width:28mm;float:left;padding-top:8mm;">Other party’s name</span><br/>
								<span class="styLNCtrNumBox" style="width:151mm;border-top-width:1px;float:left;height:8mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/BusinessName/BusinessNameLine1"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/BusinessName/BusinessNameLine2"/>
									</xsl:call-template>
								</span>
						</div>
						<div style="width:182mm;">
							<span style="width:28mm;float:left;padding-top:8mm;">Trade name<i> (if any)</i></span><br/>
								<span class="styLNCtrNumBox" style="width:151mm;height:8mm;border-top-width:1px;float:left;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/TradeName/BusinessNameLine1"/>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/TradeName/BusinessNameLine2"/>
									</xsl:call-template>
								</span>
						</div>
						<div style="width:182mm;">
							<span style="width:28mm;height:15mm;float:left;padding-top:3.4mm;padding-right:5mm;">Address</span><br/>
								<span class="styLNCtrNumBox" style="width:151mm;height:6mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;">
									<xsl:if test="$FormData/OtherPartyGrp/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/USAddress/AddressLine1"/>
										</xsl:call-template>&nbsp;
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/USAddress/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/OtherPartyGrp/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignAddress/AddressLine1"/>
										</xsl:call-template>&nbsp;
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignAddress/AddressLine2"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="width:151mm;font-size:6pt;padding-left:0.5mm;">
									Number<span style="width:18mm"/>Street<span style="width:76mm;"/>Suite or room number
								</span>
								<xsl:choose>
									<xsl:when test="$FormData/OtherPartyGrp/USAddress">
										<span class="styLNCtrNumBox" style="width:151mm;border-top-width:1px;padding-top:1mm;height:6mm;">
											<span style="width:73mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/USAddress/City"/>
												</xsl:call-template>
											</span>
											<span style="width:31.6mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/USAddress/State"/>
												</xsl:call-template>
											</span>
											<span style="width:32mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/USAddress/ZIPCode"/>
												</xsl:call-template>
											</span>
										</span>
										<span style="width:151mm;font-size:6pt;padding-left:28mm;">
											City<span style="width:75mm"/>State<span style="width:26mm;"/>ZIP code
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span class="styLNCtrNumBox" style="width:151mm;border-top-width:1px;padding-top:1mm;height:6mm;word-wrap:break-word;">
											<span style="width:73mm;float:left;text-align:left;padding-left:0.4mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignAddress/City"/>
												</xsl:call-template>
											</span>
											<span style="width:30mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignAddress/ProvinceOrState"/>
												</xsl:call-template>
											</span>
											<span style="width:13mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignAddress/Country"/>
												</xsl:call-template>
											</span>
											<span style="width:30mm;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignAddress/PostalCode"/>
												</xsl:call-template>
											</span>
										</span>
										<span style="width:151mm;font-size:6pt;padding-left:28mm;">
											City<span style="width:51mm"/>Province/State<span style="width:14mm"/>Country<span style="width:16mm;"/>Postal Code
										</span>
									</xsl:otherwise>
								</xsl:choose>
						</div>
						<div style="width:182mm;padding-top:0mm;padding-bottom:0mm;float:left;">
							<span style="width:28mm; float:left;padding-top:1.4mm;">Phone number</span>
							<span class="styLNCtrNumBox" style="width:60mm;border-top-width:1px;float:left;height:5mm;">
								<xsl:if test="$FormData/OtherPartyGrp/PhoneNumber">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/PhoneNumber"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/OtherPartyGrp/ForeignPhoneNumber">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/ForeignPhoneNumber"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<div style="width:63mm;float:right;text-align:right;padding-top:1mm;padding-bottom:0px;">
								<img src="{$ImagePath}/941SchD_Next.gif" alt="Next Page Arrow Image"/>
							</div>
						</div>
					</div>
				</div>
				<!--End Part 1-->
		<!-- Page boundary -->
		<div class="pageEnd" style="width:187mm;border-top-width:1px;">
			<span style="float:left;clear:none;font-weight:bold;">For Paperwork Reduction Act Notice, see separate instructions.</span>
			<span style="float:left;clear:none;margin-left:20mm;">Cat. No. 38791Y</span>
			<span style="float:right;clear:none;"><b>Schedule D (Form 941)</b> (Rev. 6-2011)</span>
		</div>
		<p style="page-break-before: always"/>
		<!--Page 2 Header-->
		<div class="styBB" style="width:187mm;padding-bottom:6mm;">
			<div style="width:130mm;height:8mm;border-bottom-width:0px;float:left;">
				<span style="float:left;padding-top:2mm;padding-right:5mm;"><b>Your EIN</b></span>
				<span class="styLNCtrNumBox" style="float:left;width:72mm;height:6mm;border-top-width:1px;padding-top:1mm;">
					<xsl:call-template name="PopulateReturnHeaderFiler">
					  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
					</xsl:call-template>
				</span>
			</div>
			<div class="styBB" style="width:56mm;height:17mm;float:right;box-shadow: 5px 5px 5px #888;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
				<div class="styPartName" style="width:48mm;height:4mm;text-align:left;padding-left:1mm;font-size:7pt;padding-top:0.4mm;padding-bottom:0.4mm;">Tax Year of Discrepancies 
					<span style="font-weight:normal;">(Fill in)</span>
				</div>
				<div class="styBB" style="padding-top:3mm;width:48mm;border-bottom-width:0px;padding-bottom:0mm;padding-left:2mm;">
					<span class="styLNCtrNumBox" style="float:left;width:20mm;height:4mm;background-color:white;border-top-width:1px;padding-top:0mm;">
						<xsl:call-template name="PopulateYear">
						  <xsl:with-param name="TargetNode" select="$FormData/DiscrepancyTaxYr"/>
						</xsl:call-template>
					</span>
					<span style="width:20mm;padding-left:1mm;padding-top:0.5mm;">Format: YYYY</span>
				</div>
			</div>
			<div style="width:130mm;padding-top:2mm;">
				<span style="float:left;padding-top:4mm;padding-right:5mm;"><b>Name</b><i> (not your trade name)</i></span>
				<span class="styLNCtrNumBox" style="width:85mm;height:auto;border-top-width:1px;text-align:left;padding-left:1mm;">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
					</xsl:call-template>
				</span>
			</div>
				
			<div style="width:130mm;padding-top:2mm;">
				<span style="float:left;padding-top:2mm;padding-right:5mm;">Other party’s EIN</span>
				<span class="styLNCtrNumBox" style="float:left;width:72mm;height:6mm;border-top-width:1px;padding-top:1mm;">
					<xsl:call-template name="PopulateEIN">
					  <xsl:with-param name="TargetNode" select="$FormData/OtherPartyGrp/EIN"/>
					</xsl:call-template>
				</span>
			</div>
		</div>
		<!--End Page 2 Header-->
		<!--Part 2-->
		<div style="width:187mm;float:left">
			<div class="styPartName" style="width:187mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">Part 2: Tell us about the discrepancies with your returns.</div>
			<div style="width:187mm;float:left">
				<span style="width:45mm;"/>
				<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column A</i></div>
				<span style="width:4mm;"/>
				<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column B</i></div>
				<span style="width:4mm;"/>
				<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column C</i></div>
			</div>
			<div style="width:187mm;float:left">
				<span style="width:45mm;"/>
				<div style="width:43mm;padding-top:2mm;padding-bottom:8mm;"><b>Amount you reported to IRS for the tax year</b><br/><br/>Totals from Forms 941 as corrected by any
				Forms 941-X</div>
				<div style="width:4mm;font-weight:bold;text-align:center;padding-top:2mm;padding-bottom:20mm;">-</div>
				<div style="width:43mm;padding-top:2mm;padding-bottom:5mm;"><b>Amount you reported to SSA for the tax year</b><br/><br/>Totals from Forms W-2 (Copy A) as corrected by any
				Forms W-2c (Copy A)</div>
				<div style="width:4mm;font-weight:bold;text-align:center;padding-top:2mm;padding-bottom:20mm;">=</div>
				<div style="width:43mm;padding-top:2mm;padding-bottom:20mm;"><b>The difference</b></div>
			</div>	
			<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
				<div style="width:44mm;float:left;border:solid black;border-width:1px 0px 0px 0px;padding-top:1mm;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">4.</div>
					<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
						Social security wages
					</div>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/SSWagesGrp[1]/SSWagesRptIRSAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					-
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/SSWagesGrp[1]/SSWagesRptSSAAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					=
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/SSWagesGrp[1]/SSWagesDiffAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
			<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
				<div style="width:44mm;float:left;padding-top:1mm;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">5.</div>
					<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
						Medicare wages and tips
					</div>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/MdcrWagesGrp[1]/MdcrWagesRptIRSAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					-
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/MdcrWagesGrp[1]/MdcrWagesRptSSAAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					=
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/MdcrWagesGrp[1]/MdcrWagesDiffAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
			<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
				<div style="width:44mm;float:left;padding-top:1mm;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">6.</div>
					<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
						Social security tips
					</div>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/SSTipsGrp[1]/SSTipsRptIRSAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					-
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/SSTipsGrp[1]/SSTipsRptSSAAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					=
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/SSTipsGrp[1]/SSTipsDiffAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
			<div style="width:187mm;float:none;clear:both;padding-bottom:0.11mm;">
				<div style="width:44mm;float:left;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">7.</div>
					<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
						Federal income tax<br/>withheld
					</div>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/FedIncmTaxWthldGrp[1]/FedIncmTaxWthldRptIRSAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					-
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/FedIncmTaxWthldGrp[1]/FedIncmTaxWthldRptSSAAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					=
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/FedIncmTaxWthldGrp[1]/FedIncmTaxWthldDiffAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
			<div style="width:187mm;float:none;clear:both;">
				<div style="width:44mm;float:left;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">8.</div>
					<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;font-size:6pt;">
						Advance earned income credit (EIC) payments (for tax years ending before January 1, 2011)
					</div>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/AdvanceEICPymtGrp[1]/AdvanceEICPymtRptIRSAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					-
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/AdvanceEICPymtGrp[1]/AdvanceEICPymtRptSSAAmt"/>
					</xsl:call-template>
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
					=
				</div>
				<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/DiscrepancyAmtGrp/AdvanceEICPymtGrp[1]/AdvanceEICPymtDiffAmt"/>
					</xsl:call-template>
				</div>
			</div>
			
			<div style="width:187mm;float:none;clear:both;padding-bottom:4mm;padding-top:4mm;">
				<div class="styLNDesc" style="width:187mm;padding-left:2mm;">
					If you are filing for one transaction only, STOP here. If you are filing for more than one transaction, go to Part 3.
				</div>
			</div>
		</div>
		<!--End Part 2-->
			
		<!--Part 3-->
<xsl:choose>
	<xsl:when test="count($FormData/TrDiscrepancyAmtGrp) &gt; 0">
		<xsl:for-each select="$FormData/TrDiscrepancyAmtGrp">
			<div style="width:187mm;">
				<div class="styPartName" style="width:187mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">
					Part 3: Fill this part out ONLY if you are filing more than one Schedule D (Form 941) for any calendar year.
				</div>
				<div style="width:187mm;padding-bottom:4mm;">
					<div style="width:187mm;float:none;clear:both;padding-top:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;padding-top:1mm;">9.</div>
						<div class="styLNDesc" style="width:auto;padding-left:1mm;padding-right:1mm;font-weight:bold;padding-top:1mm;">
							File one Schedule D (Form 941) for each separate transaction. This is schedule
						</div>
						<div class="styLNCtrNumBox" style="width:16.5mm;border-top-width:1px;padding-right:0.2mm;text-align:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SchedDF941Num"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:5mm;padding-left:1mm;font-weight:bold;padding-top:1mm;">
							of
						</div>
						<div class="styLNCtrNumBox" style="width:16.5mm;border-top-width:1px;padding-right:0.2mm;text-align:right;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SchedDF941Cnt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:auto;padding-top:1mm;font-family:Arial Narrow;">
							<b>.</b> (Example: <i>This is schedule 1 of 3.</i>)
						</div>
					</div>
				<div style="width:187mm;float:left">
					<div style="width:45mm;"/>
					<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column A</i></div>
					<div style="width:4mm;"/>
					<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column B</i></div>
					<div style="width:4mm;"/>
					<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column C</i></div>
				</div>
				<div style="width:187mm;float:left">
					<div style="width:45mm;"/>
					<div style="width:43mm;padding-top:2mm;padding-bottom:8mm;"><b>Amount you reported to IRS for the tax year for the employees affected by the transaction reported on
					 this Schedule D (Form 941)</b><br/><br/>Totals from Forms 941 as corrected by any Forms 941-X</div>
					<div style="width:4mm;font-weight:bold;padding-top:2mm;text-align:center;padding-bottom:29mm;">-</div>
					<div style="width:43mm;padding-top:2mm;padding-bottom:5mm;"><b>Amount you reported to SSA for the tax year for the employees affected by the transaction reported
					 on this Schedule D (Form 941)</b><br/><br/>Totals from Forms W-2 (Copy A) as corrected by any Forms W-2c (Copy A)</div>
					<div style="width:4mm;font-weight:bold;padding-top:2mm;text-align:center;padding-bottom:29mm;">=</div>
					<div style="width:43mm;padding-top:2mm;padding-bottom:29mm;"><b>The difference</b></div>
				</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">10.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
								Social security wages
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SSWagesGrp/SSWagesRptIRSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SSWagesGrp/SSWagesRptSSAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SSWagesGrp/SSWagesDiffAmt"/>
							</xsl:call-template>
						</div>
					</div>
			
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">11.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
								Medicare wages and tips
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MdcrWagesGrp/MdcrWagesRptIRSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MdcrWagesGrp/MdcrWagesRptSSAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="MdcrWagesGrp/MdcrWagesDiffAmt"/>
							</xsl:call-template>
						</div>
					</div>
			
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">12.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
								Social security tips
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SSTipsGrp/SSTipsRptIRSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SSTipsGrp/SSTipsRptSSAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="SSTipsGrp/SSTipsDiffAmt"/>
							</xsl:call-template>
						</div>
					</div>
			
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">13.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;padding-bottom:0mm;">
								Federal income tax withheld
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="FedIncmTaxWthldGrp/FedIncmTaxWthldRptIRSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="FedIncmTaxWthldGrp/FedIncmTaxWthldRptSSAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="FedIncmTaxWthldGrp/FedIncmTaxWthldDiffAmt"/>
							</xsl:call-template>
						</div>
					</div>
			
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:44mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">14.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;font-size:6pt;">
								Advance earned income credit (EIC) payments (for tax years ending before January 1, 2011)
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AdvanceEICPymtGrp/AdvanceEICPymtRptIRSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AdvanceEICPymtGrp/AdvanceEICPymtRptSSAAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;padding-top:1mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;padding-top:1mm;border-top-width:1px;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AdvanceEICPymtGrp/AdvanceEICPymtDiffAmt"/>
							</xsl:call-template>
						</div>
					</div>
				</div>
			</div>
			<xsl:choose>
				<xsl:when test="position() mod 2 != 0">
					<xsl:if test="position() &lt; count($FormData/TrDiscrepancyAmtGrp)">
							<!--Insert Page Breaks To Prevent Splitting-->
							<div style="width:187mm;page-break-after:always;height:3mm;"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<div style="width:187mm;height:3mm;"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:when>

			<xsl:otherwise>
				<div class="styPartName" style="width:187mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">Part 3: Fill this part out ONLY if you are filing more than one Schedule D (Form 941) for any calendar year.</div>
				<div style="width:187mm;padding-bottom:4mm;">
					<div style="width:187mm;float:none;clear:both;padding-top:5mm;padding-bottom:3mm;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;width:4mm;">9.</div>
						<div class="styLNDesc" style="width:auto;padding-left:1mm;padding-right:1mm;font-weight:bold;padding-top:1mm;">
							File one Schedule D (Form 941) for each separate transaction. This is schedule
						</div>
						<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;"/>
						<div class="styLNDesc" style="width:5mm;padding-left:1mm;font-weight:bold;padding-top:1mm;">
							of
						</div>
						<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;"/>
						<div class="styLNDesc" style="width:auto;padding-top:1mm;">
							<b>.</b> (Example: <i>This is schedule 1 of 3.</i>)
						</div>
					</div>
				<div style="width:187mm;float:left">
					<div style="width:45mm;"/>
					<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column A</i></div>
					<div style="width:4mm;"></div>
					<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column B</i></div>
					<div style="width:4mm;"></div>
					<div style="width:43mm;text-align:center;border:solid black;border-width:0px 0px 1px 0px;padding-top:2mm;"><i>Column C</i></div>
				</div>
				<div style="width:187mm;float:left">
					<div style="width:45mm;"/>
					<div style="width:43mm;padding-top:2mm;padding-bottom:8mm;"><b>Amount you reported to IRS for the tax year for the employees affected by the transaction reported on
					 this Schedule D (Form 941)</b><br/><br/>Totals from Forms 941 as corrected by any Forms 941-X</div>
					<div style="width:4mm;font-weight:bold;padding-top:2mm;text-align:center;padding-bottom:29mm;">-</div>
					<div style="width:43mm;padding-top:2mm;padding-bottom:5mm;"><b>Amount you reported to SSA for the tax year for the employees affected by the transaction reported
					 on this Schedule D (Form 941)</b><br/><br/>Totals from Forms W-2 (Copy A) as corrected by any Forms W-2c (Copy A)</div>
					<div style="width:4mm;font-weight:bold;padding-top:2mm;text-align:center;padding-bottom:29mm;">=</div>
					<div style="width:43mm;padding-top:2mm;padding-bottom:29mm;"><b>The difference</b></div>
				</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">10.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
								Social security wages
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
					</div>
			
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">11.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
								Medicare wages and tips
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
					</div>
			
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;padding-top:1mm;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">12.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;">
								Social security tips
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
					</div>
			
					<div style="width:187mm;float:none;clear:both;padding-bottom:0.9mm;">
						<div style="width:44mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">13.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;padding-bottom:0mm;">
								Federal income tax withheld
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
					</div>
			
					<div style="width:187mm;float:none;clear:both;">
						<div style="width:44mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:0mm;width:4mm;">14.</div>
							<div class="styLNDesc" style="width:39mm;padding-left:1mm;font-weight:bold;font-size:6pt;">
								Advance earned income credit (EIC) payments (for tax years ending before January 1, 2011)
							</div>
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							-
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:4mm;border-top-width:1px;">
							=
						</div>
						<div class="styLNCtrNumBox" style="height:6.3mm;width:45mm;border-top-width:1px;"/>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		<!--End Part 3-->
						
		<!-- Page boundary -->
		<div class="pageEnd" style="width:187mm;border:1px solid black;border-right-width:0px;border-bottom-width:0px;border-left-width:0px;">
			<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span></span>
			<span style="float:right;clear:none;"><b>Schedule D (Form 941)</b> (Rev. 6-2011)</span>
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
				<xsl:with-param name="TargetNode" select="$FormData"/>
				<xsl:with-param name="DescWidth" select="100"/>
			</xsl:call-template>
		</table>
	</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
