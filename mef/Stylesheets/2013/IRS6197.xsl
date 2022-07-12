<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS6197Style.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="FormData" select="$RtnDoc/IRS6197" />
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="Form IRS6197" />        
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS6197Style"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>        
     </xsl:if>
    </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
  <form name="Form6197">
      <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"  />  
      <!-- END WARNING LINE -->
      
<!--Begin Header-->
<div class="styTBB" style="width:187mm;">
	<table cellspacing="0">
		<tbody>
			<tr>
				<th class="styFNBox" style="border-right-width: 2px;text-align: left;font-size: 8pt;font-weight:normal;width:35mm;height:13mm;">
					Form <span class="styFormNumber" style="padding-left:2mm;">6197</span>
					<br />
					<span style="font-size: 7pt;font-weight:normal">(Rev. October 2005)</span>
				</th>
				<th rowspan="2" style="border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;width:111.5mm;height:18mm;">
					<div class="styMainTitle" style="height:9mm;font-size:14pt;padding-top:1mm;">
					      Gas Guzzler Tax
					</div>
					<br/>
					<div class="styFST" style="height:2mm;font-size:7pt;">
						<img src="{$ImagePath}/6197_Bullet.gif" alt="Bullet Image" />
						See Instructions on back.
					</div>
					<br/>
					<div class="styFST" style="height:6mm;font-size:7pt;">
						<br/><img src="{$ImagePath}/6197_Bullet.gif" alt="Bullet Image" />
						Attach to Form 720.
					</div>
				</th>
				<th rowspan="2" style="width:40.5mm;height:18mm;font-size: 7pt;font-weight:normal">	
     					OMB No. 1545-0242
				</th>
			</tr>
			<tr>
				<td class="styFNBox" style="width:35mm;border-right-width: 2px;height:6mm;">
					<span class="styAgency" style="font-family: arial">Department of the Treasury</span>
					<br />
	      			<span class="styAgency" style="font-family: arial">Internal Revenue Service</span>
	      		</td>
			</tr>
		</tbody>
	</table>
</div>
<!--End header-->

<!--Begin Name/Quarter Ending/EIN-->
<div style="width:187mm">
	<table cellspacing="0">
		<tbody>
			<tr style="height:5mm">
				<th class="styIRS6197NameTableCell" style="width:110mm;font-size:7pt">
					Name (as shown on Form 720)
					<br/>
					<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template>
					<br/>  
					<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template> 
				</th>
				<th class="styIRS6197NameTableCell" style="width:37mm;  font-size:7pt; padding-left:1mm">
					Quarter Ending
					<br/>
					<div style="padding-top:3.2mm">
						<xsl:call-template name="PopulateMonthDayYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEnding"></xsl:with-param>
						</xsl:call-template>
					</div>
				</th>
				<th class="styIRS6197NameTableCell" style="width:40.75mm; font-size:8pt; padding-left:1mm; border-right:0px">
					<span style="font-family:arial narrow;font-weight:bold">
						Employer identification number
					</span>
					<br/>
					<div style="padding-top:2mm">
					<xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template></div>
				</th>
			</tr>
		</tbody>
	</table>
</div>
<!--End Name/Quarter Ending/EIN-->

<!--Begin Part 1-->
<!--Begin Part 1 header-->
<div style="width:187mm">
<table style="border-color:black; border-style: solid;border-bottom-width:1px; border-top-width:0px; border-left-width:0px; border-right-width:0px;font-family:arial">
	<tbody>
		<tr style="height:1mm">
			<th colspan="3" style="width:187mm"></th>
		</tr>
		<tr>
			<th class="styPartName" style="width:14mm;font-size:9pt">Part I</th>
			<th class="styPartDesc" style="width:168mm; text-align:left;font-size:9pt">Computation of Tax</th>
		</tr>
		<tr style="height:1mm">
			<th colspan="3" style="width:187mm"></th>
		</tr>
	</tbody>
