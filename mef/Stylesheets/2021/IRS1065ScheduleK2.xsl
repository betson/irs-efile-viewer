<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1065ScheduleK2Style.xsl" />
	<xsl:include href="ScheduleK2K3Common.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1065ScheduleK2" />
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
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
				<meta name="Description" content="IRS Schedule K2 Form 1065" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1065ScheduleK2Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1065ScheduleK2" style="width:256mm;">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE K-2<br />(Form 1065)</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Partners' Distributive Share Items &mdash; International
							</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 1065.
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form1065</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;">OMB No. 1545-0123</div>
							<div class="styTY" style="margin-top:1mm;">20<span class="styTYColor">21</span></div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number (EIN)</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Line A -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">A</div>
						<div class="styLNDesc" style="width:122mm;border-right:1px solid black;height:10mm;">
							Is the partnership a withholding foreign partnership? <br />
							<input type="checkbox" class="styCkbox" style="margin-left:0px;" alt="Withholding Foreign Partnership Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrgnPartnershipInd"/>
									<xsl:with-param name="BackupName">F1065SK2WithholdingFrgnPartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong><label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrgnPartnershipInd"/>
									<xsl:with-param name="BackupName">F1065SK2WithholdingFrgnPartnershipInd</xsl:with-param>
								</xsl:call-template>Yes</label>
							</strong>
							<input type="checkbox" class="styCkbox" style="margin-left:20px;" alt="Withholding Foreign Partnership No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrgnPartnershipInd"/>
									<xsl:with-param name="BackupName">F1065SK2WithholdingFrgnPartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong><label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrgnPartnershipInd"/>
									<xsl:with-param name="BackupName">F1065SK2WithholdingFrgnPartnershipInd</xsl:with-param>
								</xsl:call-template>No</label>
							</strong>
							<span style="width:8mm;"/>
							If "Yes," enter your WP-EIN &#9654; 
							<span style="width:30mm;height:3.5mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingPartnershipEIN"/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line B -->
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">B</div>
						<div class="styLNDesc" style="width:122mm;height:10mm;">
							Is the partnership (including the home office or any branch) a qualified derivatives dealer?<br />
							<input type="checkbox" class="styCkbox" style="margin-left:0px;" alt="Qualified Derivatives Dealer Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativesDealerInd"/>
									<xsl:with-param name="BackupName">F1065SK2QualifiedDerivativesDealerInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong><label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrgnPartnershipInd"/>
									<xsl:with-param name="BackupName">F1065SK2WithholdingFrgnPartnershipInd</xsl:with-param>
								</xsl:call-template>Yes</label>
							</strong>
							<input type="checkbox" class="styCkbox" style="margin-left:20px;" alt="Withholding Foreign Partnership No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativesDealerInd"/>
									<xsl:with-param name="BackupName">F1065SK2QualifiedDerivativesDealerInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<strong><label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativesDealerInd"/>
									<xsl:with-param name="BackupName">F1065SK2QualifiedDerivativesDealerInd</xsl:with-param>
								</xsl:call-template>No</label>
							</strong>
							<span style="width:8mm;"/>
							If "Yes," enter your QI-EIN &#9654; 
							<span style="width:30mm;height:3.5mm;border-bottom:1px solid black;text-align:center;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedIntermediaryEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line C -->
					<div class="styStdDivLS" style="">
						<div class="styGenericDiv" style="width:128mm;">
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">C</div>
								<div class="styLNDesc" style="width:98mm;">
									Check to indicate the parts of Schedule K-2 that apply.
								</div>
								<div class="styLNRightNumBox" style="margin-top:6px;border-left:none;">&nbsp;</div>
								<div class="styLNRightNumBox" style="margin-top:6px;border-top-width:1px;">Yes</div>
								<div class="styLNRightNumBox" style="margin-top:6px;border-top-width:1px;border-right-width:1px;">No</div>
							</div>
							<!-- C1 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">1</div>
								<div class="styLNDesc" style="width:92mm;">
									Does Part I apply? If "Yes," complete and attach Part I
									<span class="sty1065K2DotLn">.....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 1 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 1 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C2 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">2</div>
								<div class="styLNDesc" style="width:92mm;">
									Does Part II apply? If "Yes," complete and attach Part II
									<span class="sty1065K2DotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 2 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 2 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C3 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">3</div>
								<div class="styLNDesc" style="width:92mm;">
									Does Part III apply? If "Yes," complete and attach Part III
									<span class="sty1065K2DotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 3 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 3 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C4 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">4</div>
								<div class="styLNDesc" style="width:92mm;">
									Does Part IV apply? If "Yes," complete and attach Part IV
									<span class="sty1065K2DotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 4 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIVAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIVAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 4 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIVAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIVAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C5 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">5</div>
								<div class="styLNDesc" style="width:92mm;">
									Does Part V apply? If "Yes," complete and attach Part V
									<span class="sty1065K2DotLn">.....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 5 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 5 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C6 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">6</div>
								<div class="styLNDesc" style="width:92mm;">
									Does Part VI apply? If "Yes," complete and attach Part VI
									<span class="sty1065K2DotLn">....</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;">6</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 6 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 6 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
						</div>
						<div class="styGenericDiv" style="width:128mm;">
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNDesc" style="width:95mm;">&nbsp;</div>
								<div class="styLNRightNumBox" style="margin-top:6px;border-left:none;">&nbsp;</div>
								<div class="styLNRightNumBox" style="margin-top:6px;border-top-width:1px;">Yes</div>
								<div class="styLNRightNumBox" style="margin-top:6px;border-top-width:1px;border-right-width:1px;">No</div>
							</div>
							<!-- C7 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">7</div>
								<div class="styLNDesc" style="width:89mm;">
									Does Part VII apply? If "Yes," complete and attach Part VII
									<span class="sty1065K2DotLn">...</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 7 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 7 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C8 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">8</div>
								<div class="styLNDesc" style="width:89mm;">
									Does Part VIII apply? If "Yes," complete and attach Part VIII
									<span class="sty1065K2DotLn">..</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 8 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVIIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVIIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 8 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartVIIIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartVIIIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C9 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">9</div>
								<div class="styLNDesc" style="width:89mm;">
									Does Part IX apply? If "Yes," complete and attach Part IX
									<span class="sty1065K2DotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 9 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIXAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIXAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 9 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartIXAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartIXAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C10 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:0.4mm;">10</div>
								<div class="styLNDesc" style="width:89mm;">
									Does Part X apply? If "Yes," complete and attach Part X
									<span class="sty1065K2DotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 10 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartXAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartXAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 10 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartXAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartXAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C11 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:0.4mm;">11</div>
								<div class="styLNDesc" style="width:89mm;">
									Does Part XI apply? If "Yes," complete and attach Part XI
									<span class="sty1065K2DotLn">...</span>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">11</div>
								<div class="styLNRightNumBox" style="height:4.5mm;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 11 Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartXIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartXIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
									<input type="checkbox" class="styCkboxNM" style="" alt="Part 11 No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PartXIAttachedInd"/>
											<xsl:with-param name="BackupName">F1065SK2PartXIAttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
							</div>
							<!-- C12 -->
							<div class="styGenericDiv" style="width:128mm;">
								<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:0.4mm;">12</div>
								<div class="styLNDesc" style="width:89mm;">
									Reserved for future use
									<span class="sty1065K2DotLn">..............</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;">12</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;background-color:lightgrey;">&nbsp;</div>
								<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:1px;background-color:lightgrey;">&nbsp;</div>
							</div>
						</div>
					</div>
					<!--Part 1 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Partnership's Other Current Year International Information
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:255mm;">Check box(es) for additional specified attachments. See instructions.</div>
					</div>
					<div class="styStdDivLS">
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Gain On Personal Property Sale Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/GainOnPersonalPropertySaleInd"/>
									<xsl:with-param name="BackupName">F1065SK2GainOnPersonalPropertySaleInd</xsl:with-param>
								</xsl:call-template>
							</input>
							1. Gain on personal property sale
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/GainOnPersonalPropertySaleInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Foreign Oil And Gas Taxes Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasTaxesInd"/>
									<xsl:with-param name="BackupName">F1065SK2ForeignOilAndGasTaxesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							2. Foreign oil and gas taxes
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasTaxesInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Splitter Arrangements Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SplitterArrangementsInd"/>
									<xsl:with-param name="BackupName">F1065SK2SplitterArrangementsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							3. Splitter arrangements
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SplitterArrangementsInd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Foreign Tax Translation Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxTranslationInd"/>
									<xsl:with-param name="BackupName">F1065SK2ForeignTaxTranslationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							4. Foreign tax translation
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxTranslationInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="High Taxed Income Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HighTaxedIncomeInd"/>
									<xsl:with-param name="BackupName">F1065SK2HighTaxedIncomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							5. High-taxed income
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HighTaxedIncomeInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Sect 267A Disallowed Deduction Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Sect267ADisallowedDedInd"/>
									<xsl:with-param name="BackupName">F1065SKSect267ADisallowedDedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							6. Section 267A disallowed deduction
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Sect267ADisallowedDedInd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Form 8858 Attachment Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8858AttachmentInd"/>
									<xsl:with-param name="BackupName">F1065SK2Form8858AttachmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							7. Form 8858 information
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8858AttachmentInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Form 5471 Attachment Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form5471AttachmentInd"/>
									<xsl:with-param name="BackupName">F1065SK2Form5471AttachmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							8. Form 5471 information
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form5471AttachmentInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Other Forms Attachment Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherFormsAttachmentInd"/>
									<xsl:with-param name="BackupName">F1065SKOtherFormsAttachmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							9. Other forms
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherFormsAttachmentInd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Partner Loan Transactions Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartnerLoanTransactionsInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartnerLoanTransactionsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							10. Partner loan transactions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerLoanTransactionsInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Dual Consolidated Loss Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DualConsolidatedLossInd"/>
									<xsl:with-param name="BackupName">F1065SK2DualConsolidatedLossInd</xsl:with-param>
								</xsl:call-template>
							</input>
							11. Dual consolidated loss
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DualConsolidatedLossInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Other International Items Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInternationalItemsInd"/>
									<xsl:with-param name="BackupName">F1065SKOtherInternationalItemsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							12. Other intrnational items <br /> <span style="width:5mm;"/>(attach description and statement)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherInternationalItemsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Part 2 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; Gross Income</div>
					</div>
					<xsl:variable name="sep2-1" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SalesGrossIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-2" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GrossIncmPerfOfSrvcGrp) &gt; 3)"/>
					<xsl:variable name="sep2-3" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GroRntlRealEstateIncmGrp) &gt; 3)"/>
					<xsl:variable name="sep2-4" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/OthGrossRentalIncomeGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:auto;" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">1</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Sales
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SalesGrossIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-1"/>
								</xsl:call-template>
								<!-- Line 2 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">2</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;font-family:Arial;">
										Gross income from performance of services
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GrossIncmPerfOfSrvcGrp"/>
									<xsl:with-param name="Sep" select="$sep2-2"/>
								</xsl:call-template>
								<!-- Line 3 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">3</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Gross rental real estate income
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GroRntlRealEstateIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep2-3"/>
								</xsl:call-template>
								<!-- Line 4 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">4</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Other gross rental income
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/OthGrossRentalIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-4"/>
								</xsl:call-template>
								
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						For Paperwork Reduction Act Notice, see the Instructions for Form 1065. 
						<span style="margin-left:40mm;font-weight:normal;">Cat. No. 73927C</span>
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; Gross Income <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<xsl:variable name="sep2-6" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3InterestIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-7" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3OrdinaryDividendsGrp) &gt; 3)"/>
					<xsl:variable name="sep2-8" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/QualifiedDividendsGrp) &gt; 3)"/>
					<xsl:variable name="sep2-10" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/RoyaltiesLicenseFeesGrp) &gt; 3)"/>
					<xsl:variable name="sep2-11" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/NetShortTermCapGainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-12" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/NetLongTermCapGainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-13" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/CollectiblesGainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-14" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3UnrcptrSect1250GainGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page2Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:auto;" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 5 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">5</td>
									<td class="styTableCellTextInherit" style="">
										Guaranteed payments
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GuaranteedPaymentsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">6</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Interest Income
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3InterestIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-6"/>
								</xsl:call-template>
								<!-- Line 7 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">7</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Ordinary dividends (exclude amount on line 8)
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3OrdinaryDividendsGrp"/>
									<xsl:with-param name="Sep" select="$sep2-7"/>
								</xsl:call-template>
								<!-- Line 8 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">8</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Qualified dividends
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/QualifiedDividendsGrp"/>
									<xsl:with-param name="Sep" select="$sep2-8"/>
								</xsl:call-template>
								<!-- Line 9 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">9</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 10 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">10</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Royalties and license fees
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/RoyaltiesLicenseFeesGrp"/>
									<xsl:with-param name="Sep" select="$sep2-10"/>
								</xsl:call-template>
								<!-- Line 11 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">11</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Net short-term capital gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/NetShortTermCapGainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-11"/>
								</xsl:call-template>
								<!-- Line 12 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">12</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Net long-term capital gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/NetLongTermCapGainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-12"/>
								</xsl:call-template>
								<!-- Line 13 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">13</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Collectibles (28%) gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/CollectiblesGainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-13"/>
								</xsl:call-template>
								<!-- Line 14 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">14</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Unrecaptured section 1250 gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3UnrcptrSect1250GainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-14"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; Gross Income <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<xsl:variable name="sep2-15" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3NetSection1231GainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-19" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/Section951aInclusionsGrp) &gt; 3)"/>
					<xsl:variable name="sep2-20" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3OtherIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-24" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotGrossIncomeByCountryGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page3Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:auto;" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 15 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">15</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Net section 1231 gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3NetSection1231GainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-15"/>
								</xsl:call-template>
								<!-- Line 16 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">16</td>
									<td class="styTableCellTextInherit" style="">
										Section 986(c) gain
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/Section986cGainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 17 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">17</td>
									<td class="styTableCellTextInherit" style="">
										Section 987 gain
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/Section987GainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 18 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">18</td>
									<td class="styTableCellTextInherit" style="">
										Section 988 gain
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/Section988GainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 19 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">19</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Section 951(a) inclusions
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/Section951aInclusionsGrp"/>
									<xsl:with-param name="Sep" select="$sep2-19"/>
								</xsl:call-template>
								<!-- Line 20 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">20</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Other income (see instructions)
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3OtherIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-20"/>
								</xsl:call-template>
								<!-- Line 21 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;">21</td>
									<td class="styTableCellTextInherit" style="background-color:white;border-bottom-width:0px;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">A</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">B</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">C</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 22 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;">22</td>
									<td class="styTableCellTextInherit" style="background-color:white;border-bottom-width:0px;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">A</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">B</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">C</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 23 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;">23</td>
									<td class="styTableCellTextInherit" style="background-color:white;border-bottom-width:0px;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">A</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">B</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">C</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 24 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">24</td>
									<td class="styTableCellTextInherit" style="">
										<strong>Total gross income </strong> (combine lines 1 through 23)
										<span class="sty1065K2DotLn" style="margin-right:-4px;">........&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotUSSourceIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotForeignBranchIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotalPassiveIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotalGeneralCategoryIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:for-each select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotalSeparateCategoryGrp">
											<span style="float:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<xsl:if test="position() != last()"><br /></xsl:if>
										</xsl:for-each>
										<xsl:if test="count($FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotalSeparateCategoryGrp) = 0">&nbsp;</xsl:if>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotIncmSourcedAtPartnerLvlAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotalGrossIncomeAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotGrossIncomeByCountryGrp"/>
									<xsl:with-param name="Sep" select="$sep2-24"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 2 &mdash; Deductions</div>
					</div>
					<xsl:variable name="sep2-32" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page4Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 25 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">25</td>
									<td class="styTableCellTextInherit" style="">
										Expenses allocable to sales income
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ExpnsAllcblToSalesIncmGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 26 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">26</td>
									<td class="styTableCellTextInherit" style="">
										Expenses allocable to gross income from performances of services
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ExpnssAllcblGroIncmPerfSrvcGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 27 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">27</td>
									<td class="styTableCellTextInherit" style="">
										Net short-term capital loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetShortTermCapLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 28 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">28</td>
									<td class="styTableCellTextInherit" style="">
										Net long-term capital loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetLongTermCapLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 29 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">29</td>
									<td class="styTableCellTextInherit" style="">
										Collectibles loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/CollectablesLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 30 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">30</td>
									<td class="styTableCellTextInherit" style="">
										Net section 1231 loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetSection1231LossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 31 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">31</td>
									<td class="styTableCellTextInherit" style="">
										Other losses
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OtherLossesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 32 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">32</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Research &amp; experimental (R&amp;E) expenses
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:if test="not($sep2-32)">
									<xsl:for-each select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit" style="">
												SIC code 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep2-32 or (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
										<td class="styTableCellTextInherit" style="">
											SIC code
											<xsl:if test="$sep2-32">See Add'l Data</xsl:if>&nbsp;
										</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2-32 or (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2-32 or (count($FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp) &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<!-- Line 33 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">33</td>
									<td class="styTableCellTextInherit" style="">
										Allocable rental expenses &mdash; <br /> depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/AllocableRentalExpensesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 34 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">34</td>
									<td class="styTableCellTextInherit" style="">
										Allocable rental expenses &mdash; other than <br /> depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthAllocableRentalExpensesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 35 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">35</td>
									<td class="styTableCellTextInherit" style="font-family:Arial;">
										Allocable royalty and licensing expenses &mdash; depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/AllcblRyltyLicensingExpnsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 36 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">36</td>
									<td class="styTableCellTextInherit" style="font-family:Arial;">
										Allocable royalty and licensing expenses &mdash; other than depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthAllcblRyltyLcnsExpnsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 37 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">37</td>
									<td class="styTableCellTextInherit" style="">
										Depreciation not included on line 33 or 35
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthAllocableDepreciationGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 38 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">38</td>
									<td class="styTableCellTextInherit" style="">
										Charitable contributions
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/SchK2K3CharitableContriGrp/USSourceIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/SchK2K3CharitableContriGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 39 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">39</td>
									<td class="styTableCellTextInherit" style="">
										Interest epxense specifically allocable under Regulations section 1.861-10(e)
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/IntExpnsUnderSect186110eGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 40 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">40</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense specifically allocable under Regulations <br /> section 1.861-10T
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthIntExpnsUnderSect186110TGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 41 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">41</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense&mdash;business
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/BusinessOthIntExpnsGrp/SourcedAtPartnerLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/BusinessOthIntExpnsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 42 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">42</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense&mdash;investment
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/InvestmentOthIntExpnsGrp/SourcedAtPartnerLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/InvestmentOthIntExpnsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 43 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">43</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense&mdash;passive activity
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/PassiveActivityOthIntExpnsGrp/SourcedAtPartnerLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/PassiveActivityOthIntExpnsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 44 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">44</td>
									<td class="styTableCellTextInherit" style="">
										Section 59(e)(2) expenditures, excluding R&amp;E expenses on line 32
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Sect59e2ExpendNoREExpnsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 45 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">45</td>
									<td class="styTableCellTextInherit" style="">
										Foreign taxes not creditable but deductible
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/FrgnTxsNotCreditableDedGrp"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 5 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 2 &mdash; Deductions <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page5Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 46 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">46</td>
									<td class="styTableCellTextInherit" style="">
										Section 986(c) loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Section986cLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 47 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">47</td>
									<td class="styTableCellTextInherit" style="">
										Section 987 loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Section987LossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 48 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">48</td>
									<td class="styTableCellTextInherit" style="">
										Section 988 loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/Section988LossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 49 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">49</td>
									<td class="styTableCellTextInherit" style="">
										Other allocable deductions (see instructions) 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OtherAllocableDeductionsGrp"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OtherAllocableDeductionsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 50 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">50</td>
									<td class="styTableCellTextInherit" style="">
										Other apportioned share of deductions (see instructions) 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthApportionedShrDedGrp"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/OthApportionedShrDedGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 51 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">51</td>
									<td class="styTableCellTextInherit" style="background-color:white;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 52 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">52</td>
									<td class="styTableCellTextInherit" style="background-color:white;">
										Reserved for future use 
									</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 53 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">53</td>
									<td class="styTableCellTextInherit" style="background-color:white;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 54 -->
								<tr style="vertical-align:bottom;border-top:1px solid black;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">54</td>
									<td class="styTableCellTextInherit" style="">
										<strong>Total deductions </strong> (combine lines 25 through 53)
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/SchK2K3TotalDeductionsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Line 55 -->
								<tr style="vertical-align:bottom;border-top:1px solid black;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">55</td>
									<td class="styTableCellTextInherit" style="">
										<strong>Net income (loss) </strong> (subtract line 54 from line 24)
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditDedGrp/NetIncomeLossGrp"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Part 3, Section 1 --> 
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; R&amp;E Expenses Apportionment Factors</div>
					</div>
					<xsl:variable name="sep3-1" select="($Print = $Separated) and (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &gt; 6)"/>
					<xsl:variable name="P3OthGrp" select="$FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeOtherGrp"/>
					<div class="styTableContainerLandscapeNBB" id="Page5Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___) <br /> (country code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">1</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Gross receipts by SIC code
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:if test="not($sep3-1)">
									<xsl:for-each select="$FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit" style="">
												SIC code 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="USSourceIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignBranchIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GeneralCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:variable name="cnode" select="."/>
												<xsl:choose>
													<xsl:when test="count($P3OthGrp[SICCd = $cnode/SICCd]) &gt; 0">See next page</xsl:when>
													<xsl:otherwise>&nbsp;</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
										<td class="styTableCellTextInherit" style="">
											SIC code
											<xsl:if test="$sep3-1">See Add'l Data</xsl:if>&nbsp;
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &lt; 4)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">D</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &lt; 5)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">E</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp) &lt; 6)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">F</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Line 2 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;text-align:center;padding:none;">2</div>
						<div class="styLNDesc" style="width:201mm;">
							Exclusive apportionment with respect to total R&amp;E expenses entered on Part II, line 32. Enter the following.
						</div>
						<div class="styLNRightNumBoxNBB" style="width:16mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 2A -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;text-align:right;padding:2px 4px 0px 0px;">A</div>
						<div class="styLNDesc" style="width:201mm;">
							R&amp;E expense with respect to activity performed in the United States
						</div>
						<div class="styLNRightNumBoxNBB" style="width:16mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(<xsl:number value="position()" format="i"/>)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;height:auto;min-height:4.26mm;">2A(<xsl:number value="position()" format="i"/>)</div>
							<div class="styLNAmountBox" style="height:4.26mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp) &lt; 1">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(i)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2A(i)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp) &lt; 2">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(ii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2A(ii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp) &lt; 3">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(iii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">........................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2A(iii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Line 2B -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;text-align:right;padding:2px 4px 0px 0px;">B</div>
						<div class="styLNDesc" style="width:201mm;">
							R&amp;E expense with respect to activity performed outside the United States
						</div>
						<div class="styLNRightNumBoxNBB" style="width:16mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(<xsl:number value="position()" format="i"/>)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;height:auto;min-height:4mm;">2B(<xsl:number value="position()" format="i"/>)</div>
							<div class="styLNAmountBox" style="height:4.26mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp) &lt; 1">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(i)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2B(i)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp) &lt; 2">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(ii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2B(ii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3REExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp) &lt; 3">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(iii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2B(iii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 5 extra -->
					<xsl:if test="count($P3OthGrp) &gt; 0">
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span> (continued)</span>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; R&amp;E Expenses Apportionment Factors <span style="font-weight:normal;">(Line 1 additional data)</span></div>
					</div>
					<xsl:variable name="OthMultGrp" select="$P3OthGrp[SICCd = following-sibling::GrossReceiptsSICCodeOtherGrp/SICCd or SICCd =  preceding-sibling::GrossReceiptsSICCodeOtherGrp/SICCd]"/>
					<div class="styTableContainerLandscapeNBB" id="Page5TableEX">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$P3OthGrp">
									<xsl:if test="(position() mod 8) = 1">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					</xsl:if>
					<!-- Page 6 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 2 &mdash; Interest Expense Apportionment Factors</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page6Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:59mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> 
										(category code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[1]/SeparateCategoryCd"/>
										</xsl:call-template>) 
										<br /> (country code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[1]/ForeignCountryOrUSPossessionCd"/>
										</xsl:call-template>)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowNumCell">1</td>
									<td class="styTableCellTextInherit">
										Total average value of assets
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'TotalAvgValueAssetsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 2 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">2</td>
									<td class="styTableCellTextInherit">
										Sections 734(b) and 743(b) adjustment to assets&mdash;average value
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'Sect734b743bAdjToAssetsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 3 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">3</td>
									<td class="styTableCellTextInherit">
										Assets attracting directly allocable interest expense under Regulations section <br /> 1.861-10(e)
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AstAttrtIntExpnsSect186110eAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 4 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">4</td>
									<td class="styTableCellTextInherit">
										Other assets attracting directly allocable interest expense under Regulations section 1.861-10T
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'OthAstAttrtIntExpns186110TAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 5 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">5</td>
									<td class="styTableCellTextInherit">
										Assets excluded from apportionment formula
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AssetsExcludedApprtnAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6a -->
								<tr style="vertical-align:bottom;border-top:2px solid black;">
									<td class="sty1065K2RowNumCell">6a</td>
									<td class="styTableCellTextInherit">
										Total assets used for apportionment <br /> (subtract the sum of lines 3, 4, and 5 from the sum of lines 1 and 2)
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'TotAssetsUsedApprtnAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6b -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">b</td>
									<td class="styTableCellTextInherit">
										Assets attracting business interest expense
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AssetsAttrtBusIntExpnsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6c -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">c</td>
									<td class="styTableCellTextInherit">
										Assets attracting investment interest expense
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AssetsAttrtInvstIntExpnsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6d -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">d</td>
									<td class="styTableCellTextInherit">
										Assets attracting passive activity interest expense
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AstAttrtPssvActyIntExpnsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 7 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">7</td>
									<td class="styTableCellTextInherit">
										Basis in stock of 10%-owned noncontrolled foreign corporations (see attachment) 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'BasisInStkOf10PctOwnNonCFCAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 8 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">8</td>
									<td class="styTableCellTextInherit">
										Basis in stock of CFCs (see attachment)
									</td>
									<xsl:call-template name="LineIntExpnsApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'BasisInStockOfCFCAmt'"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 3 &mdash; Foreign-Derived Intangible Income (FDII) Deduction Apportionment Factors</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page6Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:68mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="3">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;" rowspan="2">
										<strong>(e)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(f)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(b)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(c)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
										<strong>(d)</strong> Other <br /> 
										(category code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[1]/SeparateCategoryCd"/>
										</xsl:call-template>) 
										<br /> (country code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[1]/ForeignCountryOrUSPossessionCd"/>
										</xsl:call-template>)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowNumCell">1</td>
									<td class="styTableCellTextInherit">
										Foreign-derived gross receipts
									</td>
									<xsl:call-template name="LineFDIIApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
										<xsl:with-param name="LineElement" select="'ForeignDerivedGroRcptsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 2 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">2</td>
									<td class="styTableCellTextInherit">
										Cost of goods sold
									</td>
									<xsl:call-template name="LineFDIIApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
										<xsl:with-param name="LineElement" select="'CostOfGoodsSoldAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 3 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">3</td>
									<td class="styTableCellTextInherit">
										Partnership deductions allocable to foreign-derived gross receipts
									</td>
									<xsl:call-template name="LineFDIIApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
										<xsl:with-param name="LineElement" select="'PrtshpDedAllcblFrgnGroRcptsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 4 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">4</td>
									<td class="styTableCellTextInherit">
										Other partnership deductions apportioned to foreign-derived gross receipts
									</td>
									<xsl:call-template name="LineFDIIApprtMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
										<xsl:with-param name="LineElement" select="'PrtshpDedApprtnFrgnGroRcptsAmt'"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 6 extra -->
					<xsl:if test="(count($FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp) &gt; 1) 
						or (count($FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp) &gt; 1)">
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span> (continued)</span>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 2 &mdash; Interest Expense Apportionment Factors 
							<span style="font-weight:normal;"> (Additional data)</span>
						</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[position() &gt; 1]">
						<xsl:if test="(position() mod 7) = 1">
							<xsl:variable name="pos" select="position()"/>
							<div class="styTableContainerLandscapeNBB" id="Page6EXTable1">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
											<th class="styTableCellHeader" scope="col" style="width:59mm;" rowspan="2">
												Description
											</th>
											<th class="styTableCellHeader" scope="colgroup" style="border-right-width:0px;" colspan="7">
												Foreign Source
											</th>
										</tr>
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 2]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 3]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 4]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 5]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 6]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 7]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp/OthIntExpnsApprtnFctrGrp[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
										</tr>
									</thead>
									<tbody>
										<!-- Line 1 -->
										<tr>
											<td class="sty1065K2RowNumCell">1</td>
											<td class="styTableCellTextInherit">
												Total average value of assets
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'TotalAvgValueAssetsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 2 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">2</td>
											<td class="styTableCellTextInherit">
												Sections 734(b) and 743(b) adjustment to assets&mdash;average value
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'Sect734b743bAdjToAssetsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 3 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">3</td>
											<td class="styTableCellTextInherit">
												Assets attracting directly allocable interest expense under Regulations section <br /> 1.861-10(e)
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AstAttrtIntExpnsSect186110eAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 4 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">4</td>
											<td class="styTableCellTextInherit">
												Other assets attracting directly allocable interest expense under Regulations section 1.861-10T
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'OthAstAttrtIntExpns186110TAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 5 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">5</td>
											<td class="styTableCellTextInherit">
												Assets excluded from apportionment formula
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AssetsExcludedApprtnAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6a -->
										<tr style="vertical-align:bottom;border-top:2px solid black;">
											<td class="sty1065K2RowNumCell">6a</td>
											<td class="styTableCellTextInherit">
												Total assets used for apportionment <br /> (subtract the sum of lines 3, 4, and 5 from the sum of lines 1 and 2)
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'TotAssetsUsedApprtnAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6b -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">b</td>
											<td class="styTableCellTextInherit">
												Assets attracting business interest expense
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AssetsAttrtBusIntExpnsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6c -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">c</td>
											<td class="styTableCellTextInherit">
												Assets attracting investment interest expense
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AssetsAttrtInvstIntExpnsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6d -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">d</td>
											<td class="styTableCellTextInherit">
												Assets attracting passive activity interest expense
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AstAttrtPssvActyIntExpnsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 7 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">7</td>
											<td class="styTableCellTextInherit">
												Basis in stock of 10%-owned noncontrolled foreign corporations (see attachment)
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'BasisInStkOf10PctOwnNonCFCAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 8 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">8</td>
											<td class="styTableCellTextInherit">
												Basis in stock of CFCs (see attachment)
											</td>
											<xsl:call-template name="LineIntExpnsApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3IntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'BasisInStockOfCFCAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 3 &mdash; Foreign-Derived Intangible Income (FDII) Deduction Apportionment Factors
							<span style="font-weight:normal;"> (Additonal data)</span>
						</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[position() &gt; 1]">
						<xsl:if test="(position() mod 6) = 1">
							<xsl:variable name="pos" select="position()"/>
							<div class="styTableContainerLandscapeNBB" id="Page6EXTable2">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
											<th class="styTableCellHeader" scope="col" style="width:63mm;" rowspan="2">
												Description
											</th>
											<th class="styTableCellHeader" scope="col" style="border-right-width:0px;" colspan="6">
												Foreign Source
											</th>
										</tr>
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(d)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(d)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 2]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(d)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 3]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(d)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 4]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(d)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 5]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
												<strong>(d)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 6]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp/OtherFDIIDedApprtnFctrsGrp[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
										</tr>
									</thead>
									<tbody>
										<!-- Line 1 -->
										<tr>
											<td class="sty1065K2RowNumCell">1</td>
											<td class="styTableCellTextInherit">
												Foreign-derived gross receipts
											</td>
											<xsl:call-template name="LineFDIIApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
												<xsl:with-param name="LineElement" select="'ForeignDerivedGroRcptsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 2 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">2</td>
											<td class="styTableCellTextInherit">
												Cost of goods sold
											</td>
											<xsl:call-template name="LineFDIIApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
												<xsl:with-param name="LineElement" select="'CostOfGoodsSoldAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 3 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">3</td>
											<td class="styTableCellTextInherit">
												Partnership deductions allocable to foreign-derived gross receipts
											</td>
											<xsl:call-template name="LineFDIIApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
												<xsl:with-param name="LineElement" select="'PrtshpDedAllcblFrgnGroRcptsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 4 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">4</td>
											<td class="styTableCellTextInherit">
												Other partnership deductions apportioned to foreign-derived gross receipts
											</td>
											<xsl:call-template name="LineFDIIApprtOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3FDIIDedApprtnFctrsGrp"/>
												<xsl:with-param name="LineElement" select="'PrtshpDedApprtnFrgnGroRcptsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					</xsl:if>
					<!-- Page 7 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 4 &mdash; Foreign Taxes</div>
					</div>
					<xsl:variable name="sep3-4-1" select="($Print = $Separated) and (count($FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsGrp) &gt; 6)"/>
					<xsl:variable name="sep3-4-3" select="($Print = $Separated) and (count($FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page7Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:81mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> Type of tax
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;" colspan="2">
										<strong>(b)</strong> Section 951A category income
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;border-right-width:0px;" colspan="3">
										<strong>(c)</strong> Foreign branch category income
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">Partner</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part 3, Section 4, Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">1</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Direct (section 901 or <br /> 903) foreign taxes: 
										<span style="width:7mm;"/>
										<input class="styCkboxNM" type="checkbox" style="" alt="Direct Foreign Taxes Paid Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/ForeignTaxesPaidInd"/>
												<xsl:with-param name="BackupName">F1065K2ForeignTaxesGrpPaidInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:10mm;padding-left:1mm;">Paid</span>
										<input class="styCkboxNM" type="checkbox" style="" alt="Direct Foreign Taxes Accrued Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/ForeignTaxesAccruedInd"/>
												<xsl:with-param name="BackupName">F1065K2ForeignTaxesGrpPaidInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="padding-left:1mm;">Accrued</span>
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:variable name="count341" select="count($FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsGrp)"/>
								<xsl:if test="not($sep3-4-1)">
									<xsl:for-each select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
												<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:choose>
													<xsl:when test="OtherCategoryDescriptionCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<xsl:call-template name="LineForeignTaxSingleP1">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:if test="$sep3-4-1">See Add'l Data</xsl:if>&nbsp;
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 4)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">D</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 5)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">E</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 6)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">F</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<!-- Part 3, Section 4, Line 2 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">2</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Reduction of taxes (total)
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
									<td class="styTableCellTextInherit">
										Taxes on foreign mineral income
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'FrgnMineralIncmTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnMineralIncmAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
									<td class="styTableCellTextInherit">
										International boycott provisions
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'IntntlByctPrvsnTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'IntntlBoycottProvisionsAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">D</td>
									<td class="styTableCellTextInherit">
										Failure-to-file penalties
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'FailureToFilePenaltyTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'FailureToFilePenaltyAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">E</td>
									<td class="styTableCellTextInherit">
										Taxes with respect to splitter arrangements
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'SplitterArrangementTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'SplitterArrangementTaxAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">F</td>
									<td class="styTableCellTextInherit">
										Taxes on foreign corporate distributions
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'FrgnCorpDistriTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnCorpDistributionsAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">G</td>
									<td class="styTableCellTextInherit">
										Other
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'OtherReductionsTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'OtherTaxReductionsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Part 3, Section 4, Line 3 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">3</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Foreign tax redeterminations
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:variable name="count343" select="count($FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp)"/>
								<xsl:if test="not($sep3-4-3)">
									<xsl:for-each select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">
												<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<span style="border-bottom:1px dashed black;width:100%;">
													<xsl:choose>
														<xsl:when test="OtherCategoryDescriptionCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<br />
												Related tax year &#9658; 
												<span style="border-bottom:1px dashed black;width:55mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RelatedTaxYr"/>
													</xsl:call-template>
												</span>
												<br />
												Date tax paid &#9658; 
												<xsl:choose>
													<xsl:when test="count(TaxPaidDt) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
															<xsl:with-param name="Desc">Part III, Section 4, Line 3 - Dates tax paid</xsl:with-param>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<xsl:call-template name="LineForeignTaxSingleP1">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3-4-3 or ($count343 &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
										<td class="styTableCellTextInherit" style="">
											<span style="width:100%;border-bottom:1px dashed black;">
												<xsl:if test="$sep3-4-3">See Add'l Data</xsl:if>&nbsp;
											</span>
											<br />
											Related tax year &#9658;
											<span style="width:55mm;border-bottom:1px dashed black;">&nbsp;</span>
											<br />
											Date tax paid &#9658;  
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-3 or ($count343 &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
										<td class="styTableCellTextInherit" style="">
											<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Related tax year &#9658; <span style="width:55mm;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Date tax paid &#9658; 
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-3 or ($count343 &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
										<td class="styTableCellTextInherit" style="">
											<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Related tax year &#9658; <span style="width:55mm;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Date tax paid &#9658;  
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<!-- Part 3, Section 4, Line 4 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">4</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="">5</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom:1px solid black;">6</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 8 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 4 &mdash; Foreign Taxes <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page8Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(d)</strong> Passive category income
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(e)</strong> General category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Other <br /> (category code 
										<span style="min-width:6mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[1]/SeparateCategoryCd"/>
											</xsl:call-template>
										</span>)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Partner</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Partner</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part 3, Section 4, Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">1</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="LineForeignTaxP2">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
									<xsl:with-param name="Sep" select="$sep3-4-1"/>
									<xsl:with-param name="SixLine" select="true()"/>
								</xsl:call-template>
								<!-- Part 3, Section 4, Line 2 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">2</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnMineralIncmAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'IntntlBoycottProvisionsAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">D</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'FailureToFilePenaltyAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">E</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'SplitterArrangementTaxAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">F</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnCorpDistributionsAmt'"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">G</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'OtherTaxReductionsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Part 3, Section 4, Line 3 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">3</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="LineForeignTaxP2">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp"/>
									<xsl:with-param name="Sep" select="$sep3-4-3"/>
									<xsl:with-param name="SixLine" select="false()"/>
								</xsl:call-template>
									<!-- Part 3, Section 4, Line 4 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">4</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="">5</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom:1px solid black;">6</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 5 &mdash; Other Tax Information</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page8Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="" colspan="5">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(g)</strong> Sourced by partner
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(h)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Section 951A <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Foreign branch <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(e)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(f)</strong> Other <br /> 
										(category code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[1]/SeparateCategoryCd"/>
										</xsl:call-template>) 
										<br /> (country code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[1]/ForeignCountryOrUSPossessionCd"/>
										</xsl:call-template>)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">1</td>
									<td class="styTableCellTextInherit">
										Section 743(b) positive income adjustment
									</td>
									<xsl:call-template name="Line111OthMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3OtherTaxInformationGrp"/>
										<xsl:with-param name="LineElement" select="'Sect743bPositiveIncmAdjAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 2 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">2</td>
									<td class="styTableCellTextInherit">
										Section 743(b) negative income adjustment
									</td>
									<xsl:call-template name="Line111OthMain">
										<xsl:with-param name="SubGroup" select="$FormData/SchK2K3OtherTaxInformationGrp"/>
										<xsl:with-param name="LineElement" select="'Sect743bNegativeIncmAdjAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 3 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">3</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 4 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">4</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 8 extra -->
					<xsl:if test="(count($FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp) &gt; 0) or 
					(count($FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp) &gt; 1) or 
					(count($FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp) &gt; 0) or 
					(count($FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp) &gt; 1)">
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span> (continued)</span>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 4 &mdash; R&amp;E Foreign taxes <span style="font-weight:normal;">(Line 1 additional data)</span></div>
					</div>
					<xsl:variable name="P8OthGrp1" select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
					<div class="styTableContainerLandscapeNBB" id="Page8TableEX1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$P8OthGrp1">
									<xsl:if test="(position() mod 8) = 1">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 1]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 2]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 3]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 4]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 5]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 6]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 7]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 4 &mdash; R&amp;E Foreign taxes <span style="font-weight:normal;">(Line 2 additional data)</span></div>
					</div>
					<xsl:variable name="P8OthGrp2" select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
					<xsl:for-each select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[position() &gt; 1]">
						<xsl:if test="(position() mod 6) = 1">
							<xsl:variable name="pos" select="position()"/>
							<div class="styTableContainerLandscapeNBB" id="Page8EXTable2">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" style="width:7mm;">&nbsp;</th>
											<th class="styTableCellHeader" scope="col" style="width:63mm;">
												Description
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 2]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 3]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 4]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 5]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 6]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
										</tr>
									</thead>
									<tbody>
										<!-- Part 3, Section 4, Line 2 -->
										<tr>
											<td class="sty1065K2RowIDCell" style="">2</td>
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
												Reduction of taxes (total)
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										</tr>
										<!-- 2A -->
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
											<td class="styTableCellTextInherit">
												Taxes on foreign mineral income
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'TxsOnFrgnMineralIncmAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
											<td class="styTableCellTextInherit">
												Reserved for future use
											</td>
											<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
											<td class="styTableCellTextInherit">
												International boycott provisions
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'IntntlBoycottProvisionsAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">D</td>
											<td class="styTableCellTextInherit">
												Failure-to-file penalties
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'FailureToFilePenaltyAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">E</td>
											<td class="styTableCellTextInherit">
												Taxes with respect to splitter arrangements
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'SplitterArrangementTaxAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">F</td>
											<td class="styTableCellTextInherit">
												Taxes on foreign corporate distributions
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'TxsOnFrgnCorpDistributionsAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">G</td>
											<td class="styTableCellTextInherit">
												Other
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3ForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'OtherTaxReductionsAmt'"/>
											</xsl:call-template>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:variable name="P8OthGrp3" select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp"/>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 4 &mdash; R&amp;E Foreign taxes <span style="font-weight:normal;">(Line 3 additional data)</span></div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page8TableEX3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$P8OthGrp3">
									<xsl:if test="(position() mod 8) = 1">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 1]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 2]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 3]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 4]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 5]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 6]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 7]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 5 &mdash; Other Tax Information <span style="font-weight:normal;">(Additional data)</span></div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[position() &gt; 1]">
						<xsl:if test="(position() mod 6) = 1">
							<xsl:variable name="pos" select="position()"/>
							<div class="styTableContainerLandscapeNBB" id="Page8EXTable4">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" style="width:7mm;">&nbsp;</th>
											<th class="styTableCellHeader" scope="col" style="width:63mm;">
												Description
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>) <br />
												(country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 2]/SeparateCategoryCd"/>
												</xsl:call-template>) <br />
												(country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 3]/SeparateCategoryCd"/>
												</xsl:call-template>) <br />
												(country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 4]/SeparateCategoryCd"/>
												</xsl:call-template>) <br />
												(country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 5]/SeparateCategoryCd"/>
												</xsl:call-template>) <br />
												(country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 6]/SeparateCategoryCd"/>
												</xsl:call-template>) <br />
												(country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/SchK2K3OtherTaxInformationGrp/OtherCatIncmOthTaxGrp[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>) 
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="sty1065K2RowNumCell">1</td>
											<td class="styTableCellTextInherit">
												Section 743(b) positive income adjustment
											</td>
											<xsl:call-template name="Line111OthOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3OtherTaxInformationGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'Sect743bPositiveIncmAdjAmt'"/>
											</xsl:call-template>
										</tr>
										<!-- Line 2 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">2</td>
											<td class="styTableCellTextInherit">
												Section 743(b) negative income adjustment
											</td>
											<xsl:call-template name="Line111OthOther">
												<xsl:with-param name="SubGroup" select="$FormData/SchK2K3OtherTaxInformationGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'Sect743bNegativeIncmAdjAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="sty1065K2RowNumCell">3</td>
											<td class="styTableCellTextInherit">
												Reserved for future use
											</td>
											<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
										<tr>
											<td class="sty1065K2RowNumCell">4</td>
											<td class="styTableCellTextInherit">
												Reserved for future use
											</td>
											<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					</xsl:if>
					<!-- Page 9 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">9</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information on Partners' Section 250 Deduction With Respect to Foreign-Derived Intangible Income (FDII)
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 1 &mdash; Information to Determine Deduction Eligible Income (DEI) and Qualified Business Asset Investment (QBAI) on Form 8993
						</div>
					</div>
					<!-- Part 4, Section 1, Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:208mm;">
							Net income (loss)
							<span class="sty1065K2DotLn">..............................................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/NetIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 2a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="width:208mm;">
							DEI gross receipts
							<span class="sty1065K2DotLn">..............................................</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossDEIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 2b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:208mm;">
							DEI cost of goods sold (COGS)
							<span class="sty1065K2DotLn">..........................................</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/CostOfGoodsSoldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 2c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:208mm;">
							DEI properly allocated and apportioned deductions
							<span class="sty1065K2DotLn">...................................</span>
						</div>
						<div class="styLNRightNumBox">2c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/ProperlyAllocableDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:208mm;">
							Section 951(a) inclusions
							<span class="sty1065K2DotLn">...........................................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/Section951a1IncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:208mm;">
							CFC Dividends
							<span class="sty1065K2DotLn">...............................................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/CFCDividendsReceivedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:208mm;">
							Financial services income
							<span class="sty1065K2DotLn">...........................................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/FinancialServicesIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:208mm;">
							Domestic oil and gas extraction income
							<span class="sty1065K2DotLn">.......................................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/DomOilGasExtractionIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:208mm;">
							Foreign branch income
							<span class="sty1065K2DotLn">............................................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/ForeignBranchIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 1, Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:208mm;">
							Partnership QBAI
							<span class="sty1065K2DotLn">..............................................</span>
						</div>
						<div class="styLNRightNumBoxNBB">8</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/PartnershipQBAIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;border-top:2px solid black;">
							Section 2 &mdash; Information to Determine Foreign-Derived Deduction Eligible Income on Form 8993 <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Part 4, Section 2, Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:120mm;">
							Gross receipts
							<span class="sty1065K2DotLn">.........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsForFDDEIGrp/FDIAllSalesGeneralPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsForFDDEIGrp/FDIAllSalesIntangiblePropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsForFDDEIGrp/FDIAllServicesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsForFDDEIGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 2, Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:120mm;">
							COGS
							<span class="sty1065K2DotLn">...........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/CostOfGoodsSoldForFDDEIGrp/FDIAllSalesGeneralPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/CostOfGoodsSoldForFDDEIGrp/FDIAllSalesIntangiblePropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/CostOfGoodsSoldForFDDEIGrp/FDIAllServicesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/CostOfGoodsSoldForFDDEIGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 2, Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:120mm;">
							Allocable deductions
							<span class="sty1065K2DotLn">.......................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/AllocableDedForFDDEIGrp/FDIAllSalesGeneralPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/AllocableDedForFDDEIGrp/FDIAllSalesIntangiblePropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/AllocableDedForFDDEIGrp/FDIAllServicesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/AllocableDedForFDDEIGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 2, Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:208mm;">
							Other apportioned deductions
							<span class="sty1065K2DotLn">..........................................</span>
						</div>
						<div class="styLNRightNumBoxNBB">12</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/OthApprtnDedForFDDEIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;border-top:2px solid black;">
							Section 3 &mdash; Other Information for Preparation of Form 8993
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:152mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="font-weight:bold;text-align:center;">DEI</div>
						<div class="styLNAmountBoxNBB" style="font-weight:bold;text-align:center;">FDDEI</div>
						<div class="styLNAmountBoxNBB" style="font-weight:bold;text-align:center;">Total</div>
					</div>
					<!-- Part 4, Section 3, Line 13 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:152mm;">Interest deductions</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">A</div>
						<div class="styLNDesc" style="width:152mm;">
							Interest expense specifically allocable under Regulations section 1.861-10(e)
							<span class="sty1065K2DotLn">.............</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/IntExpnsSect186110eFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">B</div>
						<div class="styLNDesc" style="width:152mm;">
							Other interest expense specifically allocable under Regulations section 1.861-10T
							<span class="sty1065K2DotLn">............</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/OthIntExpns186110TFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">C</div>
						<div class="styLNDesc" style="width:152mm;">
							Other interest expense
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/OthIntExpenseFrm8993TotalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Section 3, Line 14 -->
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:152mm;">Interest expense apportionment factors</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">A</div>
						<div class="styLNDesc" style="width:152mm;">
							Total average value of assets 
							<span class="sty1065K2DotLn">............................</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/TotAvgValueOfAssetsFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">B</div>
						<div class="styLNDesc" style="width:152mm;">
							Sections 734(b) and 743(b) ajustment to assets &mdash; average value
							<span class="sty1065K2DotLn">.................</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/Sect734b743bAdjAstFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">C</div>
						<div class="styLNDesc" style="width:152mm;">
							Assets attracting directly allocable interest expense under Regulations section 1.861-10(e)
							<span class="sty1065K2DotLn">.........</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/AstIntExpns186110eFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">D</div>
						<div class="styLNDesc" style="width:152mm;">
							Other assets attracting directly allocable interest expense under Regulations section 1.861-10T
							<span class="sty1065K2DotLn">.......</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/OthAstIntExpns186110T8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">E</div>
						<div class="styLNDesc" style="width:152mm;">
							Assets excluded from apportionment formula
							<span class="sty1065K2DotLn">.......................</span>
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/AssetsExcludedApprtnFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftLtrBox">F</div>
						<div class="styLNDesc" style="width:152mm;">
							Total assets used for apportionment (the sum of lines 14C, 14D, and 14E subtracted from the sum of lines 14A and 14B)
							<!--<span class="sty1065K2DotLn">.</span>-->
						</div>
						<xsl:call-template name="Line8993DEI">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/TotAssetsUsedApprtnFrm8993Grp"/>
						</xsl:call-template>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc" style="width:152mm;">R&amp;E expenses apportionment factors</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- Part 4, Section 3, Line 15 -->
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:152mm;">Gross receipts by SIC code</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsSICCdFrm8993Grp">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox"><xsl:number value="position()" format="A"/></div>
							<div class="styLNDesc" style="width:152mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</span>
								<span class="sty1065K2DotLn">...............................</span>
							</div>
							<xsl:call-template name="Line8993DEI">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsSICCdFrm8993Grp) &lt; 1">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox">A</div>
							<div class="styLNDesc" style="width:152mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">&nbsp;</span>
								<span class="sty1065K2DotLn">...............................</span>
							</div>
							<div class="styLNAmountBox">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsSICCdFrm8993Grp) &lt; 2">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox">B</div>
							<div class="styLNDesc" style="width:152mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">&nbsp;</span>
								<span class="sty1065K2DotLn">...............................</span>
							</div>
							<div class="styLNAmountBox">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3PrtnrSect250DedFDIIGrp/GrossReceiptsSICCdFrm8993Grp) &lt; 3">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox">C</div>
							<div class="styLNDesc" style="width:152mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">&nbsp;</span>
								<span class="sty1065K2DotLn">...............................</span>
							</div>
							<div class="styLNAmountBox">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 4, Section 3, Line 16 -->
					<div class="styStdIBDivLS" style="">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:208mm;">R&amp;E expenses by SIC code</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3PrtnrSect250DedFDIIGrp/REExpnssSICCdFrm8993Grp">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox"><xsl:number value="position()" format="A"/></div>
							<div class="styLNDesc" style="width:208mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</span>
								<span class="sty1065K2DotLn">.............................................</span>
							</div>
							<div class="styLNRightNumBox">16<xsl:number value="position()" format="A"/></div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3PrtnrSect250DedFDIIGrp/REExpnssSICCdFrm8993Grp) &lt; 1">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox">A</div>
							<div class="styLNDesc" style="width:208mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">&nbsp;</span>
								<span class="sty1065K2DotLn">.............................................</span>
							</div>
							<div class="styLNRightNumBox">16A</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3PrtnrSect250DedFDIIGrp/REExpnssSICCdFrm8993Grp) &lt; 2">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox">B</div>
							<div class="styLNDesc" style="width:208mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">&nbsp;</span>
								<span class="sty1065K2DotLn">.............................................</span>
							</div>
							<div class="styLNRightNumBox">16B</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/SchK2K3PrtnrSect250DedFDIIGrp/REExpnssSICCdFrm8993Grp) &lt; 3">
						<div class="styStdIBDivLS" style="">
							<div class="styLNLeftLtrBox">C</div>
							<div class="styLNDesc" style="width:208mm;">
								SIC code
								<span style="width:12mm;text-align:center;border-bottom:1px solid black;">&nbsp;</span>
								<span class="sty1065K2DotLn">.............................................</span>
							</div>
							<div class="styLNRightNumBox">16C</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 10 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">10</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Distributions From Foreign Corporations to Partnership
						</div>
					</div>
					<!-- Part 5 tables -->
					<xsl:variable name="sep5" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnCorpDistriPrtshpGrp) &gt; 15)"/>
					<div class="styTableContainerLandscapeNBB" id="Page10Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:124mm;font-weight:normal;">
										<strong>(a)</strong> Name of distributing foreign corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Date of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Functional currency of distributing foreign corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Amount of distribution in functional currency
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep5)">
									<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriPrtshpGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DistributingForeignCorpName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part V, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionFuncCurAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or (count($FormData/SchK2K3FrgnCorpDistriPrtshpGrp) &lt; 15)">
									<xsl:call-template name="FillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3FrgnCorpDistriPrtshpGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep5"/>
										<xsl:with-param name="MaxLine" select="15"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page10Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(f)</strong> Amount of E&amp;P distribution <br /> in functional currency
									</th>
									<th class="styTableCellHeader" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(g)</strong> Spot rate (functional <br /> currency to U.S. dollars)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(h)</strong> Amount of distribution <br /> in U.S. dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(i)</strong> Amount of E&amp;P distribution <br /> in U.S. dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(j)</strong> Qualified foreign corporations
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-right-width:0px;">
										<strong>(k)</strong> Reserved for <br /> future use
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep5)">
									<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriPrtshpGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpotRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EPDistributionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="padding-top:0.5mm;">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="alt">Row <xsl:value-of select="AlphaRowId"/> Qualified Foreign Corporation Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="QualifiedForeignCorporationInd"/>
														<xsl:with-param name="BackupName">SchK2K3FrgnCorpDistriPrtshpGrpQualifiedForeignCorporationInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;background-color:lightgrey;">&nbsp;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or (count($FormData/SchK2K3FrgnCorpDistriPrtshpGrp) &lt; 15)">
									<xsl:call-template name="FillPart5Table2">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3FrgnCorpDistriPrtshpGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep5"/>
										<xsl:with-param name="MaxLine" select="15"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 11 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">11</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VI</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information on Partners' Section 951(a)(1) and Section 951A Inclusions
						</div>
					</div>
					<!-- Part 6, Line a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDesc" style="width:216mm;">
							Separate category (enter code &mdash; see instructions)
							<span class="sty1065K2DotLn">.....................................</span>
						</div>
						<div class="styLNAmountBox" style="border-left:none;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDesc" style="width:240mm;">
							If U.S. source, complete as a separate Part VI by separate category and check box
							<span class="sty1065K2DotLn" style="margin-right:-6px;">................................&#9658;</span>
						</div>
						<div class="styGenericDiv" style="width:8mm;text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="margin-top:2px;" alt="U.S. source income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/USSourceIncomeInd"/>
									<xsl:with-param name="BackupName">F1065K2USSourceIncomeInd1</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Part 6 tables -->
					<xsl:variable name="sep6" select="($Print = $Separated) and (count($FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp) &gt; 11)"/>
					<div class="styTableContainerLandscapeNBB" id="Page11Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:92mm;font-weight:normal;">
										<strong>(a)</strong> Name of CFC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong> Ending of CFC tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> Partners' share of CFC items through their ownership in the partnership ("aggregate share")
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(e)</strong> Aggregate share of subpart F income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(f)</strong> Aggregate section 951(a)(1)(B) inclusion
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Tested income
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep6)">
									<xsl:for-each select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="CFCTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AggrgtShrCFCItemsPrtshpOwnrRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareSubpartFIncomeAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtSect951a1BInclsnAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep6 or (count($FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp) &lt; 11)">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep6"/>
										<xsl:with-param name="MaxLine" select="11"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 6, Table 1 Totals -->
					<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:163mm;">
							<strong>Partnership total </strong> (sum for all CFCs)
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggrgtShareSubpartFIncmAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggrgtSect951a1BInclsnAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:27mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotalTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page11Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<strong>(h)</strong> Tested loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
										<strong>(i)</strong> Aggregate share of tested income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<strong>(j)</strong> Aggregate share of tested loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
										<strong>(k)</strong> Aggregate share of Qualified Business Asseet Investment (QBAI)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<strong>(l)</strong> Aggregate share of the tested loss QBAI amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
										<strong>(m)</strong> Aggregate share of tested interest income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;border-right-width:0px;">
										<strong>(n)</strong> Aggregate share of tested interest expense
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep6)">
									<xsl:for-each select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep6 or (count($FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp) &lt; 11)">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/SchK2K3PrtshpCFCOwnrInfoGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep6"/>
										<xsl:with-param name="MaxLine" select="11"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 6, Table 2 Totals -->
					<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotalTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggrgtShareTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggregateShareTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggregateShareQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggrgtShrTestedLossQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:35.1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggrgtShareTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[1]/TotAggrgtShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 11 extra -->
					<xsl:for-each select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp[position() &gt; 1]">
						<div class="styStdDivLS">
							Schedule K-2 (Form 1065) 2021
							<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">11</span> (continued)</span>
						</div>
						<!-- Filer information section -->
						<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
							<div class="styNameBox" style="width:209.2mm;">
								Name of partnership <br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template><br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
								<strong>EIN</strong> <br />
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</div>
						</div>
						<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
							<div class="styPartName" style="width:15mm;">Part VI</div>
							<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
								Information on Partners' Section 951(a)(1) and Section 951A Inclusions <span style="font-weight:normal;">(continued)</span>
							</div>
						</div>
						<!-- Part 6, Line a -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">a</div>
							<div class="styLNDesc" style="width:216mm;">
								Separate category (enter code &mdash; see instructions)
								<span class="sty1065K2DotLn">.....................................</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:240mm;">
								If U.S. source, complete as a separate Part VI by separate category and check box
								<span class="sty1065K2DotLn" style="margin-right:-6px;">................................&#9658;</span>
							</div>
							<div class="styGenericDiv" style="width:8mm;text-align:center;">
								<input type="checkbox" class="styCkboxNM" style="margin-top:2px;" alt="U.S. source income">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="USSourceIncomeInd"/>
										<xsl:with-param name="BackupName">F1065K2USSourceIncomeInd<xsl:value-of select="position() + 1"/></xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<!-- Part 6 tables -->
						<xsl:variable name="sep6x" select="($Print = $Separated) and (count(SchK2K3PrtshpCFCOwnrInfoGrp) &gt; 11)"/>
						<div class="styTableContainerLandscapeNBB" id="Page11Table1x">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr style="border-top:1px solid black;">
										<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:92mm;font-weight:normal;">
											<strong>(a)</strong> Name of CFC
										</th>
										<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
											<strong>(b)</strong> EIN or reference ID number
										</th>
										<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
											<strong>(c)</strong> Ending of CFC tax year
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
											<strong>(d)</strong> Partners' share of CFC items through their ownership in the partnership ("aggregate share")
										</th>
										<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(e)</strong> Aggregate share of subpart F income
										</th>
										<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(f)</strong> Aggregate section 951(a)(1)(B) inclusion
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;">
											<strong>(g)</strong> Tested income
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not($sep6x)">
										<xsl:for-each select="SchK2K3PrtshpCFCOwnrInfoGrp">
											<tr style="vertical-align:bottom;">
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AlphaRowId"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellTextInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="CFCName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:choose>
														<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="CFCTaxYearEndDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AggrgtShrCFCItemsPrtshpOwnrRt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtShareSubpartFIncomeAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtSect951a1BInclsnAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="$sep6x or (count(SchK2K3PrtshpCFCOwnrInfoGrp) &lt; 11)">
										<xsl:call-template name="FillTable8Cols">
											<xsl:with-param name="LineNumber" select="1 + count(SchK2K3PrtshpCFCOwnrInfoGrp)"/>
											<xsl:with-param name="SepMessage" select="$sep6x"/>
											<xsl:with-param name="MaxLine" select="11"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part 6, Table 1 Totals -->
						<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:163mm;">
								<strong>Partnership total </strong> (sum for all CFCs)
								<span class="sty1065K2DotLn">...........................&#9658;</span>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShareSubpartFIncmAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtSect951a1BInclsnAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:27mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalTestedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styTableContainerLandscapeNBB" id="Page11Table2x">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr style="border-top:1px solid black;">
										<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(h)</strong> Tested loss
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(i)</strong> Aggregate share of tested income
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(j)</strong> Aggregate share of tested loss
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(k)</strong> Aggregate share of Qualified Business Asseet Investment (QBAI)
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(l)</strong> Aggregate share of the tested loss QBAI amount
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(m)</strong> Aggregate share of tested interest income
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;border-right-width:0px;">
											<strong>(n)</strong> Aggregate share of tested interest expense
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not($sep6x)">
										<xsl:for-each select="SchK2K3PrtshpCFCOwnrInfoGrp">
											<tr style="vertical-align:bottom;">
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AlphaRowId"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShareTestedIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShareTestedLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShareQBAIAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShrTestedLossQBAIAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntExpenseAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="$sep6x or (count(SchK2K3PrtshpCFCOwnrInfoGrp) &lt; 11)">
										<xsl:call-template name="FillTable8Cols">
											<xsl:with-param name="LineNumber" select="1 + count(SchK2K3PrtshpCFCOwnrInfoGrp)"/>
											<xsl:with-param name="SepMessage" select="$sep6x"/>
											<xsl:with-param name="MaxLine" select="11"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part 6, Table 2 Totals -->
						<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalTestedLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShareTestedIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggregateShareTestedLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggregateShareQBAIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShrTestedLossQBAIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:35.1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShareTestedIntIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:35mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShrTestedIntExpnsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
							<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
						</div>
					</xsl:for-each>
					<!-- Page 12 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">12</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VII</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information To Complete Form 8621
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 1 &mdash; General Information on Passive Foreign Investment Company (PFIC), Qualified Electing Fund (QEF), or Qualifying Insurance Corporation (QIC)
						</div>
					</div>
					<!-- Part 7 tables -->
					<xsl:variable name="sep7" select="($Print = $Separated) and (count($FormData/SchK2K3InfoToComplete8621Grp) &gt; 12)"/>
					<div class="styTableContainerLandscapeNBB" id="Page12Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="">
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;" colspan="5">General Information</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:102mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:90mm;font-weight:normal;">
										<strong>(c)</strong> Address of PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(d)</strong> Beginning of PFIC tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Ending of PFIC tax year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:choose>
													<xsl:when test="PFICOrQEFForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="PFICOrQEFForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="PFICOrQEFUSAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TaxYearBeginDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/SchK2K3InfoToComplete8621Grp) &lt; 12)">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3InfoToComplete8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page12Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="colgroup" colspan="4" style="width:auto;">Summary of Annual Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="5" style="width:auto;">Information Regarding Elections</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Description of each <br /> class of PFIC shares
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC <br /> shares acquired <br /> during tax year <br /> (if applicable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(h)</strong> Total number of <br /> PFIC shares held at <br /> end of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(i)</strong> Total value of <br /> PFIC shares held at <br /> end of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(j)</strong> Election by partnership <br /> (enter code &mdash; see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(k)</strong> Check if foreign corporation has documented its eligiblity to be treated as a qualifying insurance corporation under section <br /> 1297(f)(2).
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(l)</strong> Check if PFIC has indicated its shares are "marketable stock" within the meaning of section 1296(e).
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(m)</strong> Check if PFIC is also a controlled foreign corporation (CFC) within the meaning of section 957.
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;border-right-width:0px;">
										<strong>(n)</strong> Check if PFIC meets the income test or asset test of section 1297(a) for the tax year.
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ClassOfShareCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="SharesAcquiredDuringTYDt"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndCnt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartnershipElectionCd"/>
												</xsl:call-template>
											</td>
											<xsl:variable name="pos" select="position()"/>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> Qualified Insurance Corporation Election Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="QualifiedInsuranceCorpElectInd"/>
														<xsl:with-param name="BackupName">K2QualifiedInsuranceCorpElectInd<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC election to mark Marketable Stock Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ElectionToMarkToMrktPFICStkInd"/>
														<xsl:with-param name="BackupName">K2ElectionToMarkToMrktPFICStkInd<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC CFC under Section 957 Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PFICCFCUnderSect957Ind"/>
														<xsl:with-param name="BackupName">K2PFICCFCUnderSect957Ind<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC Income Asset Test Met Section 1297 A Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PFICIncmAstTestMetSect1297aInd"/>
														<xsl:with-param name="BackupName">K2PFICIncmAstTestMetSect1297aInd<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/SchK2K3InfoToComplete8621Grp) &lt; 12)">
									<xsl:call-template name="FillPart7Table2">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3InfoToComplete8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 13 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">13</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VII</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information To Complete Form 8621 <span style="font-style:italic;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 2 &mdash; Additional Information on PFIC or QEF
						</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page13Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">General Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">QEF Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">Mark-to-Market Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:auto;border-right-width:0px;">Section 1291 and Other Information</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:61mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Ordinary earnings
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> Net capital gain
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(e)</strong> Fair market value of PFIC shares at beginning of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(f)</strong> Fair market value of PFIC shares at end of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC shares were acquired
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(h)</strong> Amount of cash and fair market value of property distributed by PFIC during the current tax year (if applicable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(i)</strong> Dates of distribution
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VII, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OrdinaryEarningsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetCapitalGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYBegngAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYEndAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="SharesAcquiredDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICCashDistributedPropFMVAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/SchK2K3InfoToComplete8621Grp) &lt; 12)">
									<xsl:call-template name="FillTable9ColsR">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3InfoToComplete8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page13Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="6" style="width:auto;border-right-width:0px;">Section 1291 and Other Information</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(j)</strong> Total creditable foreign taxes attributable to distribution by PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(k)</strong> Total distributions from PFIC in preceding 3 tax years
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(l)</strong> Dates PFIC disposed of during tax year (if applicable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(m)</strong> Amount realized on disposition of PFIC shares
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(n)</strong> Tax basis of PFIC shares on dates of disposition
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;font-weight:normal;border-right-width:0px;">
										<strong>(o)</strong> Gain (loss) on disposition of PFIC shares
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotPFICCrdblFrgnTxsDistriAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotPFICDistriPrec3TaxYearsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DispositionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICSharesDisposRealizedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICSharesTaxBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICSharesDisposGainLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/SchK2K3InfoToComplete8621Grp) &lt; 12)">
									<xsl:call-template name="FillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3InfoToComplete8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
										<xsl:with-param name="RowID" select="false()"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 14 -->
					<xsl:for-each select="$FormData/SchK2K3PrtshpFrgnCorpIncmGrp">
						<div class="styStdDivLS">
							Schedule K-2 (Form 1065) 2021
							<span style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">14</span> 
								<xsl:if test="position() &gt; 1"> (continued)</xsl:if>
							</span>
						</div>
						<xsl:call-template name="S960Page1"></xsl:call-template>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
							<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
						</div>
						<xsl:if test="position() != last()">
							<!-- Page 15 -->
							<div class="styStdDivLS">
								Schedule K-2 (Form 1065) 2021
								<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">15</span> (excerpt)</span>
							</div>
							<xsl:call-template name="S960Page2"/>
							<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
								<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3PrtshpFrgnCorpIncmGrp) &lt; 1">
						<div class="styStdDivLS">
							Schedule K-2 (Form 1065) 2021
							<span style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">14</span> 
							</span>
						</div>
						<xsl:call-template name="S960Page1"></xsl:call-template>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
							<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
						</div>
					</xsl:if>
					<!-- Page 15 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">15</span> 
						</span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VIII</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Partnership's Interest in Foreign Corporations Income (Section 960) <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3PrtshpFrgnCorpIncmGrp[position() = last()]">
						<xsl:call-template name="S960Page2"/>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3PrtshpFrgnCorpIncmGrp) &lt; 1">
						<xsl:call-template name="S960Page2"/>
					</xsl:if>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part IX</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Partners' Information for Base Erosion and Anti-Abuse Tax (Section 59A) 
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 1 &mdash; Applicable Taxpayer <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:152mm;height:10mm;font-weight:bold;text-align:center;"><br />Description</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;">
							<br /><strong>(a) </strong> Total
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;padding-top:2mm;">
							<strong>(b) </strong> Total ECI gross receipts
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;padding-top:2mm;">
							<strong>(c) </strong> Total non-ECI gross receipts
						</div>
					</div>
					<!-- Part 9, Section 1, Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:152mm;">
							Gross receipts for section 59A(e)
							<span class="sty1065K2DotLn">...........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceiptsSect59AeGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceiptsSect59AeGrp/TotalECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceiptsSect59AeGrp/TotalNonECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Section 1, Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:152mm;">
							Gross receipts for the first preceding year
							<span class="sty1065K2DotLn">........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts1stPrecYearGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts1stPrecYearGrp/TotalECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts1stPrecYearGrp/TotalNonECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Section 1, Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:152mm;">
							Gross receipts for the second preceding year
							<span class="sty1065K2DotLn">.......................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts2ndPrecYearGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts2ndPrecYearGrp/TotalECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts2ndPrecYearGrp/TotalNonECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Section 1, Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:152mm;">
							Gross receipts for the third preceding year
							<span class="sty1065K2DotLn">........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts3rdPrecYearGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts3rdPrecYearGrp/TotalECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/GrossReceipts3rdPrecYearGrp/TotalNonECIGrossReceiptsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Section 1, Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:152mm;">
							Amounts included in the denominator of the base erosion percentage as described in Regulations section 1.59A-2(e)(3)
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/TotBaseErosionPctSect159A2Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Section 2 -->
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 2 &mdash; Base Erosion Payments and Base Erosion Tax Benefits <span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:152mm;height:10mm;font-weight:bold;text-align:center;"><br />Description</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;">
							<br /><strong>(a) </strong> Total
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;padding-top:2mm;">
							<strong>(b) </strong> Total base erosion payments
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;padding-top:2mm;">
							<strong>(c) </strong> Total base erosion tax benefits
						</div>
					</div>
					<!-- Part 9, Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:152mm;">
							Purchase or creations of property rights for intangibles (patents, trademarks, etc.)
							<span class="sty1065K2DotLn">...........</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PrchsCrtnPropRightsIntngblGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PrchsCrtnPropRightsIntngblGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PrchsCrtnPropRightsIntngblGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:152mm;">
							Rents, royalties, and license fees
							<span class="sty1065K2DotLn">...........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/RentsRoyaltiesLicenseFeesGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/RentsRoyaltiesLicenseFeesGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/RentsRoyaltiesLicenseFeesGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 10a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">10a</div>
						<div class="styLNDesc" style="width:152mm;">
							Compensation/consideration paid for services <strong>not</strong> excepted by section 59A(d)(5)
							<span class="sty1065K2DotLn">............</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/CompPdSrvcNotExcSect59Ad5Grp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/CompPdSrvcNotExcSect59Ad5Grp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/CompPdSrvcNotExcSect59Ad5Grp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 10b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="padding-left:4.4mm;">b</div>
						<div class="styLNDesc" style="width:152mm;">
							Compensation/consideration paid for services excepted by section 59A(d)(5)
							<span class="sty1065K2DotLn">.............</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/TotCompPdSrvcExcSect59Ad5Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:152mm;">
							Interest expense
							<span class="sty1065K2DotLn">...............................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/BaseErosionInterestExpenseGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/BaseErosionInterestExpenseGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/BaseErosionInterestExpenseGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:152mm;">
							Payments for the purchase of tangible personal property
							<span class="sty1065K2DotLn">...................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PymtForPrchsTngblPrsnlPropGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PymtForPrchsTngblPrsnlPropGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PymtForPrchsTngblPrsnlPropGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 13 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:152mm;height:7mm;">
							Premiums and/or other considerations paid or accrued for insurance and reinsurance as covered by <br /> sections 59A(d)(3) and 59A(c)(2)(A)(iii)
							<span class="sty1065K2DotLn">.........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PremPaidOrAccrForInsSect59AGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PremPaidOrAccrForInsSect59AGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PremPaidOrAccrForInsSect59AGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 14a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">14a</div>
						<div class="styLNDesc" style="width:152mm;">
							Nonqualified derivative payments
							<span class="sty1065K2DotLn">..........................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/NonQlfyDerivativePaymentsGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/NonQlfyDerivativePaymentsGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/NonQlfyDerivativePaymentsGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 14b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="padding-left:4.4mm;">b</div>
						<div class="styLNDesc" style="width:152mm;">
							Qualified derivative payments excepted by section 59A(h)
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Part IX, Section 2, Line 14b - Filed pursuant to section 1.59A-6(b)(2) Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/QlfyDerivativePymtExcSect59Amt/@filedPursuantToSect159A6b2Cd"/>
							</xsl:call-template>
							<span class="sty1065K2DotLn">..................</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/QlfyDerivativePymtExcSect59Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Line 15 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width:152mm;">
							Payments reducing gross receipts made to surrogate foreign corporation
							<span class="sty1065K2DotLn">..............</span>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PymtRdcGroRcptsSrgtFrgnCorpGrp/TotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PymtRdcGroRcptsSrgtFrgnCorpGrp/TotalBaseErosionPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PymtRdcGroRcptsSrgtFrgnCorpGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 16 -->
					<xsl:for-each select="$FormData/SchK2PartnerInfoBEATGrp/BaseErosionOtherPaymentsGrp">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:152mm;height:auto;min-height:4mm;">
								Other payments &mdash; specify &#9658;
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherPaymentsDesc"/>
								</xsl:call-template>
								|
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="PartnerRelationshipDesc"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="padding-right:0.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalBaseErosionPaymentAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotBaseErosionTaxBenefitAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2PartnerInfoBEATGrp/BaseErosionOtherPaymentsGrp) &lt; 1">
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:152mm;height:auto;min-height:4mm;">
								Other payments &mdash; specify &#9658; &nbsp;
							</div>
							<div class="styLNAmountBox" style="padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox" style="padding-right:0.5mm;">&nbsp;</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 9, Line 17 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:152mm;height:10mm;">
							Base erosion tax benefits related to payments reported on lines 6 through 16, on which tax is imposed by <br />
							section 871 or 881, with respect to which tax has been withheld under section 1441 or 1442 at the 30% (0.30) <br />
							statutory withholding tax rate
							<span class="sty1065K2DotLn">...........................</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;height:10mm;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;height:10mm;">&nbsp;</div>
						<div class="styLNAmountBox" style="height:10mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/BaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 16 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">16</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part IX</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Partners' Information for Base Erosion and Anti-Abuse Tax (Section 59A) <span style="font-weight:normal;font-style:italic;">(continued)</span>
						</div>
					</div>
					<!-- Part 9, Section 2 -->
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 2 &mdash; Base Erosion Payments and Base Erosion Tax Benefits <span style="font-weight:normal;">(see instructions)<span style="font-style:italic;">(continued)</span></span>
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:152mm;height:10mm;font-weight:bold;text-align:center;"><br />Description</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;">
							<br /><strong>(a) </strong> Total
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;padding-top:2mm;">
							<strong>(b) </strong> Total base erosion payments
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;height:10mm;padding-top:2mm;">
							<strong>(c) </strong> Total base erosion tax benefits
						</div>
					</div>
					<!-- Part 9, Line 18 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:152mm;height:10mm;">
							Base erosion tax benefits reported on lines 6 through 16, on which tax is imposed by section 871 or 881, with <br />
							respect to which tax has been withheld under section 1441 or 1442 at reduced withholding rate pursuant to income <br />
							tax treaty. Multiply ratio of percentage withheld divided by 30% (0.30) times tax benefit. See instructions
							<span class="sty1065K2DotLn">....</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;height:10mm;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;height:10mm;">&nbsp;</div>
						<div class="styLNAmountBox" style="height:10mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/PortionBaseErosionTaxBnftAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 19 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:152mm;">
							<strong>Total base erosion tax benefits </strong> (subtract the sum of lines 17 and 18 from the sum of lines 8 through 16)
							<span class="sty1065K2DotLn">...</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/TotBaseErosionTaxBenefitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 9, Line 20 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Line 21 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 9, Line 22 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part X</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Partners' Character and Source of Income and Deductions
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 1 &mdash; Gross Income
						</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page13Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:52mm;">Description</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(a) </strong> Total
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(b) </strong> Partner determination
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="5" style="width:auto;border-right-width:0px;">Partnership Determination</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">ECI</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:auto;border-right-width:0px;">Non-ECI</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(c)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong> Foreign source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(e)</strong> U.S. source (FDAP)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(f)</strong> U.S. source (other)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Foreign source
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part 10, Line 1 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">1</td>
									<td class="styTableCellTextInherit">
										Ordinary business income (gross) 
										<span class="sty1065K2DotLn">.</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OrdinaryBusinessIncomeGrossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 2 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">2</td>
									<td class="styTableCellTextInherit">
										Gross rental real estate income
										<span class="sty1065K2DotLn">..</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/GrossRentalRealEstateIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 3 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">3</td>
									<td class="styTableCellTextInherit">
										Other gross rental income
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherGrossRentalIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 4 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">4</td>
									<td class="styTableCellTextInherit">
										Guaranteed payments for services
										<span class="sty1065K2DotLn">.</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/GuaranteedPaymentsForSrvcGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 5 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">5</td>
									<td class="styTableCellTextInherit">
										Guaranteed payments for use of capital
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/GuaranteedPymtForUseOfCapGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 6 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">6</td>
									<td class="styTableCellTextInherit">
										Interest income
										<span class="sty1065K2DotLn">.......</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/PrtshpDetermInterestIncomeGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 7 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">7</td>
									<td class="styTableCellTextInherit">
										Dividends
										<span class="sty1065K2DotLn">.........</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/DividendsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 8 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">8</td>
									<td class="styTableCellTextInherit">
										Dividend equivalents
										<span class="sty1065K2DotLn">.....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/DividendEquivalentsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 9 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">9</td>
									<td class="styTableCellTextInherit">
										Royalties and license fees
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/RoyaltiesAndLicenseFeesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 10 -->
								<tr>
									<td class="sty1065K2RowNumCell">10</td>
									<td class="styTableCellTextInherit">
										Net short-term capital gain
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3NetShortTermCapGainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 11 -->
								<tr>
									<td class="sty1065K2RowNumCell">11</td>
									<td class="styTableCellTextInherit">
										Net long-term capital gain
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3NetLongTermCapGainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 12 -->
								<tr>
									<td class="sty1065K2RowNumCell">12</td>
									<td class="styTableCellTextInherit">
										Collectibles (28%) gain
										<span class="sty1065K2DotLn">.....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3Collectible28PctGainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 13 -->
								<tr>
									<td class="sty1065K2RowNumCell">13</td>
									<td class="styTableCellTextInherit">
										Unrecaptured section 1250 gain
										<span class="sty1065K2DotLn">..</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/GroIncmUnrcptrSect1250GainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 14 -->
								<tr>
									<td class="sty1065K2RowNumCell">14</td>
									<td class="styTableCellTextInherit">
										Net section 1231 gain
										<span class="sty1065K2DotLn">.....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/NetSection1231GainGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 15 -->
								<tr>
									<td class="sty1065K2RowNumCell">15</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 16 -->
								<tr>
									<td class="sty1065K2RowNumCell">16</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 17 -->
								<tr>
									<td class="sty1065K2RowNumCell">17</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 18 -->
								<tr>
									<td class="sty1065K2RowNumCell">18</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 19 -->
								<tr>
									<td class="sty1065K2RowNumCell">19</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 20 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="vertical-align:top;">20</td>
									<td class="styTableCellTextInherit">
										Other income (loss) not included on lines 1 through 19
										<span class="sty1065K2DotLn">......</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherIncomeLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 21 -->
								<tr style="vertical-align:bottom;border-top:2px solid black;">
									<td class="sty1065K2RowNumCell" style="vertical-align:top;">21</td>
									<td class="styTableCellTextInherit">
										<strong>Gross income</strong> (sum of lines 1 <br /> through 20)
										<span class="sty1065K2DotLn" style="margin-right:-5px;">.......&#9658;</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/GrossIncomeTotalGrp"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 17 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">17</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part X</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Partners' Character and Source of Income and Deductions <span style="font-weight:normal;font-style:italic;">(continued)</span>
						</div>
					</div>
					<!-- Part 10, Section 2 -->
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 2 &mdash; Deductions, Losses, and Net Income
						</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page17Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:52mm;">Description</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(a) </strong> Total
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;font-weight:normal;">
										<strong>(b) </strong> Partner determination
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="5" style="width:auto;border-right-width:0px;">Partnership Determination</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">ECI</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:auto;border-right-width:0px;">Non-ECI</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(c)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong> Foreign source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(e)</strong> U.S. source (FDAP)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(f)</strong> U.S. source (other)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Foreign source
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part 10, Section 2, Line 1 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCellSD" style="vertical-align:top;">1</td>
									<td class="styTableCellTextInherit">
										Expenses related to ordinary business income (gross) 
										<span class="sty1065K2DotLn">.......</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/ExpnssRltdOrdnryBusIncmGroGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 2 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">2</td>
									<td class="styTableCellTextInherit">
										Research and experimental expenses
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/PrtrshpDetermREExpensesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 3 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">3</td>
									<td class="styTableCellTextInherit">
										Expenses from rental real estate
										<span class="sty1065K2DotLn">..</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/ExpnssFromRentalRealEstateGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 4 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">4</td>
									<td class="styTableCellTextInherit">
										Expenses from other rental activities
										<span class="sty1065K2DotLn">.</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/ExpnssFromOtherRentalActyGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 5 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">5</td>
									<td class="styTableCellTextInherit">
										Royalty and licensing expenses
										<span class="sty1065K2DotLn">..</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/RoyaltyAndLicensingExpensesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 6 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">6</td>
									<td class="styTableCellTextInherit">
										Section 179 deduction
										<span class="sty1065K2DotLn">.....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/PrtshpDetermSection179DedGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 7 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCellSD" style="vertical-align:top;">7</td>
									<td class="styTableCellTextInherit">
										Interest expense on U.S.-booked liabilities
										<span class="sty1065K2DotLn">.........</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/IntExpnsUSBookedLiabilitiesGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 8 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCellSD" style="vertical-align:top;">8</td>
									<td class="styTableCellTextInherit">
										Interest expense directly allocable <br /> under Regulations sections <br /> 1.882-5(a)(1)(ii)(B) and 1.861-10T
										<span class="sty1065K2DotLn">.</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/IntExpnsDrtAllcblUnderRegsGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 9 -->
								<tr>
									<td class="sty1065K2RowNumCellSD">9</td>
									<td class="styTableCellTextInherit">
										Other interest expenses
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3OtherInterestExpenseGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 10 -->
								<tr>
									<td class="sty1065K2RowNumCell">10</td>
									<td class="styTableCellTextInherit">
										Section 59(e)(2) expenditures
										<span class="sty1065K2DotLn">..</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/Sect59e2ExpendituresGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 11 -->
								<tr>
									<td class="sty1065K2RowNumCell">11</td>
									<td class="styTableCellTextInherit">
										Net short-term capital loss
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3NetShortTermCapLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 12 -->
								<tr>
									<td class="sty1065K2RowNumCell">12</td>
									<td class="styTableCellTextInherit">
										Net long-term capital loss
										<span class="sty1065K2DotLn">....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3NetLongTermCapLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 13 -->
								<tr>
									<td class="sty1065K2RowNumCell">13</td>
									<td class="styTableCellTextInherit">
										Collectibles loss
										<span class="sty1065K2DotLn">.......</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3CollectiblesLossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 14 -->
								<tr>
									<td class="sty1065K2RowNumCell">14</td>
									<td class="styTableCellTextInherit">
										Net section 1231 loss
										<span class="sty1065K2DotLn">.....</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3NetSection1231LossGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 15 -->
								<tr>
									<td class="sty1065K2RowNumCell" style="border-bottom-width:0px;">15</td>
									<td class="styTableCellTextInherit" style="border-bottom:none;">
										Other losses
										<span class="sty1065K2DotLn">........</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="/.."/>
									</xsl:call-template>
								</tr>
								<xsl:for-each select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3OtherLossesGrp">
									<tr style="vertical-align:bottom;">
										<td class="sty1065K2RowNumCell" style="border-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:if test="position() != last()"><xsl:attribute name="style">border-bottom-style:dashed;</xsl:attribute></xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherLossDesc"/>
											</xsl:call-template>
										</td>
										<xsl:call-template name="LinePartnerDetermination">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3OtherLossesGrp) &lt; 1">
									<tr style="vertical-align:bottom;">
										<td class="sty1065K2RowNumCell" style="border-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-bottom-style:dashed;">&nbsp;</td>
										<xsl:call-template name="LinePartnerDetermination">
											<xsl:with-param name="TargetNode" select="/.."/>
										</xsl:call-template>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3OtherLossesGrp) &lt; 2">
									<tr style="vertical-align:bottom;">
										<td class="sty1065K2RowNumCell" style="border-width:0px;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<xsl:call-template name="LinePartnerDetermination">
											<xsl:with-param name="TargetNode" select="/.."/>
										</xsl:call-template>
									</tr>
								</xsl:if>
								<!-- Part 10, Section 2, Line 16 -->
								<tr>
									<td class="sty1065K2RowNumCell">16</td>
									<td class="styTableCellTextInherit">
										Charitable contributions
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/CharitableContributionsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/CharitableContributionsGrp/ECIUSSourceAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Section 2, Line 17 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="vertical-align:top;">17</td>
									<td class="styTableCellTextInherit" style="">
										Other &#9658; 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherDeductionLineGrp[1]/OtherDeductionTypeDesc"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherDeductionLineGrp[1]"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Section 2, Line 18 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="vertical-align:top;">18</td>
									<td class="styTableCellTextInherit" style="">
										Other &#9658; 
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherDeductionLineGrp[2]/OtherDeductionTypeDesc"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherDeductionLineGrp[2]"/>
									</xsl:call-template>
								</tr>
								<xsl:for-each select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherDeductionLineGrp[position() &gt; 2]">
									<tr style="vertical-align:bottom;">
										<td class="sty1065K2RowNumCell" style="vertical-align:top;">&nbsp;</td>
										<td class="styTableCellTextInherit" style="">
											Other &#9658; 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherDeductionTypeDesc"/>
											</xsl:call-template>
										</td>
										<xsl:call-template name="LinePartnerDetermination">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
								<!-- Part 10, Line 19 -->
								<tr>
									<td class="sty1065K2RowNumCell">19</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 20 -->
								<tr>
									<td class="sty1065K2RowNumCell">20</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 21 -->
								<tr>
									<td class="sty1065K2RowNumCell">21</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 22 -->
								<tr>
									<td class="sty1065K2RowNumCell">22</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 23 -->
								<tr>
									<td class="sty1065K2RowNumCell">23</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
										<span class="sty1065K2DotLn">....</span>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Part 10, Line 24 -->
								<tr>
									<td class="sty1065K2RowNumCell" style="vertical-align:top;">24</td>
									<td class="styTableCellTextInherit">
										<strong>Total</strong> (sum of lines 1 through 23)
										<span class="sty1065K2DotLn">.</span>
									</td>
									<xsl:call-template name="LinePartnerDetermination">
										<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/TotDeductionsLossesNetIncmGrp"/>
									</xsl:call-template>
								</tr>
								<!-- Part 10, Line 25-->
								<tr style="vertical-align:bottom;border-top:2px solid black;">
									<td class="sty1065K2RowNumCell" style="vertical-align:top;">25</td>
									<td class="styTableCellTextInherit">
										<strong>Net income (loss)</strong> (line 21 (Section 1) minus line 24 (Section 2))
										<span class="sty1065K2DotLn" style="margin-right:-6px;">...&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/TotalNetIncomeLossAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 18 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">18</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part X</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Partners' Character and Source of Income and Deductions <span style="font-weight:normal;font-style:italic;">(continued)</span>
						</div>
					</div>
					<!-- Part 10, Section 3 -->
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 3 &mdash; Allocation and Apportionment Methods for Deductions
						</div>
					</div>
					<div class="styGenericDiv" style="width:129.7mm;border-right:1px solid black;">
						<!-- Part 10, Section 3, Line 1 -->
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:86mm;">Gross income</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
							<div class="styLNDesc" style="width:86mm;">
								Gross ECI
								<span class="sty1065K2DotLn">..................</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/GrossECIAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:86mm;">
								Worldwide gross income
								<span class="sty1065K2DotLn">.............</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/WorldwideGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part 10, Section 3, Line 2 -->
						<div class="styStdDiv" style="width:126mm;margin-top:4mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:86mm;">Assets</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
							<div class="styLNDesc" style="width:86mm;">
								Average U.S. assets (inside basis)
								<span class="sty1065K2DotLn">..........</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/AverageUSAssetsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:86mm;">
								Worldwide assets
								<span class="sty1065K2DotLn">...............</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/WorldwideAssetsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part 10, Section 3, Line 3 -->
						<div class="styStdDiv" style="width:126mm;margin-top:4mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:86mm;">Liabilities</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
							<div class="styLNDesc" style="width:86mm;">
								U.S.-booked liabilities of partnership
								<span class="sty1065K2DotLn">.........</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/USBookedLiabilitiesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:86mm;">
								Directly allocated partnership indebtedness
								<span class="sty1065K2DotLn">.......</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/DirectlyAllocPrtshpIndbtAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part 10, Section 3, Line 4 -->
						<div class="styStdDiv" style="width:126mm;margin-top:4mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:86mm;">Personnel</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
							<div class="styLNDesc" style="width:77mm;">
								Personnel of U.S. trade or business
								<span class="sty1065K2DotLn">........</span>
							</div>
							<div class="styLNAmountBox" style="width:41mm;border-left:none;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/PersonnelWithinUSCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="styLNDesc" style="width:77mm;">
								Worldwide personnel
								<span class="sty1065K2DotLn">............</span>
							</div>
							<div class="styLNAmountBox" style="width:41mm;border-left:none;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/WorldwidePersonnelCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part 10, Section 3, Line 5 -->
						<div class="styStdDiv" style="width:126mm;margin-top:4mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:86mm;">Gross receipts from sales or services by SIC code</div>
						</div>
						<div class="sty1065K2Halftable" style="" id="SICSales">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:8mm;border:none;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;border-top-width:1px;">
											(i) SIC code
										</th>
										<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;border-top-width:1px;">
											(ii) ECI
										</th>
										<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;border-right-width:0px;border-top-width:1px;">
											(iii) Worldwide
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3GrossRcptsBySICCodeGrp">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;"><xsl:number value="position()" format="a"/></td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ECIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="WorldwideGrossRcptsFromSlsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3GrossRcptsBySICCodeGrp) &lt; 1">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">a</td>
											<td class="styTableCellCtrInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/SchK2K3GrossRcptsBySICCodeGrp) &lt; 2">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">b</td>
											<td class="styTableCellCtrInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="styGenericDiv" style="width:126mm;">
						<!-- Part 10, Section 3, Line 6 -->
						<div class="styStdDiv" style="width:126mm;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:86mm;">Reserved for future use</div>
						</div>
						<div class="sty1065K2Halftable" style="" id="SICSales">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:8mm;border:none;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;border-top-width:1px;">
											(i) 
										</th>
										<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;border-top-width:1px;">
											(ii) 
										</th>
										<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;border-right-width:0px;border-top-width:1px;">
											(iii) 
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">a</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
									<tr>
										<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">b</td>
										<td class="styTableCellCtrInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- Part 10, Section 3, Line 7 -->
						<div class="styStdDiv" style="width:126mm;margin-top:4mm;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:86mm;">Other allocation and apportionment key</div>
						</div>
						<div class="sty1065K2Halftable" style="" id="OtherKey1">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:8mm;border:none;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:90mm;font-weight:normal;border-top-width:1px;">
											(i) Key/Factor
										</th>
										<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;border-top-width:1px;">
											(ii) Allocation
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherAllocAndApprtnKey1Grp">
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;padding-right:2.2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ApportionmentKeyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AllocationAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherAllocAndApprtnKey1Grp) &lt; 1">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">a</td>
											<td class="styTableCellCtrInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherAllocAndApprtnKey1Grp) &lt; 2">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">b</td>
											<td class="styTableCellCtrInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part 10, Section 3, Line 8 -->
						<div class="styStdDiv" style="width:126mm;margin-top:4mm;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styLNDesc" style="width:86mm;">Other allocation and apportionment key</div>
						</div>
						<div class="sty1065K2Halftable" style="" id="OtherKey2">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:8mm;border:none;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:90mm;font-weight:normal;border-top-width:1px;">
											(i) Key/Factor
										</th>
										<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;border-top-width:1px;">
											(ii) Allocation
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherAllocAndApprtnKey2Grp">
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;padding-right:2.2mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ApportionmentKeyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AllocationAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherAllocAndApprtnKey2Grp) &lt; 1">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">a</td>
											<td class="styTableCellCtrInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($FormData/SchK2FrgnPrtnrSrceIncmDedGrp/OtherAllocAndApprtnKey2Grp) &lt; 2">
										<tr>
											<td class="styTableCellTextInherit" style="font-weight:bold;border:none;padding-left:4mm;">b</td>
											<td class="styTableCellCtrInherit" style="">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<!-- Part 10, Section 4 -->
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:2px solid black;border-bottom:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 4 &mdash; Reserved for Future Use
						</div>
					</div>
					<!--<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:152mm;font-weight:bold;text-align:center;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;">
							<strong>(a) </strong> Reserved
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;">
							<strong>(b) </strong> Reserved
						</div>
						<div class="styLNAmountBoxNBB" style="text-align:center;">
							<strong>(c) </strong> Reserved
						</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<div class="styStdDivLS" style="">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:152mm;">
							Reserved for future use
							<span class="sty1065K2DotLn">..............................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;padding-right:0.5mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>-->
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
					<!-- Page 19 -->
					<div class="styStdDivLS">
						Schedule K-2 (Form 1065) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">19</span></span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:209.2mm;">
							Name of partnership <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:46mm;padding-left:1mm;font-weight:normal;">
							<strong>EIN</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part XI</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Section 871(m) Covered Partnerships
						</div>
					</div>
					<!-- Part 11, Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:240mm;height:auto;">
							Check the box if you are a publicly traded partnership as defined in section 7704(b) and you are a covered partnership 
							as defined in Regulations section 1.871-15(m)(1) or directly or indirectly hold an interest in a lower-tier partnerhip 
							that is a covered partnership
							<span class="sty1065K2DotLn" style="margin-right:-6px;">....................................&#9658;</span>
						</div>
						<div class="styGenericDiv" style="width:8mm;text-align:center;padding-top:12px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Covered Partnership Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CoveredPartnershipInd"/>
									<xsl:with-param name="BackupName">SK2P11CoveredPartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:100mm;">
							Specify the number of units of the partnership issued and outstanding &#9658;
						</div>
						<div class="styLNAmountBox" style="border-left:none;text-align:right;width:48mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PrtshpUnitsIssuedAndOutstdCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:200mm;">
							For each allocation period, provide the following information for the number of units specified on line 2.
						</div>
					</div>
					<xsl:variable name="sep11" select="($Print = $Separated) and (count($FormData/DividendsPerAllocPeriodGrp) &gt; 4)"/>
					<div class="sty1065K2TableContainerLSGap" id="Page19Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(i)</strong> Beginning of allocation period
									</th>
									<th class="styTableCellHeader" scope="col" style="width:49mm;font-weight:normal;">
										<strong>(ii)</strong> End of allocation period
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(iii)</strong> Dividends <br /> (enter four decimal places)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(iv)</strong> Dividend equivalents <br /> (enter four decimal places)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;border-right-width:0px;">
										<strong>(v)</strong> Total <br /> (enter four decimal places)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep11)">
									<xsl:for-each select="$FormData/DividendsPerAllocPeriodGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AllocationPeriodBegngDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AllocationPeriodEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DividendEquivalentsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep11 or (count($FormData/DividendsPerAllocPeriodGrp) &lt; 1)">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="">
											<xsl:if test="$sep11">See Addn'l Data</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep11 or (count($FormData/DividendsPerAllocPeriodGrp) &lt; 2)">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep11 or (count($FormData/DividendsPerAllocPeriodGrp) &lt; 3)">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep11 or (count($FormData/DividendsPerAllocPeriodGrp) &lt; 4)">
									<tr style="vertical-align:bottom;">
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part XII</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Reserved for Future Use
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-2 (Form 1065) 2021</span>
					</div>
