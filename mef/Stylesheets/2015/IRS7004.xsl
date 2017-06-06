<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2010 rel. 2 (http://www.altova.com) by PJ Saini (Internal Revenue Service) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS7004Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS7004"/>
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
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="Form IRS7004"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS7004Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form7004">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form7004 -->
					<div class="styTBB" style="width:187mm;height: 19mm">
						<div class="styFNBox" style="height:19mm; width:33mm;
						font-size: 9pt;padding-top:0mm;border-right-width:2px">Form <span class="styFormNumber">7004</span>
							
							<span class="styAgency" style="font-weight:bold; ">
     		(Rev. December 2012)
							<span style="padding-left:2mm">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
							
								<span class="styAgency">Department of the Treasury
							
								Internal Revenue Service</span>
						</span>	
						</div>
								<div class="styFTBox" style="width:120mm;">
							<div class="styFMT" style=";padding-top:3mm;font-size:9pt">Application for Automatic Extenstion of Time To File</div>
							<div class="styFMT" style="font-size:9pt">Certain Business Income Tax, Information, and Other Returns</div>
							<div class="styFBT" style=" font-size: 7pt;">
	</div><br/>
	<img src="{$ImagePath}/4562_Bullet_Lg.gif" alt="bullet"/>	<span  style="font-size:7pt;padding-top:1mm"	> <b>File a separate application for each return.</b></span>
	<br/>
	<img src="{$ImagePath}/4562_Bullet_Lg.gif" alt="bullet"/>
								<span  style="font-size:6.5pt"	>
								<b>Information about Form 7004 and its separate instructions is at</b></span> 
							<a href="http://www.irs.gov/form7004">
             <i>www.irs.gov/form7004.</i></a>
			</div>
						<div class="styTYBox" style="width:31mm; height: 19mm;border-left-width:2px">
							<div style="padding-top:7mm; font-size:7pt;font-weight:bold;padding-left:2mm">OMB No. 1545-0233</div>
						</div>
					</div>
					<!--  End title of Form  -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styIRS7004TextBox" style="font-size:12pt; width:17mm; height:31mm;border-bottom-width:0px">
							<span class="styBoldText">
								<br/>								
   Print<br/>
   or<br/>
   Type
   </span>
</div>
	<!-- name   -->
	<div class="styIRS7004TextBox" style="font-size:7pt;width:114mm;height:10mm;     padding-left:2mm;border-bottom-width:0px;">Name
	<br/>
	<div style="padding-left:5mm; ">
							<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<!-- end name -->
						</div>
						<!-- Taxpayer identification number -->
						<div class="styIRS7004TextBox" style="font-size:7pt;width:55mm;height:10mm;     padding-left:2mm;border-right-width:0px;border-bottom-width:0px;">
							<span class="styBoldText">Identifying number</span>
							<div style="text-align:left; width:100%; padding-top:4mm; font-weight:normal">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- end Taxpayer identification number -->
						<!-- Number, street, and room or suite no. if P.O. box -->
						<div class="styIRS7004TextBox" style="font-size:7pt;width:169mm;height:10mm;  border-top-width:1px;border-right-width:0px;padding-left:2mm">
 	Number, street, and room or suite no. (If P.O. box,
 	 see instructions.)<br/>
   	<div style="padding-left:5mm; line-height:110%">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- end Number, street, and room or suite no. if P.O. box -->
						<!-- City or town -->
						<div class="styIRS7004TextBox" style="font-size:7pt;width:169mm;height:10mm; 
						border-right-width: 0px;border-bottom-width: 0px;padding-left:2mm">
			City, town, state, and ZIP code (If a foreign address, enter city, 
			province or state, and country (follow the country’s practice for entering
 postal code)).<br/>
 	    <div style="padding-left:2mm">
 	    <xsl:if test="USAddress">
 	    <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template></xsl:if>
								<span style="width=1mm"/>
								<xsl:if test="USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template></xsl:if>
								<span style="width=1mm"/>
								<xsl:if test="USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template></xsl:if>
								<span style="width=1mm"/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<br/>
								<div style="padding-left:3mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="MainForm">true</xsl:with-param>
								</xsl:call-template>
							</div></div>
						</div>
					</div>
					<div class="styBB" style="font-size:8pt; width:187mm; height:4mm; border-bottom-width: 0px;border-top-width: 1px;">
						<span class="styBoldText">Note. 
 <span class="styItalicText" style="font-size:6.5pt;">File request for extension by the due date
of the return for which the extension is granted. See
instructions before completing this form.</span>
						</span>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Part I</div>
						<div class="styPartDesc" style="width:164mm;">Automatic 5-Month Extension
 </div>
					</div>
					<!-- END Part I Title -->
					<!-- line 1a -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:5mm;">1a</div>
						<div class="styLNDesc" style="width:171mm;height:5mm;">
							<span style="float:left;font-size:8pt;">Enter the form code for the return 
							that this application is for (see below)
</span>
	<span class="styDotLn">................</span>
						</div>
						<div class="styFNBox" style="border-right-width: 1px;border-left-width: 1px;border-bottom:0;
						border-top: 0;height:5mm;width:8mm;padding-left:2mm;padding-top:1.5mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Auto5MonthExtensionReturnCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end line 1 -->
					<!-- Table Header Line1 -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:08mm;width:80mm;border-top-width: 01px;border-left-width: 0px;
						border-right-width: 0px;border-bottom-width:1px;padding-top:.5mm;">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;">Application<br/> Is For:</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:13mm;border-top-width:1px;border-left-width:1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;"> Form<br/>Code</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:80mm;border-top-width: 1px;border-left-width: 1px;
						border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;">Application<br/> Is For:</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:14mm;border-top-width:1px;border-left-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;"> Form<br/>Code</span>
						</div>
					</div>
					<!-- end Table Heder line1 -->
					<!--  ************************************************************************** -->
					<!-- Table line 1 -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top: 0;border-left:0;border-right:0;
						border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1065</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">09</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;background-color:lightgrey;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1041
			        <span style="font-size:7.5pt;">
			(estate other than a bankruptcy estate)
			</span>
							</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;background-color:lightgrey;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">04</span>
						</div>
					</div>
					<!-- end table line1 -->
					<!-- Table line 2 -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;
						   border-left-width:0px;border-right-width:0px;border-bottom-width: 0px;padding-top:.5mm;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8804</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 0px;padding-top:.5mm;padding-left:1mm;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">31</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 0px;border-bottom-width: 0px;padding-top:.5mm;padding-left:2mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1041 (trust)</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-bottom-width: 0px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">05</span>
						</div>
					</div>
					<!-- end Table line2 -->
					<!--  ************************************************************************** -->
					<!-- BEGIN Part II Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Part II</div>
						<div class="styPartDesc" style="width:164mm;">Automatic 6-Month Extension
 </div>
					</div>
					<!-- END Part II Title -->
					<!-- line 1b -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">b</div>
						<div class="styLNDesc" style="width:171mm;height:4mm;">
							<span style="float:left;font-size:8pt;">Enter the form code for the return that this application 
	    	is for (see below)
        </span>
	<span class="styDotLn">................</span>
						</div>
						<div class="styFNBox" style="border-right-width:1px;border-left-width:1px;border-bottom:0;border-top:0;
						height: 5mm;width:4mm;width:8mm;padding-left:2mm;padding-top:1.5mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Auto6MonthExtensionReturnCd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end line 1b -->
					<!-- line 1T -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:8mm;width:80mm;border-top-width: 01px;border-left-width: 0px;
						border-right-width: 0px;border-bottom-width:1px;padding-top:.5mm;">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;">Application<br/> Is For:</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:13mm;border-top-width: 1px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;"> Form<br/>Code</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:80mm;border-top-width: 1px;border-left-width: 1px;
						border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;">Application<br/> Is For:</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:14mm;border-top-width:1px;border-left-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 8pt;font-weight:bold;text-align:left;float:left; clear: none;"> Form<br/>Code</span>
						</div>
					</div>
					<!-- end line1T -->
					<!--  ************************************************************************** -->
					<!-- Table line 1 -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width:0px;
						border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 706-GS(D)</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">01</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;background-color:lightgrey;">
							<span style="font-size: 9pt;text-align:left;    float:left; clear: none;">Form 1120-ND (section 4951 taxes)</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;background-color:lightgrey;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;    padding-right:4mm;clear: none;">20</span>
						</div>
					</div>
					<!-- end table line 1 -->
					<!-- Table line 2 -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width:0px;
						border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 706-GS(T)</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">02</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;">
							<span style="font-size: 9pt;text-align:left;    float:left; clear: none;">Form 1120-PC</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;
						padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">21</span>
						</div>
					</div>
					<!-- end Table line 2 -->
					<!-- Table line 3 -->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1041 (bankruptcy estate only)</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">03</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-POL</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">22</span>
						</div>
					</div>
					<!-- end Table line 3 -->
					<!-- Table line 4-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width:0px;
						border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1041-N</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">06</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-REIT</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;
						padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">23</span>
						</div>
					</div>
					<!-- end Table line 4-->
					<!-- Table line 5-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width:0px;
						border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1041-QFT</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">07</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;
						border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-RIC</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;
						border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">24</span>
						</div>
					</div>
					<!-- end Table line 5-->
					<!-- Table line 6-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1042</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">08</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120S</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">25</span>
						</div>
					</div>
					<!-- end Table line 6-->
					<!-- Table line 7-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1065-B</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">10</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-SF</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">26</span>
						</div>
					</div>
					<!-- end Table line 7-->
					<!-- Table line 8-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1066</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">11</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 3520-A</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">27</span>
						</div>
					</div>
					<!-- end Table line 8-->
					<!-- Table line 9-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">12</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8612</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">28</span>
						</div>
					</div>
					<!-- end Table line 9-->
					<!-- Table line 10-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-C</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">34</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8613</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">29</span>
						</div>
					</div>
					<!-- end Table line 10 -->
					<!-- Table line 11-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-F</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">15</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8725</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">30</span>
						</div>
					</div>
					<!-- end Table line 11-->
					<!-- Table line 12-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-FSC</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">16</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8831</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">32</span>
						</div>
					</div>
					<!-- end Table line 12-->
					<!-- Table line 13-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-H</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">17</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8876</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">33</span>
						</div>
					</div>
					<!-- end Table line 13-->
					<!-- Table line 14-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-L</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">18</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8924</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">35</span>
						</div>
					</div>
					<!-- end Table line 14-->
					<!-- Table line 15-->
					<div style="width:187mm;clear:both;">
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;     ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;padding-top:.5mm;">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 1120-ND</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">19</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 0px;border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;padding-left:2mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:left;float:left; clear: none;">Form 8928</span>
						</div>
						<div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;padding-left:1mm;;background-color:lightgrey">
							<span style="font-size: 9pt;text-align:center;font-weight:bold;padding-right:4mm;clear: none;">36</span>
						</div>
					</div>
					<!-- end Table line 15-->
					<!-- line 2 -->
					<div style="width:187mm">
						<span class="styLNLeftNumBox" style="height:4mm;">2</span>
						<span class="styLNDesc" style="width:168mm;height:4mm;">
							<span style="float:left;font-size:8pt;">
        If the organization is a foreign corporation that does not have an office 
        or place of business in the United
        </span>
	<span style="width:173mm;font-size:8pt;">
	<span style="float:left;">
States, check here  	
</span>
	<span style="float:right;">
	<span class="styDotLn">.............................</span>
									<span style="width: 3mm;"/>
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
									<span style="width: 4mm;"/>
									<input type="checkbox" class="styCkbox" name="OrgHasNoOfficeInUSInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OrgHasNoOfficeInUSInd"/>
											<xsl:with-param name="BackupName">FrgnCorpDoesNotHaveOfficeInUS</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OrgHasNoOfficeInUSInd"/>
											<xsl:with-param name="BackupName">FrgnCorpDoesNotHaveOfficeInUS</xsl:with-param>
										</xsl:call-template>
									</label>
								</span>
							</span>
						</span>
					</div>
					<!-- end line2 -->
					<br/><br/>	
					<!-- line 3 -->
					<div style="width:187mm;height:4mm">
						<span class="styLNLeftNumBox" style="height:4mm;">3</span>
						<span class="styLNDesc" style="width:168mm;height:4mm;">
							<span style="float:left;font-size:8pt;">
		If the organization is a corporation and is the common parent of a group
		 that intends to file a consolidated</span>
							<span style="width:173mm;font-size:8pt;">
								<span style="float:left;">
 return, check here
</span>
								<span style="float:right;">
									<span class="styDotLn">.............................</span>
									<span style="width: 3mm;"/>
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
									<span style="width: 4mm;"/>
									<input type="checkbox" class="styCkbox" name="OrgConsolidatedRetToBeFiledInd">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OrgConsolidatedRetToBeFiledInd"/>
											<xsl:with-param name="BackupName">CorpForConsolidatedGroup</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OrgConsolidatedRetToBeFiledInd"/>
											<xsl:with-param name="BackupName">CorpForConsolidatedGroup</xsl:with-param>
										</xsl:call-template>
									</label>
								</span>
							</span>
						</span>
					</div>
					<!-- end line3 -->	<br/><br/>
					<!-- note line 3 -->
					<div style="width:187mm;height:5mm">
						<div class="styLNLeftNumBox" style="height:5mm;"/>
						<div class="styLNDesc" style="width:168mm;height:5mm;">
							<span style="float:left;font-size:8pt;">
	If checked, attach a statement, listing the name, address, and Employer
	Identification Number (EIN) for each member covered by this application.
    <span style="padding-left:2mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OrgConsolidatedRetToBeFiledInd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- end notes line3 -->	<br/><br/>
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Part III</div>
						<div class="styPartDesc" style="width:164mm;">All Filers Must Complete This Part
    </div>
					</div>
					<!-- END Part III Title -->
					<!-- line 4 -->
					<div style="width:187mm;height:5mm">
						<span class="styLNLeftNumBox" style="height:5mm;">4</span>
						<span class="styLNDesc" style="width:168mm;height:5mm;">
							<span style="float:left;font-size:8pt;">
		If the organization is a corporation or partnership
		 that qualifies under Regulations section 1.6081-5, check </span>
							<span style="width:173mm;font-size:8pt;">
								<span style="float:left;">
here
</span>
								<span style="float:right;">
									<span class="styDotLn">..................................</span>
									<span style="width: 3mm;"/>
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
									<span style="width: 4mm;"/>
									<input type="checkbox" class="styCkbox" name="FilingUnderRegsSect160815Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FilingUnderRegsSect160815Ind"/>
											<xsl:with-param name="BackupName">FilingUnderRegSect160815</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FilingUnderRegsSect160815Ind"/>
											<xsl:with-param name="BackupName">FilingUnderRegSect160815</xsl:with-param>
										</xsl:call-template>
									</label>
								</span>
							</span>
						</span>
					</div>
					<!-- end line4 -->	<br/><br/>
					<!-- line 5a -->
					<div style="width:187mm;height:4mm">
						<div class="styLNLeftNumBox" style="height:4mm;">5a
        </div>
						<div class="styGenericDiv" style="font-size:8pt;">
The application is for calendar year 
<span style="width: 10mm;border-bottom:1 solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
							</span>, or other tax year beginning
        <span style="width: 18mm;border-bottom:1 solid black;">
								<!-- No need to send the parameters -->
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
							</span>, and ending 
        <span style="width: 18mm;border-bottom:1 solid black;">
								<!-- No need to send the parameters -->
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>
						</div>
					</div>
					<!-- end line 5a -->
							<!-- line 5b -->
					<div style="width:187mm;height:5mm;padding-left:3mm;font-weight:bold;">
     b<span style="font-size:8pt;font-weight:bold;padding-left:3mm">Short tax year.</span>
						<span style="font-weight:normal;font-size:8pt;padding-left:1mm">  If this tax year is less than 12 months, check the reason:</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;font-size:8pt;">
						<span class="styLNLeftNumBox" style="height:4mm;"/>
						<span class="styLNDesc" style="width:175mm;height:4mm;">
							<input type="checkbox" class="styCkbox" name="InitialReturnInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
									<xsl:with-param name="BackupName">InitialReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
									<xsl:with-param name="BackupName">InitialReturn</xsl:with-param>
								</xsl:call-template>
								<span style="width: 1mm;"/>
							Initial return
						</label>
							<span style="width: 4mm;"/>
							<input type="checkbox" class="styCkbox" name="FinalReturnInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturn</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
									<xsl:with-param name="BackupName">FinalReturn</xsl:with-param>
								</xsl:call-template>
								<span style="width: 2mm;"/>
						Final return
						</label>
							<span style="width: 6mm;"/>
							<input type="checkbox" class="styCkbox" name="AccountingPeriodChangeInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AccountingPeriodChangeInd"/>
									<xsl:with-param name="BackupName">ChangeInAccountingPeriod</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AccountingPeriodChangeInd"/>
									<xsl:with-param name="BackupName">ChangeInAccountingPeriod</xsl:with-param>
								</xsl:call-template>
								<span style="width: 1mm;"/>
						Change in accounting period
						</label>
							<span style="width: 6mm;"/>
							<input type="checkbox" class="styCkbox" name="ConsolidatedRetToBeFiledInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ConsolidatedRetToBeFiledInd"/>
									<xsl:with-param name="BackupName">ConsolidatedReturnToBeFiled</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ConsolidatedRetToBeFiledInd"/>
									<xsl:with-param name="BackupName">ConsolidatedReturnToBeFiled</xsl:with-param>
								</xsl:call-template>
								<span style="width: 1mm;"/>
						Consolidated return to be filed
						</label>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;font-size:8pt;">
						<span class="styLNLeftNumBox" style="height:4mm;"/>
						<span class="styLNDesc" style="width:175mm;height:4mm;">
							<input type="checkbox" class="styCkbox" name="OtherInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">OtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">OtherInd</xsl:with-param>
								</xsl:call-template>
								<span style="width: 2mm;"/>
						Other (see instructions-attach explanation)
							<span style="width: 2mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
								</xsl:call-template>
							</label>
						</span>
					</div>
					<!-- end line 5b -->
						<!-- Start line 6 -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">6
 </div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left;font-weight:normal;font-size:8pt;">
 Tentative total tax</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentativeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End line 6 -->
					<!-- Start line 7-->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">7
 </div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left;font-weight:normal;font-size:8pt;">
 	<b>Total</b> payments and credits (see instructions)</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox"  style="height:5mm;">7</div>
						<div class="styLNAmountBox" style="height:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstTaxPymtAndRfdblCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End line 7 -->
				<!-- Start line 8-->
					<div class="styTBB" style="width:187mm">
						<div class="styLNLeftNumBox" style="height:4mm;">8
 </div>
						<div class="styLNDesc" style="width:138.75mm;height:4mm;">
							<span style="float:left;font-weight:normal;font-size:8pt;">
 					<b>Balance due. </b> Subtract line 7 from line 6 (see instructions)</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
	<div class="styLNRightNumBox"  style="height:4.5mm;border-bottom-width:0pt">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0pt">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</div><br/>
					<!-- End line 8 -->
					<!-- form end -->
					<div style="width:187mm;clear:both;">
						<div style="width:120mm;font-weight:bold;" class="styGenericDiv">For Privacy Act and Paperwork Reduction Act Notice, see separate Instructions.</div>
						<div style="width:25mm;text-align:center;" class="styGenericDiv">Cat. No. 13804A</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">7004</span> (Rev. 12-2012)</div>
					</div>
					<!-- br class="pageEnd"/ -->
					<!--<div class="pageEnd" style="width:187mm"/>-->
					<!-- Begininning of write-in data -->
					<p style="page-break-before:always"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Backup Withholding Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstTaxPymtAndRfdblCreditAmt/@backupWithholdingTypeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 7 - Backup Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstTaxPymtAndRfdblCreditAmt/@backupWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Begin separated repeating Data table -->
					<xsl:if test="$Print = $Separated and count($FormData/AffiliatedGroupInfo) &gt; 6">
						<span class="styRepeatingDataTitle">Form 7004, Line 2 - Members of an affiliated group of corporations filing a consolidated return (consolidated group):</span>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
							<thead class="styTableThead" style="border-color:black">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="font-weight:bold;width:142mm;height:4mm">Name and address of each member of the affiliated group</th>
									<th class="styDepTblCell" style="font-weight:bold;width:45mm;height:4mm;border-right-width: 0px">Employer identification number</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody style="border-color:black; vertical-align:bottom;border-bottom-width:0px;">
								<xsl:for-each select="$FormData/AffiliatedGroupInfo">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align: left; width:142mm;height:8mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AffiliatedGroupName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(AffiliatedGroupName/BusinessNameLine2Txt)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AffiliatedGroupName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="AffiliatedGroupUSAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="AffiliatedGroupUSAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="AffiliatedGroupFrgnAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="text-align: center; width:45mm;">
											<xsl:choose>
												<xsl:when test="AffiliatedGroupEIN">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="AffiliatedGroupEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<div style="text-align:left">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AffiliatedGroupNoEINReason"/>
														</xsl:call-template>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="AddRows7004">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="StockCount"/>
		<xsl:param name="IsSeparated">no</xsl:param>
		<xsl:if test="$StockCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="height:8mm">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="height:8mm;border-right-width: 0px">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRows7004">
				<xsl:with-param name="StockCount" select="$StockCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