</table>
</div>
<!--End Part 1 header-->
<!--Begin Part 1 Table-->
<div style="width:187mm">
<table cellspacing="0">
	<tbody>
		<!--Begin Header Rows-->
		<tr>
			<th class="styIRS6197TableCellVerticalText" style="height:28mm;width:5mm" rowspan="2">
				<img src="{$ImagePath}/6197_LineNumber.gif" alt="" />
			</th>
			<th class="styIRS6197TableCellHeaderText" style="width:41mm;font-family:arial;font-weight:bold" colspan="3">
				If the fuel economy (mpg) of<br/>
				the automobile model type is:
			</th>
			<th class="styIRS6197TableCellHeaderText" style="width:23mm" rowspan="2"><b>(d)</b><br/>Number<br/>of cars<br/>sold</th>
			<th class="styIRS6197TableCellHeaderText" style="width:24mm; border-right-width:2px" rowspan="2"><b>(e)</b><br/>Tax due<br/>(multiply<br/>column (c) by<br/>column (d))</th>
			<th class="styIRS6197TableCellVerticalText" style="width:6mm" rowspan="2">
				<img src="{$ImagePath}/6197_LineNumber.gif" alt="" />
			</th>
			<th class="styIRS6197TableCellHeaderText" style="width:41mm;font-family:arial;font-weight:bold" colspan="3">
				If the fuel economy (mpg) of<br/>
				the automobile model type is:
			</th>
			<th class="styIRS6197TableCellHeaderText" style="width:23mm" rowspan="2"><b>(d)</b><br/>Number<br/>of cars<br/>sold</th>
			<th class="styIRS6197TableCellHeaderText" style="width:24mm;border-right-width:0px" rowspan="2"><b>(e)</b><br/>Tax due<br/>(multiply<br/>column (c) by<br/>column (d))</th>
		</tr>
		<tr>
			<td class="styIRS6197TableCellHeaderText" style="width:13mm"><b>(a)</b><br/>At<br/>least</td>
			<td class="styIRS6197TableCellHeaderText" style="width:14mm"><b>(b)</b><br/>But<br/>less<br/>than</td>
			<td class="styIRS6197TableCellHeaderText" style="width:14mm"><b>(c)</b><br/>Tax<br/>rate</td>
			<td class="styIRS6197TableCellHeaderText" style="width:13mm"><b>(a)</b><br/>At<br/>least</td>
			<td class="styIRS6197TableCellHeaderText" style="width:14mm"><b>(b)</b><br/>But<br/>less<br/>than</td>
			<td class="styIRS6197TableCellHeaderText" style="width:14mm"><b>(c)</b><br/>Tax<br/>rate</td>
		</tr>
		<!--End Header Rows-->
		<!--Begin Line 1 and Line 7-->
		<tr style="height:8mm">
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line1/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line1/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line1/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">$
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line1/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText"  style=" background-color:lightgrey">
			<span style="width:1px"></span>
			</td>
			<td class="styIRS6197TableCellText"  style="background-color:lightgrey; border-right-width:2px">
			<span style="width:1px"></span>
			</td>
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line7/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line7/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line7/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">$
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line7/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line7/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line7/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 1 and Line 7-->
		<!--Begin Line 2 and Line 8-->
		<tr style="height:8mm">
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line2/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line2/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line2/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line2/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line2/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:2px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line2/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line8/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line8/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line8/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line8/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line8/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line8/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 2 and Line 8-->
		<!--Begin Line 3 and Line 9-->
		<tr style="height:8mm">
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line3/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line3/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line3/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line3/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line3/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:2px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line3/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line9/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line9/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line9/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line9/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line9/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line9/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 3 and Line 9-->
		<!--Begin Line 4 and Line 10-->
		<tr style="height:8mm">
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line4/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line4/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line4/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line4/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line4/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:2px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line4/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line10/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line10/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line10/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line10/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line10/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line10/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 4 and Line 10-->
		<!--Begin Line 5 and Line 11-->
		<tr style="height:8mm">
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line5/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line5/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line5/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line5/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line5/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:2px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line5/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line11/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line11/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line11/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line11/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line11/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line11/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 5 and Line 11-->
		<!--Begin Line 6 and Line 12-->
		<tr style="height:8mm">
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line6/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line6/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line6/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line6/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line6/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:2px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line6/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellLineNumber"><b>
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line12/LineNumber"/>
       			 </xsl:call-template>
			</b></td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line12/ColAMPGMin"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line12/ColBMPGMax"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellText">
				<xsl:call-template name="PopulateText">
          				<xsl:with-param name="TargetNode" select="$FormData/Line12/ColCTaxRate"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line12/ComputationColumns/ColDNbrSold"/>
       			 </xsl:call-template>
			</td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/Line12/ComputationColumns/ColETaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 6 and Line 12-->
		<!--Begin Line 13-->
		<tr>
			<td class="styIRS6197TableCellText"  style="vertical-align: top;border-right-width:0px;padding-top:0.5mm">
				<b>13</b>
			</td>
			<td class="styIRS6197TableCellText"  style="text-align: left;font-size:8pt" colspan="9">
				Total tax due for the quarter. Add lines 2 through 12 in column (e). Enter here and on<br/>
				Form 720 on the line for <b>IRS No. 40</b>
					<span style="float:right; padding-right:1mm;">
						<span class="styDotLn">..................</span>
						<img src="{$ImagePath}/6197_Bullet.gif" alt="Bullet Image" />
					</span>
			</td>
			<td class="styIRS6197TableCellText"  style="background-color:lightgrey"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount"  style="border-right-width:0px">
				<xsl:call-template name="PopulateAmount">
          				<xsl:with-param name="TargetNode" select="$FormData/QrtrTotalTaxDue"/>
       			 </xsl:call-template>
			</td>
		</tr>
		<!--End Line 13-->
	</tbody>