<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowLandscape">
							<xsl:with-param name="Desc">Part IX, Section 2, Line 14b - Filed pursuant to section 1.59A-6(b)(2) Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SchK2PartnerInfoBEATGrp/QlfyDerivativePymtExcSect59Amt/@filedPursuantToSect159A6b2Cd"/>
						</xsl:call-template>
					</table>
					<!-- Line 1a separated table -->
					<xsl:if test="$sep2-1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 1 - Sales</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SalesGrossIncomeGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 2 - Gross income from performance of services</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GrossIncmPerfOfSrvcGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 3 - Gross rental real estate income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/GroRntlRealEstateIncmGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-4">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 4 - Other gross rental income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/OthGrossRentalIncomeGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-6">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 6 - Interest Income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3InterestIncomeGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-7">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 7 - Ordinary Dividends</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3OrdinaryDividendsGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-8">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 8 - Qualified Dividends</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/QualifiedDividendsGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-10">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 10 - Royalties and license fees</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/RoyaltiesLicenseFeesGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-11">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 11 - Net short-term capital gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/NetShortTermCapGainGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-12">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 12 - Net long-term capital gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/NetLongTermCapGainGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-13">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 13 - Collectibles (28%) gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/CollectiblesGainGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-14">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 14 - Unrecaptured section 1250 gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3UnrcptrSect1250GainGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-15">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 15 - Net section 1231 gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3NetSection1231GainGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-19">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 19 - Section 951(a) inclusions</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/Section951aInclusionsGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-20">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 20 - Other income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/SchK2K3OtherIncomeGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-24">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 24 - Total gross income (by country)</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/SchK2K3FrgnTaxCreditGroIncmGrp/TotGrossIncomeByCountryGrp"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-32">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 2, Line 32 - R&amp;E expenses</span>
						<table class="styDepTbl" style="font-size:7pt;width:auto;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left;width:34mm;">
										SIC code
									</th>
									<th class="styDepTblCell" style="text-align:left;width:34mm;">
										<strong>(f) </strong> Sourced by partner
									</th>
									<th class="styDepTblCell" style="text-align:left;width:34mm;">
										<strong>(g) </strong> Total
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3FrgnTaxCreditDedGrp/ResearchExperimentalExpnssGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;width:auto;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:auto;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:auto;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3-1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III, Section 1, Line 1 - R&amp;E Expenses Apportionment Factors</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styDepTblCell" scope="colgroup" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by partner
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___) <br /> (country code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3REExpnssApprtnFctrGrp/GrossReceiptsSICCodeGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
											<xsl:number format="A" value="position()"/>
										</td>
										<td class="styTableCellTextInherit" style="">
											SIC code 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SICCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="USSourceIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignBranchIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GeneralCategoryIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:variable name="cnode" select="."/>
											<xsl:choose>
												<xsl:when test="count($P3OthGrp[SICCd = $cnode/SICCd]) &gt; 0">See Page 5 (continued)</xsl:when>
												<xsl:otherwise>&nbsp;</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SourcedAtPartnerLvlIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3-4-1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III, Section 4, Line 1 -  Direct (section 901 or 903) foreign taxes </span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:81mm;" rowspan="2">
										Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> Type of tax
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="2">
										<strong>(b)</strong> Section 951A category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;border-right-width:0px;" colspan="3">
										<strong>(c)</strong> Foreign branch category income
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">Partner</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsGrp">
									<tr style="vertical-align:bottom;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
											<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:choose>
												<xsl:when test="OtherCategoryDescriptionCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:call-template name="LineForeignTaxSingleP1">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(d)</strong> Passive category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(e)</strong> General category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Other <br /> (category code 
										<span style="min-width:6mm;border-bottom:1px solid black;"/>)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Partner</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Partner</th>
								</tr>
							</thead>
							<tbody>
								<xsl:call-template name="LineForeignTaxP2Sep">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/SchK2K3ForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
								</xsl:call-template>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3-4-3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III, Section 4, Line 3 -  Foreign tax redeterminations </span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:81mm;" rowspan="2">
										Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> Type of tax
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="2">
										<strong>(b)</strong> Section 951A category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;border-right-width:0px;" colspan="3">
										<strong>(c)</strong> Foreign branch category income
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">Partner</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp">
									<tr style="vertical-align:bottom;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
											<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<span style="border-bottom:1px dashed black;width:100%;">
												<xsl:choose>
													<xsl:when test="OtherCategoryDescriptionCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
											<br />
											Related tax year &#9658; 
											<span style="border-bottom:1px dashed black;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedTaxYr"/>
												</xsl:call-template>
											</span>
											<br />
											Date tax paid &#9658; 
											<xsl:choose>
												<xsl:when test="count(TaxPaidDt) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
														<xsl:with-param name="Desc">Part III, Section 4, Line 3 - Dates tax paid</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:call-template name="LineForeignTaxSingleP1">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(d)</strong> Passive category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(e)</strong> General category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Other <br /> (category code 
										<span style="min-width:6mm;border-bottom:1px solid black;"/>)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Partner</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Partner</th>
								</tr>
							</thead>
							<tbody>
								<xsl:call-template name="LineForeignTaxP2Sep">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp"/>
								</xsl:call-template>
							</tbody>
						</table>
					</xsl:if>
					<xsl:for-each select="$FormData/SchK2K3ForeignTaxesGrp/FrgnTaxRedeterminationsGrp">
						<xsl:if test="count(TaxPaidDt) &gt; 1">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part III, Section 4, Line 3 - Row <xsl:value-of select="AlphaRowId"/> - Tax Paid Dates</span>
							<table class="styDepTbl" style="font-size:7pt;width:70mm;">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:center;">
											Tax Paid Date
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="TaxPaidDt">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:center;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="$sep5">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part V - Distributions From Foreign Corporations to Partnership</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:124mm;font-weight:normal;">
										<strong>(a)</strong> Name of distributing foreign corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Date of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Functional currency of distributing foreign corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:34mm;font-weight:normal;">
										<strong>(e)</strong> Amount of distribution in functional currency
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriPrtshpGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AlphaRowId"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="DistributingForeignCorpName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part V, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionFuncCurAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(f)</strong> Amount of E&amp;P distribution <br /> in functional currency
									</th>
									<th class="styDepTblCell" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(g)</strong> Spot rate (functional <br /> currency to U.S. dollars)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(h)</strong> Amount of distribution <br /> in U.S. dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(i)</strong> Amount of E&amp;P distribution <br /> in U.S. dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(j)</strong> Qualified foreign corporations
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(k)</strong> Reserved for <br /> future use
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriPrtshpGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AlphaRowId"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SpotRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EPDistributionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding-top:0.5mm;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="alt">Row <xsl:value-of select="AlphaRowId"/> Qualified Foreign Corporation Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QualifiedForeignCorporationInd"/>
													<xsl:with-param name="BackupName">SchK2K3FrgnCorpDistriPrtshpGrpQualifiedForeignCorporationInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;background-color:lightgrey;">&nbsp;</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part V Reference ID Number -->
					<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriPrtshpGrp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part V - Distributing foreign corporation - Row <xsl:value-of select="AlphaRowId"/></span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Part 6 repeating -->
					<xsl:for-each select="$FormData/SchK2K3PrtnrSect951a1InclsnGrp">
						<xsl:if test="($Print = $Separated) and (count(SchK2K3PrtshpCFCOwnrInfoGrp) &gt; 11)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part VI - Information on Partners' Section 951(a)(1) and Section 951A Inclusions</span><br />
							Separate Category: <strong><xsl:value-of select="SeparateCategoryCd"/></strong><br />
							U.S. Source: <strong><xsl:choose>
								<xsl:when test="USSourceIncomeInd">Yes</xsl:when>
								<xsl:otherwise>No</xsl:otherwise>
							</xsl:choose></strong>
							<table class="styDepTbl" style="font-size:7pt;width:256mm;">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styDepTblCell" scope="col" style="width:92mm;font-weight:normal;">
											<strong>(a)</strong> Name of CFC
										</th>
										<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
											<strong>(b)</strong> EIN or reference ID number
										</th>
										<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
											<strong>(c)</strong> Ending of CFC tax year
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
											<strong>(d)</strong> Partners' share of CFC items through their ownership in the partnership ("aggregate share")
										</th>
										<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(e)</strong> Aggregate share of subpart F income
										</th>
										<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(f)</strong> Aggregate section 951(a)(1)(B) inclusion
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
											<strong>(g)</strong> Tested income
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="SchK2K3PrtshpCFCOwnrInfoGrp">
										<tr style="vertical-align:top;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="CFCTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AggrgtShrCFCItemsPrtshpOwnrRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareSubpartFIncomeAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtSect951a1BInclsnAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table class="styDepTbl" style="font-size:7pt;width:256mm;">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(h)</strong> Tested loss
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(i)</strong> Aggregate share of tested income
										</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(j)</strong> Aggregate share of tested loss
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(k)</strong> Aggregate share of Qualified Business Asseet Investment (QBAI)
										</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(l)</strong> Aggregate share of the tested loss QBAI amount
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(m)</strong> Aggregate share of tested interest income
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(n)</strong> Aggregate share of tested interest expense
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="SchK2K3PrtshpCFCOwnrInfoGrp">
										<tr style="vertical-align:top;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
						<xsl:for-each select="SchK2K3PrtshpCFCOwnrInfoGrp">
							<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
								<br />
								<br />
								<span class="styRepeatingDataTitle">Part VI - CFC Reference IDs - Row <xsl:value-of select="AlphaRowId"/></span><br />
								Separate Category: <strong><xsl:value-of select="../SeparateCategoryCd"/></strong><br />
								U.S. Source: <strong><xsl:choose>
									<xsl:when test="../USSourceIncomeInd">Yes</xsl:when>
									<xsl:otherwise>No</xsl:otherwise>
								</xsl:choose></strong>
								<table class="styDepTbl" style="font-size:7pt">
									<thead class="styTableHead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" style="text-align:left">
												Reference ID number
											</th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="ForeignEntityIdentificationGrp">
											<tr>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
														<xsl:otherwise>styDepTblRow2</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-size:7pt;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</span>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:if test="$sep7">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part VII - Information to Complete Form 8621 - Section 1</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:102mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styDepTblCell" scope="col" style="width:90mm;font-weight:normal;">
										<strong>(c)</strong> Address of PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(d)</strong> Beginning of PFIC tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Ending of PFIC tax year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:choose>
												<xsl:when test="PFICOrQEFForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="PFICOrQEFForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="PFICOrQEFUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TaxYearBeginDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TaxYearEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Description of each <br /> class of PFIC shares
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC <br /> shares acquired <br /> during tax year <br /> (if applicable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(h)</strong> Total number of <br /> PFIC shares held at <br /> end of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(i)</strong> Total value of <br /> PFIC shares held at <br /> end of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(j)</strong> Election by partnership <br /> (enter code &mdash; see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(k)</strong> Check if foreign corporation has documented its eligiblity to be treated as a qualifying insurance corporation under section <br /> 1297(f)(2).
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(l)</strong> Check if PFIC has indicated its shares are "marketable stock" within the meaning of section 1296(e).
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(m)</strong> Check if PFIC is also a controlled foreign corporation (CFC) within the meaning of section 957.
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;border-right-width:0px;">
										<strong>(n)</strong> Check if PFIC meets the income test or asset test of section 1297(a) for the tax year.
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ClassOfShareCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SharesAcquiredDuringTYDt"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndCnt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PartnershipElectionCd"/>
											</xsl:call-template>
										</td>
										<xsl:variable name="pos" select="position()"/>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> Qualified Insurance Corporation Election Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QualifiedInsuranceCorpElectInd"/>
													<xsl:with-param name="BackupName">SepK2QualifiedInsuranceCorpElectInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC election to mark Marketable Stock Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ElectionToMarkToMrktPFICStkInd"/>
													<xsl:with-param name="BackupName">SepK2ElectionToMarkToMrktPFICStkInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC CFC under Section 957 Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PFICCFCUnderSect957Ind"/>
													<xsl:with-param name="BackupName">SepK2PFICCFCUnderSect957Ind<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC Income Asset Test Met Section 1297 A Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PFICIncmAstTestMetSect1297aInd"/>
													<xsl:with-param name="BackupName">SepK2PFICIncmAstTestMetSect1297aInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part VII - Information to Complete Form 8621 - Section 2</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:61mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Ordinary earnings
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> Net capital gain
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(e)</strong> Fair market value of PFIC shares at beginning of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(f)</strong> Fair market value of PFIC shares at end of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC shares were acquired
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(h)</strong> Amount of cash and fair market value of property distributed by PFIC during the current tax year (if applicable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(i)</strong> Dates of distribution
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part VII, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OrdinaryEarningsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetCapitalGainAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYBegngAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYEndAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SharesAcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICCashDistributedPropFMVAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(j)</strong> Total creditable foreign taxes attributable to distribution by PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(k)</strong> Total distributions from PFIC in preceding 3 tax years
									</th>
									<th class="styDepTblCell" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(l)</strong> Dates PFIC disposed of during tax year (if applicable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(m)</strong> Amount realized on disposition of PFIC shares
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(n)</strong> Tax basis of PFIC shares on dates of disposition
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;border-right-width:0px;">
										<strong>(o)</strong> Gain (loss) on disposition of PFIC shares
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotPFICCrdblFrgnTxsDistriAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotPFICDistriPrec3TaxYearsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DispositionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICSharesDisposRealizedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICSharesTaxBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICSharesDisposGainLossAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>					
					<!-- Part 7 Reference ID Number -->
					<xsl:for-each select="$FormData/SchK2K3InfoToComplete8621Grp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part VII - PFIC or QEF - Row <xsl:value-of select="position()"/></span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Part V Reference ID Number -->
					<xsl:for-each select="$FormData/SchK2K3PrtshpFrgnCorpIncmGrp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part VIII - CFC - Instance <xsl:value-of select="position()"/></span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="$sep11">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part XI - Section 871(m) Covered Partnerships - Allocation Periods</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(i)</strong> Beginning of allocation period
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(ii)</strong> End of allocation period
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(iii)</strong> Dividends <br /> (enter four decimal places)
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(iv)</strong> Dividend equivalents <br /> (enter four decimal places)
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;font-weight:normal;border-right-width:0px;">
										<strong>(v)</strong> Total <br /> (enter four decimal places)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DividendsPerAllocPeriodGrp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AllocationPeriodBegngDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AllocationPeriodEndDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendEquivalentsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
