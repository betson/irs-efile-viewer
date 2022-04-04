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
	<xsl:include href="IRS1040ScheduleLEPStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleLEP" />
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
				<meta name="Description" content="IRS Form 1040 Schedule LEP" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleLEPStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040ScheduleLEP">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:17.5mm;">
							<span style="font-size:10pt;font-weight:bold;">Schedule LEP</span> <br />
							<span style="font-family:Arial;font-size:8pt;font-weight:bold;">(Form 1040)</span>
							<br />
							(December 2021)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:126mm;height:17.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:0.5mm;">Request for Change in Language Preference</span><br />
							<span style="font-weight:bold;padding-top:4mm;">
								&#9658;Attach to Form 1040, 1040-SR, 1040-NR, 1040-PR, or 1040-SS.
								<br />
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/ScheduleLEP</span>
								for the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:17.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;padding-top:2mm;padding-bottom:2mm;">OMB No. 1545-0074</div>
							<div style="margin-left:0mm;text-align:left;font-size:7pt;padding-top:1mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">77A</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:120mm;height:7.5mm">
							Name of person making request (as shown on tax return)<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:67mm;height:7.5mm;padding-left:1mm;font-weight:normal;">
							<span style="font-weight:bold;">Social security number of person making request</span> <br />
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/SSN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv" style="margin-top:4mm;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:179mm;height:auto;">
							I would prefer to receive written communications (see instructions) from the IRS in the following language, when available. <br />
							Check only one.
						</div>
					</div>
					<div class="styStdDiv" style="height:auto;margin-bottom:4mm;margin-top:4mm;font-size:8pt;">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
						</xsl:call-template>
						<div class="styGenericDiv" style="width:85mm;padding-left:8mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '000' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd000</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '000' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd000</xsl:with-param>
								</xsl:call-template>000 English</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '001' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd001</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '001' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd001</xsl:with-param>
								</xsl:call-template>001 Spanish (Español)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '002' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd002</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '002' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd002</xsl:with-param>
								</xsl:call-template>002 Korean (한국어)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '003' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd003</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '003' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd003</xsl:with-param>
								</xsl:call-template>003 Vietnamese (Tiếng Việt)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '004' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd004</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '004' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd004</xsl:with-param>
								</xsl:call-template>004 Russian (Русский)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '005' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd005</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '005' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd005</xsl:with-param>
								</xsl:call-template>005 Arabic (العربية)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '006' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd006</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '006' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd006</xsl:with-param>
								</xsl:call-template>006 Haitian Creole (Kreyòl Ayisyen)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '007' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd007</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '007' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd007</xsl:with-param>
								</xsl:call-template>007 Tagalog (Tagalog)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '008' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd008</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '008' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd008</xsl:with-param>
								</xsl:call-template>008 Portuguese (Português)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '009' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd009</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '009' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd009</xsl:with-param>
								</xsl:call-template>009 Polish (Polski)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '010' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd010</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '010' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd010</xsl:with-param>
								</xsl:call-template>010 Farsi (فارسی)</label>
							</span>
						</div>
						<div class="styGenericDiv" style="width:90mm;padding-left:8mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '011' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd011</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '011' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd011</xsl:with-param>
								</xsl:call-template>011 French (Français)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '012' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd012</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '012' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd012</xsl:with-param>
								</xsl:call-template>012 Japanese (日本語)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '013' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd013</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '013' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd013</xsl:with-param>
								</xsl:call-template>013 Gujarati (ગુજરાતી)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '014' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd014</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '014' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd014</xsl:with-param>
								</xsl:call-template>014 Punjabi (ਪੰਜਾਬੀ)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '015' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd015</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '015' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd015</xsl:with-param>
								</xsl:call-template>015 Khmer (ខ្មែរ)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '016' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd016</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '016' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd016</xsl:with-param>
								</xsl:call-template>016 Urdu (اردو)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '017' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd017</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '017' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd017</xsl:with-param>
								</xsl:call-template>017 Bengali (বাংলা)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '018' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd018</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '018' "/>
									<xsl:with-param name="BackupName">F9000AlternativeMediaCd018</xsl:with-param>
								</xsl:call-template>018 Italian (Italiano)</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '019' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd019</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '019' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd019</xsl:with-param>
								</xsl:call-template>019 Chinese (Traditional) (中文(繁體))</label>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:12px;margin-bottom:4px;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '020' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd020</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="vertical-align:top;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/LanguagePreferenceCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select=" '020' "/>
									<xsl:with-param name="BackupName">F9000LanguagePreferenceCd020</xsl:with-param>
								</xsl:call-template>020 Chinese (Simplified) (中文(简体))</label>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:13mm;">Cat. No. 74174D</span>
						<span style="float:right;font-weight:bold;font-family:Arial;">Schedule LEP (Form 1040) (12-2021)</span>
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
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
