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
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8990" />
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
				<meta name="Description" content="IRS Form 8990" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8990">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:31mm;height:19mm;border-right-width:2px;">
							Form <span class="styFN" style="font-size:18pt;">8990</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(November 2018)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Limitation on Business Interest Expense <br />
							Under Section 163(j)</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to your tax return.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8990</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
						</div>
					</div>
					<xsl:for-each select="$FormData//*">
						<div class="styStdDiv" style="margin-bottom:1mm;">
							<div style="width:50mm;text-align:left;float:left;height:4mm;">
								<xsl:value-of select="local-name(.)"/>[<xsl:value-of select="count(preceding-sibling::*[name() = name(current())]) + 1"/>]
							</div>
							<div style="min-height:4mm;text-align:left;width:136mm;float:left;">
								<xsl:value-of select="text()"/>
							</div>
						</div>
					</xsl:for-each>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