</table>
</div>


<!--Begin Part 2 Header-->          
<div style="width:187mm">
<table cellspacing="0" style="border-color:black; border-style: solid;border-bottom-width:1px; border-top-width:0px; border-left-width:0px; border-right-width:0px;font-family:arial">
	<tbody>
		<tr style="height:2mm">
			<th colspan="3" style="width:187mm"></th>
		</tr>
		<tr>
			<th class="styPartName" style="width:14mm;font-size:9pt">Part II</th>
			<th class="styPartDesc" style="width:168mm; text-align:left;font-size:9pt">Identification of Models Subject to Gas Guzzler Tax</th>
			<th rowspan="2" style="width: 5mm;float:right;padding-right:0.25mm;vertical-align:bottom;text-align:right">
				<!-- button display logic -->
				<xsl:call-template name="SetDynamicTableToggleButton">
					<xsl:with-param name="TargetNode" select="$FormData/Models"/>
					<xsl:with-param name="containerHeight" select="5"/>
					<xsl:with-param name="containerID" select=" 'IOMctn' "/>
				</xsl:call-template>
				<!-- end button display logic -->
			</th>		
		</tr>
		<tr style="height:2mm">
			<th colspan="2" style="width:182mm"></th>
		</tr>
	</tbody>
</table>
</div>
<!--End Part 2 Header-->


<!--Begin Part 2 Table-->
<div class="styTableContainer" id="IOMctn">
<!-- print logic -->
<xsl:call-template name="SetInitialState"/>
<table class="styTable" cellspacing="0">
	<tbody>
		<tr style="height:12mm">
			<th class="styIRS6197TableCellHeaderText" style="width:17mm;font-weight:bold">Line no.<br/>from above</th>
			<th class="styIRS6197TableCellHeaderText" style="width:25mm;font-weight:bold">Fuel<br/>economy<br/>rating</th>
			<th class="styIRS6197TableCellHeaderText" style="width:25mm;font-weight:bold">No. of<br/>vehicles</th>
			<th class="styIRS6197TableCellHeaderText" style="width:120mm;border-right-width:0px;font-weight:bold">Make, model name, and model year</th>
		</tr>
		
		<xsl:for-each select="$FormData/Models">
		<xsl:if test="($Print != $Separated) or (count($FormData/Models) &lt;=5)">

			<tr style="height:8mm">
				<td class="styIRS6197TableCellText" style="width:17mm;font-weight:bold">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="LineNumber"/>
					</xsl:call-template>
				</td>
				<td class="styIRS6197TableCellAmount" style="width:25mm;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="FuelEconomyRating"/>
					</xsl:call-template>
				</td>
				<td class="styIRS6197TableCellAmount" style="width:25mm;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="NumberOfVehicles"/>
					</xsl:call-template>
				</td>
				<td class="styIRS6197TableCellText" style="width:120mm;border-right-width:0px;text-align:left;padding-left:1mm;font-size:7pt">
				<span style="width:1px"></span>
				<xsl:if test="VehicleMake">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="VehicleMake"/>
					</xsl:call-template>
					 <xsl:if test="VehicleModelName or VehicleModelYear">, </xsl:if>
				</xsl:if>
				<xsl:if test="VehicleModelName">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="VehicleModelName"/>
					</xsl:call-template>
					<xsl:if test="VehicleModelYear">, </xsl:if>
				</xsl:if>
				<xsl:if test="VehicleModelYear">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="VehicleModelYear"/>
					</xsl:call-template>
				</xsl:if>
				</td>
			</tr>
		</xsl:if>
		</xsl:for-each>
		<!--Filler rows-->
		<xsl:if test="count($FormData/Models) &lt; 1 or ((count($FormData/Models) &gt;5) and ($Print = $Separated))">
		<tr style="height:8mm">
			<td class="styIRS6197TableCellText" style="width:17mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellText" style="width:120mm;border-right-width:0px; text-align:left;padding-left:1mm;font-size:7pt">
				<span style="width:4px"/>
				<xsl:if test="((count($FormData/Models) &gt;5) and ($Print = $Separated))">
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormData/Models"/>
					</xsl:call-template>
				</xsl:if>
			</td>
		</tr>
		</xsl:if>
		<xsl:if test="count($FormData/Models) &lt; 2 or ((count($FormData/Models) &gt;5) and ($Print = $Separated))">
		<tr style="height:8mm">
			<td class="styIRS6197TableCellText" style="width:17mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellText" style="width:120mm;border-right-width:0px"><span style="width:1px"></span></td>
		</tr>
		</xsl:if>
		<xsl:if test="count($FormData/Models) &lt; 3 or ((count($FormData/Models) &gt;5) and ($Print = $Separated))">
		<tr style="height:8mm">
			<td class="styIRS6197TableCellText" style="width:17mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellText" style="width:120mm;border-right-width:0px"><span style="width:1px"></span></td>
		</tr>
		</xsl:if>
		<xsl:if test="count($FormData/Models) &lt; 4 or ((count($FormData/Models) &gt;5) and ($Print = $Separated))">
		<tr style="height:8mm">
			<td class="styIRS6197TableCellText" style="width:17mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellText" style="width:120mm;border-right-width:0px"><span style="width:1px"></span></td>
		</tr>
		</xsl:if>
		<xsl:if test="count($FormData/Models) &lt; 5 or ((count($FormData/Models) &gt;5) and ($Print = $Separated))">
		<tr style="height:8mm">
			<td class="styIRS6197TableCellText" style="width:17mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellAmount" style="width:25mm;"><span style="width:1px"></span></td>
			<td class="styIRS6197TableCellText" style="width:120mm;border-right-width:0px"><span style="width:1px"></span></td>
		</tr>
		</xsl:if>
		<!--End Filler Rows-->
		
	</tbody>
