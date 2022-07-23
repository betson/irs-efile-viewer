<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Andrew Werner on 8/18/2011 -->
<!-- Last Modified by Eugenia McDonald on 01/06/2020 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040ScheduleSEStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040ScheduleSEData" select="$RtnDoc/IRS1040ScheduleSE"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040ScheduleSEData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching  -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040 Schedule SE"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040ScheduleSEStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1040 Schedule SE" style="font-size:7pt;">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px">
						<div class="styFNBox" style="width:29mm;height:17.3mm;">
							<div style="height:10mm;font-size:12px;font-weight:bold;">
								SCHEDULE SE<br/>
								(Form 1040 or 1040-SR)
								<span style="width:1mm"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData"/>
								</xsl:call-template>
						</div>
							<div style="height:4mm;padding-top:.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service <span style="width:.5mm"/> (99)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:17.5mm;">
							<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
								Self-Employment Tax
							</div>
							<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2mm; font-size: 6.5pt;">
								<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
								    Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/ScheduleSE" title="Link to IRS.gov"><i>www.irs.gov/ScheduleSE</i></a> for instructions and the latest information.<br/>
							</div>
							<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 1.5mm; font-size: 6.5pt;">	
								<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
								    Attach to Form 1040, Form 1040-SR, or Form 1040NR. 																
							</div>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
							<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="stytycolor">19</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">17</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;border-top-width:1px">
						<div class="styBB" style="width: 109mm; height: 7mm; border-bottom-width: 0px;">
							<div class="styNameBox" style="width: 109mm; height: 3mm; padding-top: 0.5mm; font-size: 6.5pt; font-weight: normal;">
								Name of person with <b>self-employment</b> income (as shown on Form 1040, Form 1040-SR, <br/>or Form 1040NR)<br/>
							</div>
							<div class="styNameBox" style="width: 109mm; height: 4mm; padding-top:.3mm; padding-left:25mm;font-size: 7pt;">
								<xsl:choose>
									<xsl:when test="normalize-space($Form1040ScheduleSEData/PersonNm) !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PersonNm"/>
										</xsl:call-template>	
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
										</xsl:call-template>	
									</xsl:otherwise>		
								</xsl:choose>
							</div>
						</div>
						<div class="styEINBox" style="width: 46mm; height: 7mm; text-align:center;padding-top:.5mm; font-size:7pt; font-weight: normal;
						    border-right-width: 1px; border-bottom-width: 0px;">
							Social security number of person<br/> with <b>self-employment </b>income
							<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
						</div>
						<div class="styLNAmountBox" style="width: 29mm; height: 7mm; text-align: center; padding-top:3.5mm; border-bottom-width: 0px;">
							<xsl:choose>
								<xsl:when test="normalize-space($Form1040ScheduleSEData/SSN) !=''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>	
								</xsl:otherwise>		
							</xsl:choose>
						</div>
					</div>
					<!-- Comments-->
			<div class="styBB" style="border-width: 0px; width: 187mm;">
				<div class="styLNDesc" style="width: 187mm; height: 8mm; padding-top: 2mm; font-size: 9pt; font-style: oblique; font-weight: bold;
				    border-bottom-color: black; border-bottom-width: 1px; border-bottom-style: solid;">										
					 Before you begin: 
					 <span style="font-style: normal; font-weight: normal;"> 
						 To determine if you must file Schedule SE, see the instructions. 
					 </span>
					  <br/>				
				</div>				
				<div class="styLNDesc" style="border-width: 0px; width: 187mm; height: 14mm;">
				    <span style="padding-bottom: 1mm; font-size: 10pt; font-weight: bold;"> 
						   May l Use Short Schedule SE or Must l Use Long Schedule SE?
					</span>				
					   <br/><br/>					
					   <b>Note: </b> Use this flowchart <b>only if</b> you must file Schedule SE. If unsure, see <i>Who Must File Schedule SE</i>
					    in the instructions.          
				</div>			
		    </div>
                <!--<img alt="Note. Use this flowchart only if you must file Schedule SE. " src="{$ImagePath}/1040SchSE_FlowChart.gif" width="720" height="296" style="float:left;clear:none;padding-left:1px;"/>-->
         <!--Flowchart-->
        <div class="styGenericDiv" style="width: 187mm; height: 87mm; padding-top: 0mm; clear: left; float: left;">
			<!--Start of first row-->
			<div class="styGenericDiv" style="width:187mm;">
				<div class="styGenericDiv" style="width:60mm;">
					<div class="styGenericDiv" style="width:40mm;height:6mm;"/>
					<div class="styGenericDiv" style="width:20mm;height:3mm;"/>
					<div class="styGenericDiv" style="width:20mm;height:3mm;border-width:1px 0px 0px 1px;border-style:solid;border-color:black;"/>				
				</div>
				<div class="styGenericDiv" style="width:67mm;height:6mm;border-width:1px 1px 1px 1px;
				    border-style:solid;border-color:black;text-align:center;padding-top:1mm;"><b>Did you receive wages or tips in 2019?</b></div>
				<div class="styGenericDiv" style="width:60mm;">
					<div class="styGenericDiv" style="width:60mm;height:3mm;"/>
					<div class="styGenericDiv" style="width:9mm;height:3mm;border-width:1px 1px 0px 0px;border-style:solid;border-color:black;"/>
					<div class="styGenericDiv" style="width:45mm;height:3mm;"/>
				</div>				
			</div>
			<!--Start of first row-->
			<!--Start of second row-->
			<div class="styGenericDiv" style="width:187mm;height:10.5mm;">
				<div class="styGenericDiv" style="width:78mm;height:8.5mm;">
					<div class="styGenericDiv" style="width:40mm;height:7.5mm;"/>
					<div class="styGenericDiv" style="width:28mm;height:7.5mm;border-width:0px 0px 0px 1px;
					    border-style:solid;border-color:black;padding-left:1mm;padding-top:3mm;text-align:left;"><b>No</b>
					</div>
					<div class="styGenericDiv" style="width:10mm;">
						<div class="styGenericDiv" style="width:10mm;height:4mm;"/>
						<div class="styGenericDiv" style="width:10mm;height:3.5mm;border-width:1px 0px 0px 1px;border-style:solid;border-color:black;"/>				
					</div>
					<div class="styGenericDiv" style="width: 78mm; height: 3mm;">
						<div class="styGenericDiv" style="width: 38.6mm; height: 3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0; line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width: 25.3mm; height: 3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0; line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:8.1mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:22mm;height:10.5mm;">
					<div class="styGenericDiv" style="width:22mm;height:4mm;"/>
					<div class="styGenericDiv" style="width:13mm;height:6.5mm;border-width:1px 1px 0px 0px;border-style:solid;border-color:black;"/>
					<div class="styGenericDiv" style="width:9mm;height:6.5mm;"/>
				</div>
				<div class="styGenericDiv" style="width:87mm;height:8.5mm;">
					<div class="styGenericDiv" style="width:36mm;height:7.5mm;border-width:0px 1px 0px 0px;border-style:solid;border-color:black;"/>
					<div class="styGenericDiv" style="width:51mm;height:7.5mm;padding-left:1mm;padding-top:3mm;"><b>Yes</b>
					</div>
					<div class="styGenericDiv" style="width:34.5mm;height:1mm;"/>
					<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
					    border-right:1.45mm solid transparent;font-size:0;    line-height:0;width:0;"/>
					<div class="styGenericDiv" style="width:49.5mm;height:1mm;"/>
				</div>
			</div>
			<!--End of second row-->
			<!--Start of third row-->
			<div class="styGenericDiv" style="width:187mm;height:19mm;">
				<div class="styGenericDiv" style="width:5mm;height:19mm;"/>
				<div class="styGenericDiv" style="width:73mm;height:19mm;border-width:1px 1px 1px 1px;border-style:solid;
					border-color:black;padding-top:2mm;">
					<span style="width:2mm"/>Are you a minister, member of a religious order, or<br/>
					<span style="width:2mm"/>Christian Science practitioner who received IRS<br/>
					<span style="width:2mm"/>approval <span style=" font-weight:bold">not</span> to be taxed on earnings from these<br/>
					<span style="width:2mm"/>sources, <span style=" font-weight:bold">but</span> you owe self-employment tax on other<br/>
					<span style="width:2mm"/>earnings?
				</div>
				<div class="styGenericDiv" style="width:22mm;height:19mm;">
					<div class="styGenericDiv" style="width:6mm;height:19mm;">
						<div class="styGenericDiv" style="width:6mm;height:9.5mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:6.5mm;text-align:left;"><b>Yes</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:9.5mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:19mm;">
						<div class="styGenericDiv" style="width:3mm;height:8mm;"/>
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:8mm;"/>
					</div>
					<div class="styGenericDiv" style="width:4mm;height:19mm;">
						<div class="styGenericDiv" style="width:4mm;height:9.5mm;border-width:0px 1px 0px 0px;border-style:solid;border-color:black;"/>
						<div class="styGenericDiv" style="width:4mm;height:9.5mm;border-width:0px 1px 0px 1px;border-style:solid;border-color:black;"/>
					</div>
					<div class="styGenericDiv" style="width:9mm;height:19mm"/>
				</div>
				<div class="styGenericDiv" style="width:73mm;height:19mm;border-width:1px 1px 1px 1px;border-style:solid;border-color:black;
				  padding-top:3mm;">
					<span style="width:2mm"/>Was the total of your wages and tips subject to social<br/>
					<span style="width:2mm"/>security or railroad retirement (tier 1) tax <b>plus</b> your<br/>
					<span style="width:2mm"/>net earnings from self-employment more than<br/>
					<span style="width:2mm"/>$132,900?
				</div>
				<div class="styGenericDiv" style="width:9mm;height:19mm;">
					<div class="styGenericDiv" style="width:6mm;height:19mm;">
						<div class="styGenericDiv" style="width:6mm;height:9.5mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:6.5mm;text-align:left;"><b>Yes</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:8.5mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:19mm;">
						<div class="styGenericDiv" style="width:3mm;height:8mm;"/>
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:8mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:5mm;height:19mm;">
					<div class="styGenericDiv" style="width:5mm;height:9.5mm;"/>
					<div class="styGenericDiv" style="width:5mm;height:9.5mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>
				</div>
			</div>
			<!--End of third row-->
			<!--Start of fourth row-->
			<div class="styGenericDiv" style="width:187mm;height:8mm;">
				<div class="styGenericDiv" style="width:78mm;height:6mm;">
					<div class="styGenericDiv" style="width:40mm;height:5mm;"/>
					<div class="styGenericDiv" style="width:28mm;height:5mm;border-width:0px 0px 0px 1px;border-style:solid;
					    border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"><b>No</b>
					</div>
					<div class="styGenericDiv" style="width:78mm;height:3mm;">
						<div class="styGenericDiv" style="width:38.6mm;height:3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0;line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:36.5mm; height:3mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:22mm;height:8.1mm;">
					<div class="styGenericDiv" style="width:9mm;height:8.1mm;"/>
					<div class="styGenericDiv" style="width:4mm;height:8.1mm;border-width:0px 1px 0px 1px;border-style:solid;border-color:black;"/>					
				</div>
				<div class="styGenericDiv" style="width:73mm;height:6mm;">
					<div class="styGenericDiv" style="width:36mm;height:5mm;"/>
					<div class="styGenericDiv" style="width:32mm;height:5mm;border-width:0px 0px 0px 1px;
					    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"><b>No</b>
					</div>
					<div class="styGenericDiv" style="width:73mm; height:3mm;">
						<div class="styGenericDiv" style="width:34.8mm; height:3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0;    line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:35.3mm; height: 3mm;"/>
					</div>					
				</div>
				<div class="styGenericDiv" style="width:9mm;height:8mm;"/>
				<div class="styGenericDiv" style="height:8.1mm;border-width:0px 0px 0px 1px;
				    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"/>
			</div>
			<!--End of fourth row-->
			<!--Start of fifth row-->
			<div class="styGenericDiv" style="width:187mm;height:12mm;">
				<div class="styGenericDiv" style="width:5mm;height:12mm;"/>
				<div class="styGenericDiv" style="width:73mm;height:12.4mm;border-width:1px 1px 1px 1px;border-style:solid;border-color:black;
				    padding-top:2.8mm;">
					<span style="width:2mm"/>Are you using one of the optional methods to figure<br/>
					<span style="width:2mm"/>your net earnings (see instructions)?<br/><br/>
				</div>
				<div class="styGenericDiv" style="width:22mm;height:12mm;">
					<div class="styGenericDiv" style="width:6mm;height:12mm;">
						<div class="styGenericDiv" style="width:6mm;height:6mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:3mm;text-align:left;"><b>Yes</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:6mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:12mm;">
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:4.8mm;"/>
					</div>
					<div class="styGenericDiv" style="width:4mm;height:12mm;">
						<div class="styGenericDiv" style="width:4mm;height:6mm;border-width:0px 1px 0px 1px;border-style:solid;border-color:black;"/>
						<div class="styGenericDiv" style="width:4mm;height:6.4mm;border-width:0px 1px 0px 1px;border-style:solid;border-color:black;"/>
					</div>
					<div class="styGenericDiv" style="width:9mm;height:12mm;"/>
				</div>
				<div class="styGenericDiv" style="width:73mm;height:12.4mm;border-width:1px 1px 1px 1px;border-style:solid;border-color:black;
					padding-top:3mm;">
					<span style="width:2mm"/>Did you receive tips subject to social security or<br/>
					<span style="width:2mm"/>Medicare tax that you <b>didn't</b> report to your employer?
				</div>
				<div class="styGenericDiv" style="width:9mm;height:12mm;">
					<div class="styGenericDiv" style="width:6mm;height:12mm;">
						<div class="styGenericDiv" style="width:6mm;height:6mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:3mm;text-align:left;"><b>Yes</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:6mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:12mm;">
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:5mm;height:12mm;">
					<div class="styGenericDiv" style="width:5mm;height:6mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>
					<div class="styGenericDiv" style="width:5mm;height:6.4mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>
				</div>
			</div>
			<!--End of fifth row-->
			<!--Start of sixth row--> 
			<div class="styGenericDiv" style="width:187mm;height:8mm;">
				<div class="styGenericDiv" style="width:78mm;height:6mm;">
					<div class="styGenericDiv" style="width:40mm;height:5mm;"/>
					<div class="styGenericDiv" style="width:28mm;height:5mm;border-width:0px 0px 0px 1px;
					    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"><b>No</b>
					</div>
					<div class="styGenericDiv" style="width:78mm;height:3mm;">
						<div class="styGenericDiv" style="width:38.6mm;height:3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0;    line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:36.5mm;height:3mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:22mm;height:8.1mm;">
					<div class="styGenericDiv" style="width:9mm;height:8.1mm;"/>
					<div class="styGenericDiv" style="width:4mm;height:8.1mm;border-width:0px 1px 0px 1px;border-style:solid;border-color:black;"/>					
				</div>
				<div class="styGenericDiv" style="width:73mm;height:6mm;">
					<div class="styGenericDiv" style="width:36mm;height:5mm;"/>
					<div class="styGenericDiv" style="width:32mm;height:5mm;border-width:0px 0px 0px 1px;
					    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"><b>No</b>
					</div>
					<div class="styGenericDiv" style="width:73mm;height:3mm;">
						<div class="styGenericDiv" style="width:34.7mm;height:3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0;    line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:35.3mm;height:3mm;"/>
					</div>					
				</div>
				<div class="styGenericDiv" style="width:9mm;height:8mm;"/>
				<div class="styGenericDiv" style="height:8.1mm;border-width:0px 0px 0px 1px;
				    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"/>
			</div>
			<!--End of sixth row-->
			<!--Start of seventh row-->
			<div class="styGenericDiv" style="width:187mm;height:12.1mm;">
				<div class="styGenericDiv" style="width:5mm;height:12.4mm;"/>
				<div class="styGenericDiv" style="width:73mm;height:12.4mm;border-width:1px 1px 1px 1px;border-style:solid;border-color:black;
				    padding-top:1.5mm;">
					<span style="width:2mm"/>Did you receive church employee income (see<br/>
					<span style="width:2mm"/>instructions) reported on Form W-2 of $108.28 or<br/>
					<span style="width:2mm"/>more?
				</div>
				<div class="styGenericDiv" style="width:22mm;height:12mm;">
					<div class="styGenericDiv" style="width:6mm;height:12mm;">
						<div class="styGenericDiv" style="width:6mm;height:6mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:3mm;text-align:left;"><b>Yes</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:6mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:12mm;">
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:4.8mm;"/>
					</div>
					<div class="styGenericDiv" style="width:4mm;height:12mm;">
						<div class="styGenericDiv" style="width:4mm;height:6mm;border-width:0px 1px 0px 1px;border-style:solid;border-color:black;"/>
						<div class="styGenericDiv" style="width:4mm;height:6.4mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:12mm;">
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
						<div class="styGenericDiv" style="border-left:0mm solid transparent;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:2.99mm solid #000;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:4.8mm;"/>
					</div>
					<div class="styGenericDiv" style="width:6mm;height:12mm;">
						<div class="styGenericDiv" style="width:6mm;height:6mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:3mm;text-align:left;"><b>No</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:6mm;"/>
					</div>					
				</div>
				<div class="styGenericDiv" style="width:73mm;height:12mm;border-width:1px 1px 1px 1px;border-style:solid;border-color:black;
					padding-top:3mm;">
					<span style="width:2mm"/>Did you report any wages on Form 8919, Uncollected<br/>
					<span style="width:2mm"/>Social Security and Medicare Tax on Wages?
				</div>
				<div class="styGenericDiv" style="width:9mm;height:12.4mm;">
					<div class="styGenericDiv" style="width:6mm;height:12.4mm;">
						<div class="styGenericDiv" style="width:6mm;height:6mm;border-width:0px 0px 1px 0px;
						    border-style:solid;border-color:black;padding-left:1mm;padding-top:3mm;text-align:left;"><b>Yes</b>
						</div>
						<div class="styGenericDiv" style="width:6mm;height:6mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:12mm;">
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:4.5mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:5mm;height:12mm;">
					<div class="styGenericDiv" style="width:5mm;height:6mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>
					<div class="styGenericDiv" style="width:5mm;height:6.4mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>
				</div>
			</div>
			<!--End of seventh row-->
			<!--Start of eighth row--> 
			<div class="styGenericDiv" style="width:187mm;height:8mm;">
				<div class="styGenericDiv" style="width:78mm;height:6mm;">
					<div class="styGenericDiv" style="width:40mm;height:5mm;"/>
					<div class="styGenericDiv" style="width:28mm;height:5mm;border-width:0px 0px 0px 1px;
					    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"><b>No</b>
					</div>
					<div class="styGenericDiv" style="width:78mm;height:3mm;">
						<div class="styGenericDiv" style="width:38.6mm;height:3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0;    line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:36.5mm;height:3mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:22mm;height:8.1mm;">
					<div class="styGenericDiv" style="width:9mm;height:8.1mm;"/>
					<div class="styGenericDiv" style="width:4mm;height:8.1mm;border-width:0px 0px 0px 1px;border-style:solid;border-color:black;"/>					
				</div>
				<div class="styGenericDiv" style="width:87mm;height:6mm;">
					<div class="styGenericDiv" style="width:82mm;height:5mm;"/>					
					<div class="styGenericDiv" style="height:5.1mm;border-width:0px 0px 0px 1px;
					    border-style:solid;border-color:black;padding-left:1mm;padding-top:1mm;text-align:left;"/>
					<div class="styGenericDiv" style="width:87mm;height:3mm;">
						<div class="styGenericDiv" style="width:80.7mm;height:3mm;"/>
						<div class="styGenericDiv" style="border-top:2.99mm solid #000;border-left:1.45mm solid transparent;
						    border-right:1.45mm solid transparent;font-size:0;line-height:0;width:0;"/>
						<div class="styGenericDiv" style="width:2mm;height:3mm;"/>
					</div>
				</div>
			</div>
			<!--Start of eighth row--> 
			<!--Start of ninth row--> 
			<div class="styGenericDiv" style="width:187mm;height:6mm;">
				<div class="styGenericDiv" style="width:5mm;height:6mm;"/>
				<div class="styGenericDiv" style="width:73mm;height:6mm;border-width:1px 1px 1px 1px;
				    border-style:solid;border-color:black;text-align:center;padding-top:1.3mm;"><b>You may use Short Schedule SE below</b>
				</div>
				<div class="styGenericDiv" style="width:22mm;height:6mm;">
					<div class="styGenericDiv" style="width:9mm;height:6mm;"/>					
					<div class="styGenericDiv" style="width:4mm;height:6mm;">
						<div class="styGenericDiv" style="width:4mm;height:3mm;border-width:0px 0px 1px 1px;border-style:solid;border-color:black;"/>
						<div class="styGenericDiv" style="width:4mm;height:3mm;"/>
					</div>					
					<div class="styGenericDiv" style="width:6mm;height:6mm;">
						<div class="styGenericDiv" style="width:6mm;height:3mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;">
						</div>
						<div class="styGenericDiv" style="width:6mm;height:3mm;"/>
					</div>
					<div class="styGenericDiv" style="width:3mm;height:6mm;">
						
						<div class="styGenericDiv" style="border-left:2.99mm solid #000;border-top:1.45mm solid transparent;
						    border-bottom:1.45mm solid transparent;border-right:0mm solid transparent;font-size:0;line-height:0;width:3mm;margin-top:1.5mm;"/>
						<div class="styGenericDiv" style="width:3mm;height:1.5mm;"/>
					</div>
				</div>
				<div class="styGenericDiv" style="width:84mm;height:6mm;border-width:1px 1px 1px 1px;
				    border-style:solid;border-color:black;text-align:center;padding-top:1.3mm;"><b>You must use Long Schedule SE on page 2</b>
				</div>				
				<div class="styGenericDiv" style="width:3mm;height:10mm;"/>
			</div>
			<!--End of ninth row-->         
        </div>
        <!--End of Flowchart--> 
         <div class="styBB" style="width:187mm; padding-top: 7mm;">
            <!-- BEGIN Section A -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
               <div class="styMainTitle" style="font-size:8pt;padding-top:1mm;padding-bottom:1mm;">
                  Section A <img src="{$ImagePath}/1040SchSE_Short_Line.gif" alt="ShortLine"/> Short Schedule SE.  <span style="width:1mm"/> Caution:
                  <span style="font-weight:normal;"> Read above to see if you can use Short Schedule SE.</span>
               </div>
            </div>
            <!-- END Section A -->
            <!-- Line 1a -->
            <div style="width:187mm; height:7mm;">
               <div class="styLNLeftNumBoxSD" style="height:7mm;padding-top:1mm;">
                 1a
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
               </div>
               <div class="styLNDesc" style="width:139mm;height:7mm;padding-top:1mm;">
                 Net farm profit or (loss) from Schedule F, line 34, and farm partnerships, 
                 Schedule K-1 (Form 1065),<br/> box 14, code A
                  <!--Dotted Line-->
                  <span style="width:1.8mm"/>
                  <span style=" letter-spacing:3mm; font-weight:bold; float:right;">..............................</span>
               </div>
               <div class="styLNRightNumBox" style="height:7mm;padding-top:4mm">
                 1a</div>
               <div class="styLNAmountBox" style="text-align:right;height:7mm;padding-top:4mm; padding-right:1mm;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/NetFarmProfitLossAmt"/>
                  </xsl:call-template></div>
            </div>
            <!--End of line 1a -->
            <!-- Line 1b -->
            <div style="width:187mm; height:11mm;">
               <div class="styLNLeftNumBoxSD" style="height:11mm;padding-top:1mm;padding-left:4mm;">
                 b
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
               </div>
               <div class="styLNDesc" style="width:139mm;height:11mm;padding-top:1mm">
                  If you received social security retirement or disability benefits, enter the amount of 
                  Conservation <br/>Reserve Program payments included on Schedule F, line 4b, 
                  or listed on Schedule K-1 (Form 1065),<br/> box 20, code AH
                  <!--Dotted Line-->
                  <span style="width:2mm"/>
                  <span style=" letter-spacing:3mm; font-weight:bold; float: right; ">.............................</span>
               </div>
               <div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">
                 1b</div>
               <div class="styLNAmountBox" style="text-align:right;height:11mm;padding-top:7mm;padding-right:1mm;">
                 <span style="font-size:6pt">(</span>
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/ConservationReserveProgPymtAmt"/>
                  </xsl:call-template>
                  <span style="font-size:6pt">)</span>
               </div>
            </div>
            <!--End of line 1 -->
            <!-- Line 2 space -->
            <!-- Line 2 -->
            <div style="width: 187mm; height: 10mm;">
               <div class="styLNLeftNumBoxSD" style="height: 10mm;">
                 2</div>
               <div class="styLNDesc" style="width:139mm;height:10mm;">
                 Net profit or (loss) from Schedule C, line 31; and Schedule
                 K-1 (Form 1065), box 14, code A (other than <br/>farming). Ministers and members of religious orders, see instructions
                 for types of income to report on this <br/>line. See instructions for other income to report
                  <span style="width:1px;"/>
                  <!--Dotted Line-->
                  <span style="width:.3mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; float: right; ">..................</span>
               </div>
               <div class="styLNRightNumBox" style="height: 10mm; padding-top: 6.5mm;">
                 2</div>
               <div class="styLNAmountBox" style="height: 10mm; text-align: right; padding-top: 6.5mm; padding-right: 1mm;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/NetNonFarmProfitLossAmt"/>
                  </xsl:call-template></div>
            </div>
            <!--End of line 2 -->
            <!--Line 3 -->
            <div style="width: 187mm; height: 5mm;">
               <div class="styLNLeftNumBoxSD" style="height:5mm;;padding-top:1.5mm;">
                 3</div>
               <div class="styLNDesc" style="width:139mm;height:5mm;padding-top:1.3mm;">
                 Combine lines 1a, 1b, and 2 
                <span style="width:0.3mm;"/> 
                 <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Additional Income Or Loss Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                  </xsl:call-template> 
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Self Employment Tax Exempt Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Self Employment Tax Exempt Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Community Income Taxed To Spouse Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Chapter 11 Bankruptcy Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Community Income Taxed To Spouse Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Exempt Community Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Chapter 11 Bankruptcy Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A, Line 3 - Exempt Community Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span style="width:3mm;"/>
                  <span style=" letter-spacing:3mm; font-weight:bold; float: right; ">.................</span>
               </div>
               <div class="styLNRightNumBox" style="height: 5mm; padding-top: 1.5mm;">
                 3</div>
               <div class="styLNAmountBox" style="height: 5mm; padding-top: 1.5mm; padding-right: 1mm;">
                   <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt"/>
                   </xsl:call-template></div>
            </div>
            <!--End of line 3 -->
            <!-- Line 4 -->
            <div style="width: 187mm; height: 14mm;">
               <div class="styLNLeftNumBoxSD" style="height: 14mm;">
                 4
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
               </div>
               <div class="styLNDesc" style="width: 139mm; height: 14mm; padding-bottom: 0.5mm;">
                  Multiply line 3 by 92.35% (0.9235). If less than $400, you don't owe self-employment tax;<b> don't</b>
                  file this schedule unless you have an amount on line 1b
                  <!--Dotted Line-->
                  <div style="float: right; padding-right: 1.5mm;">
                  <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style=" letter-spacing:3mm; font-weight:bold; float: left;">...................</span>
                  </div>
                  <div>
                    <b>Note:</b><span style="width: 0.5mm; height: 3.5mm;"/>
                     If line 4 is less than $400 due to Conservation Reserve Program payments on line 1b,<br/>
                     see instructions.
                    </div>
               </div>
               <div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm;">
                 4</div>
               <div class="styLNAmountBox" style="height: 6mm; text-align: right; padding-top: 2.5mm; padding-right: 1mm;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/MinimumProfitForSETaxAmt"/>
                  </xsl:call-template>
               </div>
               <div class="styLNRightNumBox" style="height: 8mm; padding-top: 3.4mm; border-bottom-color: black; border-bottom-width: 0px;
                    border-bottom-style: solid;"/>
               <div class="styLNAmountBox" style="height: 8mm; text-align: right; padding-top: 3.4mm; border-bottom-color: black; 
                    border-bottom-width: 0px; border-bottom-style: solid;">
               </div>
            </div>
            <!--End of line 4 -->
            <!-- Line 5 -->
            <div style="width:187mm;height: 16.5mm;">
               <div class="styLNLeftNumBoxSD" style="height:16.5mm;">
                 5</div>
               <div class="styLNDesc" style="width:139mm;height:16.5mm;">
                  <b>Self-employment tax.</b> If the amount on line 4 is:<br/>
                  <img src="{$ImagePath}/1040SchSE_Bullet_Round.gif" alt="RoundBullet"/>
                  <span style="width:1mm;"/>
                    $132,900 or less, multiply line 4 by 15.3% (0.153). Enter the result here and on
                  <b>Schedule 2 (Form 1040 or 1040-SR), line 4,</b> or <b>Form 1040-NR, line 55.</b><br/>
                  <img src="{$ImagePath}/1040SchSE_Bullet_Round.gif" alt="RoundBullet"/>
                  <span style="width:1mm;"/>
                    More than $132,900, multiply line 4 by 2.9% (0.029). Then, add $16,479.60 to the 
                    result. <br/>Enter the total here and on<b> Schedule 2 (Form 1040 or 1040-SR), line 4, </b>or <b>Form 1040-NR, line 55</b>
                  <!--Dotted Line-->
                  <span style="width:1.8mm"/>
                  <span style=" letter-spacing:3mm; font-weight:bold; float: right; ">.</span>
               </div>
               <div class="styLNRightNumBox" style="height:16.5mm;padding-top:13.5mm;">
                 5</div>
               <div class="styLNAmountBox" style="height: 16.5mm; text-align: right; padding-top: 13.5mm; padding-right: 1mm;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SelfEmploymentTaxAmt"/>
                  </xsl:call-template></div>
            </div>
            <!--End of line 5 -->
            <!--Line 6 -->
            <div style="width:187mm;height: 10.5mm;">
               <div class="styLNLeftNumBox" style="height:10.5mm;padding-left:2.8mm;">6</div>
               <div class="styLNDesc" style="width:99.7mm;height:10.5mm;">
                  <b>Deduction for one-half of self-employment tax. </b>
                       <br/>  
					   Multiply line 5 by 50% (0.50). Enter the result here and on
                       <b> Schedule 1 (Form 1040 or 1040-SR), line 14,</b> or <b>Form 1040-NR, line 27</b>
				  <span style="width:1.8mm;"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; float: right; ">......</span>
               </div>
               <div class="styLNRightNumBox" style="height: 10.5mm; padding-top: 7.5mm; border-bottom-width: 0px;">
                 6</div>
               <div class="styLNAmountBox" style="width: 31.3mm; height: 10.5mm; padding-top: 7.5mm; padding-right: 1mm; border-bottom-width: 0px;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/DeductibleSelfEmploymentTaxAmt"/>
                  </xsl:call-template></div>
               <div class="styLNRightNumBox" style="height:10.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
               <div class="styLNAmountBox" style="height: 10.5mm; border-bottom-width: 0px; border-left-width: 0px; background-color: lightgrey;"/>
            </div>
            <!--End of line 6 -->
         </div>
         <!-- capturing the page bottom info -->
         <!--  FOOTER-->
         <div class="pageEnd" style="width:187mm;">
            <span style="width:125mm;">
              <b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
              <span style="width:5mm;"/>                      
              Cat. No. 11358Z 
			</span>
            <span class="styBoldText" style="float:right;">Schedule SE (Form 1040 or 1040-SR) 2019</span>
        </div>
        <!-- Adding page break -->
        <p class="pageend"/>
        <!-- Page Header -->
         <div class="styBB" style="width:187mm; padding-top:.5mm;"><br/>
            <div style="float:left;">Schedule SE (Form 1040 or 1040-SR) 2019<span style="width:73.5mm;"/>
              Attachment Sequence No. <b>17</b></div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
         </div>
         <!-- END Page Header -->
         <!-- Begin Names and Identifying number section -->
         <div class="styBB" style="width:187mm;border-bottom-width:0px">
            <div class="styBB" style="width: 112mm; height: 7mm; border-bottom-width: 0px;">
               <div class="styNameBox" style="width: 112mm; height: 4mm; padding-top: 0.5mm; font-size: 6pt; font-weight: normal;">
                 Name of person with <b>self-employment</b> income <span style="font-size:6pt;">(as shown on Form 1040, Form 1040-SR, or 1040NR)</span>
                <br/>
               </div>
               <div class="styNameBox" style="width: 112mm; height: 3mm; padding-bottom:0mm; font-size: 7pt;">
				   <xsl:choose>
						<xsl:when test="normalize-space($Form1040ScheduleSEData/PersonNm) !=''">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/PersonNm"/>
							</xsl:call-template>	
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>	
						</xsl:otherwise>		
					</xsl:choose>
                </div>
            </div>
            <div class="styEINBox" style="width: 46mm; height: 7mm; padding-top: .5mm; padding-left: 1.5mm; font-size: 7pt; font-weight: normal;
                border-right-width: 1px; border-bottom-width: 0px;">
                Social security number of person with <b>self-employment </b>income
               <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
            </div>
            <div class="styLNAmountBox" style="width: 29mm; height: 7mm; text-align: center; padding-top: 3.5mm; border-bottom-width: 0px;">
                <xsl:choose>
					<xsl:when test="normalize-space($Form1040ScheduleSEData/SSN) !=''">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
						</xsl:call-template>	
					</xsl:otherwise>		
				</xsl:choose>
            </div>
         </div>
         <!-- BEGIN Section B -->
         <div class="styBB" style="width:187mm;border-top-width:1px">
            <div class="styMainTitle" style="font-size:8pt;padding-top:1mm;padding-bottom:1mm">
              Section B <img src="{$ImagePath}/1040SchSE_Short_Line.gif" alt="ShortLine"/> Long Schedule SE
            </div>
         </div>
         <!-- END Section B -->
					<!-- Part I  -->
					<div class="styBB" style="width:187mm;">
						<span class="styPartName" style="width:16mm;">Part I</span>
						<!--Part I-->
						<span style="width:150mm;" class="styPartDesc">Self-Employment Tax</span>
					</div>
					<!-- End Part I  -->
					<div style="width:187mm; clear: left; float: left;">
						<b>Note:</b> If your only income subject to self-employment tax is <b>church employee income,</b> see instructions.  Also see
						 instructions for the<br/>definition of church employee income. 
					</div>
					<!-- SB-Line A -->
					<div style="width: 187mm; height: 8mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:8mm;">
							A
						</div>
						<div class="styLNDesc" style="width:168mm; height:8mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/ExemptForm4361Ind"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleSE</xsl:with-param>
								</xsl:call-template>
								If you are a minister, member of a religious order, or Christian Science practitioner <b>and</b> you filed Form 4361, but you<br/> 
								had $400 or more of <b>other</b> net earnings from self-employment, check here and continue with Part I
							</label>
							<!--Dotted Line-->
							<span style="width:.5mm;"/>
							<span style=" letter-spacing:2.7mm; font-weight:bold;">...........</span>
						</div>
						<div style="height: 7mm; width: 10mm; padding-top: 3mm;">
							<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/ExemptForm4361Ind"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleSE</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--End of line SB-1 -->
					<!-- SB-Line 1a -->
					<div style="width: 187mm; height: 7mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7mm;">1a</div>
						<div class="styLNDesc" style="width:139mm;height:7mm;">
							Net farm profit or (loss) from Schedule F, line 34, and farm partnerships, Schedule K-1 (Form 1065), <br/>
							<span style="float:left;">box 14, code A. <b>Note:</b> Skip lines 1a and 1b if you use the farm optional method (see instructions)</span>
						   <!--Dotted Line-->
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing: 3mm; float: right; padding-right: 0mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height: 7mm; padding-top: 3mm; border-top-width: 1px;">
							1a</div>
						<div class="styLNAmountBox" style="height: 7mm; text-align: right; padding-top: 3mm; padding-right: 1mm; border-top-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/NetFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line SB-1 -->
					<!-- Line 1b -->
					<div style="width: 187mm; height: 10mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:10mm; padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:139mm; height:10mm;">
							If you received social security retirement or disability benefits, enter the amount of Conservation<br/>Reserve
							Program payments included on Schedule F, line 4b, or listed on Schedule K-1 (Form 1065),<br/>
							<span style="float:left;">box 20, code AH</span>
							<!--Dotted Line-->
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing: 3mm; float: right; padding-right: 0mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:3.5mm;"><br/>1b</div>
						<div class="styLNAmountBox" style="height: 10mm; text-align: right; padding-top: 3.5mm; padding-right: 1mm;"><br/>
							<span style="font-size:6pt">(</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/ConservationReserveProgPymtAmt"/>
							</xsl:call-template>
							<span style="font-size:6pt">)</span>
						</div>
					</div>
					<!--End of line 1 -->
					<!-- Line SB-2 -->
					<div style="width: 187mm; height: 14mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:14mm;">2</div>
						<div class="styLNDesc" style="width: 139mm; height: 14mm;">
							Net profit or (loss) from Schedule C, line 31; and Schedule K-1 (Form 1065), box 14, 
							code A  (other than <br/> farming). Ministers and members of religious
							orders, see instructions for types of income to report on this line.<br/> See instructions for other income to report.  <b>Note:</b> 
							Skip this line if you use the nonfarm optional method (see instructions)<span style=" letter-spacing:2mm; font-weight:bold; float: right;
							padding-right: 1mm; ">..........................................</span> 
						</div> 
						<div class="styLNRightNumBox" style="height: 14mm; padding-top: 10mm; border-bottom-width: 1px;">2</div>
						<div class="styLNAmountBox" style="height: 14mm; text-align: right; padding-top: 10mm; padding-right: 1mm; border-bottom-width: 1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/NetNonFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of line SB-2 -->
					<!--Line SB-3 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">
								Combine lines 1a, 1b, and 2 
								
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Cd </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Amt </xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
								</xsl:call-template>
							</span>
							<span class="styIRS1040ScheduleSEDotLn" style=" letter-spacing:3.2mm; font-weight:bold; float: right; 
							    padding-right: 0mm;">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">3</div>
						<div class="styLNAmountBox" style="height:4.4mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-3 -->
					<!--Line SB-4a -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="styLNDesc" style="width:139mm;">
							If line 3 is more than zero, multiply line 3 by 92.35% (0.9235). Otherwise, enter amount from line 3
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3.2mm; font-weight:bold; float: right; padding-right: 0mm;">...</span>
						</div>
						<div class="styLNRightNumBox">4a</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/MinimumProfitForSETaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-4a -->
					<!--Line SB-4b -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:139mm;font-family:Arial;">
							<b>Note:</b> If line 4a is less than $400 due to Conservation Reserve Program payments on line 1b, see instructions.
               			</div>
						<div class="styLNRightNumBoxNBB"/>
						<div class="styLNAmountBoxNBB"/>
					</div>
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">If you elect one or both of the optional methods, enter the total of lines 15 and 17 here</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3.2mm; font-weight:bold; float: right; 
							    padding-right: 0mm;">.......</span>
						</div>
						<div class="styLNRightNumBox">4b</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/OptionalMethodAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-4B -->
					<!--Line SB-4c -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7.2mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:139mm;height:7.2mm;">
							Combine lines 4a and 4b. If less than $400, <b>stop;</b> you don't owe self-employment tax.<br/>
							<span style="float:left;"><b>Exception: </b>If less than $400 and you had <b>church employee income,</b>
							 enter -0- and continue</span>
							<!--Dotted Line-->
							  <div style="float: right; padding-right: 1.5mm;">
								  <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
								  <span style=" letter-spacing:3mm; font-weight:bold; float: left;">....</span>
							  </div>
							  </div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br/>4c</div>
						<div class="styLNAmountBox" style="height:7.2mm; padding-right:1mm;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/CombinedSEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-4C -->
					<!-- Line SB5a -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7.4mm;">5a </div>
						<div class="styLNDesc" style="width:99mm;height:7.4mm;">
							Enter your <b>church employee income</b> from Form W-2. See <br/>
							<span style="float:left;">instructions for definition of church employee income</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							   padding-right: 1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br/>5a</div>
						<div class="styLNAmountBox" style="height:7.4mm;padding-right:1px;"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/W2WagesFromChurchesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.6mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.6mm;"/>
					</div>
					<!-- End LineSB 5a -->
					<!--Line SB-5b -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 5a by 92.35% (0.9235). If less than $100, enter -0-</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							   padding-right: 1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">5b</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/MinAllowableChurchWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-5B -->
					<!--Line SB-6 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 4c and 5b</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							    padding-right: 1mm;">.............................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/CombinedSEAndChurchWagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-6 -->
					<!-- Line SB7 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:7.4mm;">7</div>
						<div class="styLNDesc" style="width:139mm;height:7.4mm;">
							Maximum amount of combined wages and self-employment earnings subject to social security <br/>
							<span style="float:left;">tax or the 6.2% portion of the 7.65% railroad retirement (tier 1) tax for 2019. Enter $132,900</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm;"><br/>7</div>
						<div class="styLNAmountBox" style="text-align:right;height:7.4mm;padding-right:1mm;"><br/>
							$132,900
						</div>
					</div>
					<!--End of line SB7 -->
					<!-- Line SB8a -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="height:11mm;">8a</div>
						<div class="styLNDesc" style="width:99mm;height:11mm;">
							Total social security wages and tips (total of boxes 3 and 7 on Form(s) W-2) <br/> 
                            and railroad retirement (tier 1) compensation. If $132,900 or more, skip<br/>
							 lines 8b through 10, and go to line 11<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm;
                             font-weight:bold; float: right; padding-right: 1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;"><br/><br/>8a</div>
						<div class="styLNAmountBox" style="height:11mm;padding-right:1px;"><br/><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SSTWagesRRTCompAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:11mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:11mm;"/>
					</div>
					<!-- End LineSB 8a -->
					<!-- Line SB8b -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b </div>
						<div class="styLNDesc" style="width:99mm;">
							Unreported tips subject to social security tax (from Form 4137, line 10)
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							    padding-right: 1mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">8b </div>
						<div class="styLNAmountBox" style="padding-right:1px; height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/UnreportedTipsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- End LineSB 8b -->
					<!-- Line SB8c -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:99mm;">
							<span style="float:left;">Wages subject to social security tax (from Form 8919, line 10)</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox">8c</div>
						<div class="styLNAmountBox" style="padding-right:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/WagesSubjectToSSTAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"/>
					</div>
					<!-- End LineSB 8c -->
					<!--Line SB-8d -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Add lines 8a, 8b, and 8c</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							  padding-right: 1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox">8d</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/TotalWagesAndUnreportedTipsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-8d -->
					<!--Line SB-9 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left">Subtract line 8d from line 7. If zero or less, enter -0- here and on line 10 and go to line 11</span>
							<img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet" style="float:right;margin-right:1px; 
							    padding-top: 0.75mm;padding-right: 1.25mm;"/>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/AllowableSEAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-9 -->
					<!--Line SB-10 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply the <b>smaller </b>of line 6 or line 9 by 12.4% (0.124)</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/TaxBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-10 -->
					<!--Line SB-11 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:139mm;">
							<span style="float:left;">Multiply line 6 by 2.9% (0.029)</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SEBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-11 -->
					<!--Line SB-12 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="height:6,5mm">12</div>
						<div class="styLNDesc" style="width:139mm;height:6.5mm;">
							<b>Self-employment tax.</b> Add lines 10 and 11. Enter here and on
							<b>Schedule 2 (Form 1040 or 1040-SR), line </b><br/><b>4,</b> or <b>Form </b><b>1040-NR, line 55</b>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							  padding-right:1mm ">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:6.5mm;padding-top:2mm">12</div>
						<div class="styLNAmountBox" style="padding-right:1mm;height:6.5mm;padding-top:2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-12 -->
					<!--Line SB13 -->
					<div style="width:187mm; clear: left; float: left; padding-bottom:0px;">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:139mm;padding-bottom:0px;">
							<b>Deduction for one-half of self-employment tax.</b>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;height:4mm;"/>
					</div>
					<div style="width:187mm; border-bottom:solid black 1px; padding-top:0px; clear: left; float: left; ">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:99mm;padding-top:0px;height:4mm;">
							Multiply line 12 by 50% (0.50). Enter the result here and on <b>Schedule 1 </b>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border:0px;"/>
						<div class="styLNAmountBoxNBB" style="padding-right:1px;height:4mm;border:0px;"/>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;height:4mm;"/>
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:99mm;padding-top:0px;height:4mm">
							<span style="float:left;"><b>(Form 1040 or 1040-SR), line 14,</b> or <b>Form 1040-NR, line 27</b></span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right;
							    padding-right: 1mm;">...</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;">13</div>
						<div class="styLNAmountBoxNBB" style="padding-right:1px;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/DeductibleSelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;height:4mm;"/>
					</div>
					<!--End of lineSB- 13 -->
					<div class="styBB" style="width:187mm;border-top-width:0px;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="font-weight:normal;"><b>Optional Methods To Figure Net Earnings </b>(see instructions)</div>
					</div>
					<!-- End Part II  -->
					<!--Line SB-14-1 -->
					<div class="styBB" style="width:187mm;height:16.8mm">
						<!-- Line SB7 -->
						<div style="width:187mm;">
							<div class="styGenericDiv" style="padding-left:0.5mm;width:146.97mm;height:6mm;">
								<b>Farm Optional Method.</b> You may use this method <b>only</b> if <b>(a)</b> 
									your gross farm income<span style="font-size:5pt;">
									<sup>1</sup>
								</span>
								wasn't more than $8,160, <b>or (b)</b> your net farm profits<span style="font-size:5pt;">
									<sup>2</sup>
								</span> were less than $5,891.
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6mm;padding-top:4mm;background-color:lightgrey;border-left:1px solid black;"/>
							<div class="styLNAmountBoxNBB" style="text-align:center;height:6mm;padding-top:4mm;"/>
						</div>
						<!--End of line SB14-1 -->
						<!--Line SB-14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:138.97mm;">
								<span style="float:left;">Maximum income for optional methods. Enter $5,440</span>
								<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
								    padding-right: 1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox" style="padding-right:1mm;">
								$5,440
							</div>
						</div>
						<!--End of lineSB-14 -->
						<!--Line SB-15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:6.5mm;padding-bottom:.1mm;">15</div>
							<div class="styLNDesc" style="width:138.97mm;height:6.5mm;padding-top:0mm; padding-bottom:.1mm">
								Enter the <b>smaller</b> of: two-thirds (<sup style="font-size:6pt;">2</sup>/<span style="font-size:5pt;">3</span>)
								of gross farm income<sup style="font-size:6pt;">1</sup> (not less than zero) <b>or</b> $5,440. Also <br/>
								<span style="float:left;">include this amount on line 4b above</span>
								<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
								    padding-right: 1mm;">.......................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:6.5mm;padding-bottom:.1mm"><br/>15</div>
							<div class="styLNAmountBoxNBB" style="height:6.5mm;padding-right:1mm;padding-bottom:.1mm"><br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETaxFarmOptionalMethodAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--End of lineSB-15 -->
					<!--Line SB-16-1 -->
					<div style="width:187mm;clear: left; float: left;">
						<!-- Line SB7 -->
						<div class="styLNDesc" style="width:146.97mm;height:12mm;">
							<b>Nonfarm Optional Method.</b> You may use this method <b>only </b> if <b>(a)</b> 
							your net nonfarm profits<span style="font-size:5pt;padding-bottom:1mm">
								<sup>3</sup>
							</span> 
							were less than $5,891 <br/>
							and also less than 72.189% of your gross nonfarm income,<span style="font-size:5pt;padding-bottom:1mm">
								<sup>4</sup> 
							</span>
							<b> and (b) </b> you had net earnings from self-employment<br/> of at least $400 in 2 of the prior 3 years. 
							<b>Caution:</b> You may use this method no more than five times.
						</div>
						<div class="styLNRightNumBoxNBB" style="height:12mm;background-color:lightgrey;border-left:1px solid black;"/>
						<div class="styLNAmountBoxNBB" style="height:12mm;"/>
					</div>
					<!--End of line SB16-1 -->
					<!--Line SB-16 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width:138.97mm;">
							<span style="float:left;">Subtract line 15 from line 14</span>
							<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
							    padding-right: 1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox" style="padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETaxNonFarmOptionalBaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-16 -->
					<!--Line SB-17 -->
					<div style="width:187mm; clear: left; float: left;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-top:1mm">17</div>
						<div class="styLNDesc" style="width:138.97mm;height:7mm;padding-bottom:.1mm">
							Enter the <b>smaller </b>of: two-thirds (<sup style="font-size:6pt;">2</sup>/<span style="font-size:5pt;">3</span>
							) of gross nonfarm income<sup style="font-size:6pt;">4</sup> (not less than zero) <b>or</b> the <br/>
							<span style="float:left;">amount on line 16. Also include this amount on line 4b above</span>
								<span class="styIRS1040ScheduleSEDotLn" style="letter-spacing:3mm; font-weight:bold; float: right; 
								padding-right: 1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-bottom:.1mm"><br/>17</div>
						<div class="styLNAmountBox" style="height:7mm;padding-right:1mm;padding-bottom:.1mm"><br/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETaxNonFarmOptionalMethodAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--End of lineSB-17 -->
					<!--Line 18-->
					<div class="styBB" style="width:187mm; clear: left:float:left;">
						<div class="styLNDesc" style="width:90mm;height:14mm;">
							<sup>1</sup>From Sch. F, line 9, and Sch. K-1 (Form 1065), box 14, code B.
							<br/>
							<sup>2</sup>From Sch. F, line 34, and Sch. K-1 (Form 1065), box 14,<br/>
							<span style="padding-left:1mm"> code A - minus the amount you would have entered on line </span>
							<br/>
							<span style="padding-left:1mm">1b had you not used the optional method.</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:96mm;height:14mm;text-align:left;">
							<span style="padding-left:2mm;">
								<sup>3</sup>From Sch. C, line 31; and Sch. K-1 (Form 1065), box 14,<br/>
								<span style="padding-left:1.1mm"> code A.</span>
							</span>
							<br/>
							<span style="padding-left:2mm;">
								<sup>4</sup>From Sch. C, line 7; and Sch. K-1 (Form 1065), box 14,<br/>
								<span style="padding-left:1.1mm">code C.</span>
							</span>
						</div>
						<!--  FOOTER-->
					</div>
					<div class="styGenericDiv" style="float:right; height:40mm">
						<span class="styBoldText">Schedule SE (Form 1040 or 1040-SR) 2019</span>
						<p class="pageend"/>
					</div>
					<!--End of line 18 -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl" style="clear: left; float: left;">
						<xsl:variable name="leftWidth" select="105"/>
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Additional Income Or Loss Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template> 
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Self Employment Tax Exempt Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
					    </xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Self Employment Tax Exempt Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
                        </xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Community Income Taxed To Spouse Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Chapter 11 Bankruptcy Income Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Community Income Taxed To Spouse Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section A, Line 3 - Exempt Community Income Cd </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Chapter 11 Bankruptcy Income Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Section A, Line 3 - Exempt Community Income Amt </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/ShortScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Self Employment Tax Exempt Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Chapter 11 Bankruptcy Income Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Community Income Taxed To Spouse Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@communityIncmTaxedToSpouseAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Exempt Community Income Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part I, Line 3 - Additional Income Or Loss Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/LongScheduleSE/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
							<xsl:with-param name="DescWidth" select="$leftWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>