</table>
</div>
<!-- Set Initial Height of Above Table -->
<xsl:call-template name="SetInitialDynamicTableHeight">
	<xsl:with-param name="TargetNode" select="$FormData/Models"/>
	<xsl:with-param name="containerHeight" select="5"/>
	<xsl:with-param name="containerID" select=" 'IOMctn' "/>
</xsl:call-template>
<!-- End Set Initial Height of Above Table -->

<!--End Part 2 Table-->

<!--Begin Footer-->

<div style="width:187mm;clear:both;padding-top:1mm; float:none; clear: both;">
  <div style="width:113mm;font-weight:bold;" class="styGenericDiv">For Privacy Act and Paperwork Reduction Act Notice, see Form 720 instructions.</div>
  <div style="width:32mm;text-align:center;padding-left:2mm" class="styGenericDiv">Cat. No. 50011N</div>
  <div style = "float:right;" class="styGenericDiv">Form <span class="styBoldText">6197</span> (Rev. 10-2005)</div>
</div>
  <p class="pageEnd"></p>
<!-- End Footer-->

          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="float:none; clear: both;">
            <div class="styLeftOverTitle">
            Additional Data        
          </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
      
                
          <!-- JMI: Additional Data Table-->
          
          <!-- Begin Separated Data for Part II -->
          <xsl:if test="($Print = $Separated) and  (count($FormData/Models) &gt; 5)">
            <br/>
            <span class="styRepeatingDataTitle">Form 6197, Part II - Identification of Models Subject to Gas Guzzler Tax:</span>
            <table class="styDepTbl" style="font-size:7pt;">
              <thead class="styTableThead">
                <!-- JMI: Label the Column Headers -->
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col">Line no.<br/>from above</th>
                  <th class="styDepTblCell" scope="col">Fuel<br/>economy<br/>rating</th>
                  <th class="styDepTblCell" scope="col" style="padding-top:2mm">No. of<br/>vehicles</th>
                  <th class="styDepTblCell" scope="col"><br/>Make, model name, and model year</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$FormData/Models">
                  <tr style="border-color:black;">
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    
                    <!-- First Column -->
                    <td class="styTableCellCtr" style="width:17mm;">
                      <span style="width:4px"/>
                      <xsl:if test="LineNumber">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LineNumber"/>
                        </xsl:call-template>
                      </xsl:if>
                    </td>

                        <td class="styTableCell" style="width:25mm;padding-right:1mm;font-size:6pt">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="FuelEconomyRating"/>
                            <xsl:with-param name="SpanWidth" select="'width:4px;'"/>
                          </xsl:call-template>
                        </td>
 				<td class="styTableCell" style="width:25mm;padding-right:1mm;font-size:6pt">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="NumberOfVehicles"/>
                            <xsl:with-param name="SpanWidth" select="'width:4px;'"/>
                          </xsl:call-template>
                        </td>
                    <td class="styTableCellText" style="width:120mm;padding-left:1mm">
                      <span style="width:4px"/>
                        <xsl:if test="VehicleMake">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VehicleMake"/>
                          </xsl:call-template>
                          <xsl:if test="VehicleModelName or VehicleModelYear">, </xsl:if>
                          </xsl:if>

                        <xsl:if test="VehicleModelName">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VehicleModelName"/>
                          </xsl:call-template>
                           <xsl:if test="VehicleModelYear">, </xsl:if>
                          </xsl:if>

				<xsl:if test="VehicleModelYear">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="VehicleModelYear"/>
                          </xsl:call-template>
                          </xsl:if>

                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- End Separated Data for Part II -->
      
</form>
</body>  </html>
</xsl:template>





</xsl:stylesheet>