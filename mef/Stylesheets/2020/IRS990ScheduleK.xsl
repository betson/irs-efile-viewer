<?xml version="1.0" encoding="UTF-8"?>

<!-- Updated 4/14/2015 per Kisam 02084501 Part III 8b not displaying correctly when printing.by Robert L Jones  -->
<!-- Updated 4/14/2015 per Kisam 02091368 when 4 names in Part I Bond Issue wrap the output in Part II lines 1& 2  not displaying correctly when printing.by Robert L Jones  -->
<!-- Updated 4/14/2015 per Kisam 02094419 Part IV 4b not displaying correctly when printing.by Robert L Jones  -->
<!-- Updated 5/6/2015 per UWR 123023 IE11 Upgrade fixes by Robert L Jones  -->
<!-- Updated 6/3/2015 per IBM DEFECT 43183 UWR 123023 IE11 Upgrade fixes by Robert L Jones  -->
<!-- Updated 6/4/2015 per IBM DEFECT 43181 UWR 123023 IE11 Upgrade fixes by Robert L Jones  -->
<!-- Updated 6/23/2015 per Kisam 02091368 Part I wrapping caused Part II line 1 and 2 to misalign(print) UWR 123023 IE11 Upgrade fixes by Robert L Jones  -->
<!-- Updated 6/23/2015 per Kisam 02094419 Part IV 4b not displaying Print or rrd, UWR 123023 IE11 Upgrade fixes by Robert L Jones  -->
<!-- Updated 8/05/2015 per UWR 161465 Tax Year by Robert L Jones -->
<!-- Updated 8/28/2015 per IBM Defect 44630 by Robert L Jones  -->
<!-- Updated 8/28/2015 per IBM Defect 44810 by Robert L Jones  -->
<!-- Updated 10/22/2015 per PDF REVIEW by Robert L Jones 508 -->
<!-- Updated 5/03/2016 per UWR 177702 Tax Year by Robert L Jones -->
<!-- Updated 6/17/2016 per IBM Defect 46035 Part IV 4c and 5c wrapping percent sign by Robert L Jones  -->
<!-- Updated 6/17/2016 per IBM Defect 46036  Print on their sys causing problems at line 14 where it stays on one page while data goes to next page NPF on our sys by Robert L Jones  -->
<!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990ScheduleKStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleK"/>
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
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 990  Schedule K"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 990 ScheduleK CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS990ScheduleKStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS990ScheduleK">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="sty990ScheduleKBB" style="width:256mm;height:auto;">
						<div class="sty990ScheduleKFN">
							<div class="sty990ScheduleKFNum" style="width:30mm;"> Schedule K
      <br/>
								<span class="sty990ScheduleKFNum2">(Form 990)</span>
							
							<div class="sty990ScheduleKAgency" style="padding-top: 6mm">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
						</div>
						</div>
						<div class="sty990ScheduleKFTBox" style="width:180mm;border-right-width:1px;height:auto;">
							<div class="styMainTitle" style="padding-top:2mm">Supplemental Information on Tax-Exempt Bonds
</div>
							<span class="sty990ScheduleKFST">
								
			<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
								Complete if the organization answered "Yes" to Form 990, Part <span style="font-size: 7.75pt; font-weight:bold;">&#8549;</span>,  line 24a.  Provide descriptions, <br/>explanations, and any additional information in Part <span style="font-size: 7.75pt; font-weight:bold;">&#8549;</span>.  <br/>
   <img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
 Attach to Form 990. 
 <span style="width:10mm;"/><!--<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
             See separate instructions.--></span>
							<br/>
							<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
							<b>Go to <!--www.irs.gov/form990.--><a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for instructions and the latest information. 
							</b>
						</div>
						<div class="IRS990ScheduleK_FormYearBlock" style="height:auto;float:right">
							<!-- OMB No. -->
							<div class="IRS990ScheduleK_OMB" style="height:auto;">OMB No. 1545-0047</div>
							<!-- Tax Year -->
							<div class="IRS990ScheduleK_TaxYear" style="padding-top:0mm;padding-bottom:0;height:auto;">
								<span>20<span class="styTYColor">20</span>
								</span>
								<div class="sty990ScheduleKPartName" style="font-size:7pt;font-family:verdana;width:45mm;padding-top:0mm;padding-bottom:0mm;height:6mm">Open to Public <br/>Inspection</div>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div style="width:256mm;float:left;clear:left;">
						<div class="sty990ScheduleKBusinessName" style="width:200mm;height:auto;">Name of the organization
  <br/>
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty990ScheduleKIN" style="width:56mm;height:auto;">
							<span style="font-weight:bold;float:left; clear: none; margin-left: 1mm">Employer identification number</span>
							<br/>
							<span class="sty990ScheduleKINBox" style="font-weight:normal;font-size: 7pt; height:4mm;float:left; margin-left: 1mm; padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN HEADER   -->
					<!--   BEGIN HEADER   -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:256mm;border-top-width:1px;float:none ">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8544;</span> </div>
						<div class="styPartDesc" style="width:228.8mm;">Bond Issues
         
						</div>
		<!-- ================ Begin changes for Table ========================================== -->
					</div>
					<!--Part I  table -->
					<!--   <div class="styTableContainerLandscape "> -->
					<!-- print logic -->
					<!--<xsl:call-template name="SetInitialState"/>-->
					<!-- end -->
					<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm;display:table;">
						<thead>
							<tr>
								<!-- Column -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:50mm;text-align:center;vertical-align:top;" rowspan="2" colspan="2" scope="col">(a) <span class="styNormalText"> Issuer name</span>
								</th>
								<!-- Column b -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:28mm;border-right-width:1px;text-align:center;vertical-align:top;" rowspan="2" scope="col">(b) <span class="styNormalText"> Issuer EIN</span>
								</th>
								<!-- Column c -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:28mm;border-right-width:1px;text-align:center;vertical-align:top;" rowspan="2" scope="col">(c) <span class="styNormalText">  CUSIP #</span>
								</th>
								<!-- Column d -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:28mm;border-right-width:1px;text-align:center;vertical-align:top;" rowspan="2" scope="col">(d) <span class="styNormalText">  Date issued</span>
								</th>
								<!-- Column e -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:30mm;border-right-width:1px;text-align:center;vertical-align:top;" rowspan="2" scope="col">(e) <span class="styNormalText"> Issue price</span>
								</th>
								<!-- Column f -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:50mm;border-right-width:1px;text-align:center;vertical-align:top;" rowspan="2" scope="col">(f) <span class="styNormalText">  Description of purpose</span>
								</th>
								<!-- Column g -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:20mm;border-right-width:1px;text-align:center;vertical-align:top;" colspan="2" scope="col">(g) <span class="styNormalText">  Defeased </span>
								</th>
								<!-- Column h -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:20mm;border-right-width:1px;text-align:center;vertical-align:top;" colspan="2" scope="col"><span class="styNormalText"><b>(h) </b>  On<br/>behalf of <br/>issuer</span>
								</th>
								<!-- Column i -->
								<th class="styTableCellHeader" style="border-style: solid; border-color: black;width:20mm;border-right-width:0px;text-align:center;vertical-align:top;" colspan="2" scope="col"><span class="styNormalText"><b>(i) </b> Pool<br/>financing <br/></span>
								</th>
							</tr>
							<tr>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;">No</th>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;">No</th>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:10mm;border-right-width:0px;text-align:center;">No</th>
								
							</tr>
						</thead>
						<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
						<!-- If the print parameter is separated, but there are fewer elements than the container height (2) -->
						<xsl:if test="($Print != $Separated) or count($FormData/TaxExemptBondsIssuesGrp) &lt;= 5">
							<xsl:for-each select="$FormData/TaxExemptBondsIssuesGrp">
								<tr>
									<xsl:choose>
										<xsl:when test="position() = 1">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;font-weight:bold;vertical-align:top;">A</td>
										</xsl:when>
										<xsl:when test="position() = 2">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid; font-weight:bold;vertical-align:top;">B</td>
										</xsl:when>
										<xsl:when test="position() = 3">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid; font-weight:bold;vertical-align:top;">C</td>
										</xsl:when>
										<xsl:when test="position() = 4">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid; font-weight:bold;vertical-align:top;">D</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid; font-weight:bold;vertical-align:top;"/>
										</xsl:otherwise>
									</xsl:choose>
									<!-- Identifier -->
									<!-- Issuer Name -->
									<td class="styTableCell " style=" width:50mm;text-align:left;vertical-align:top;padding-left:4mm;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IssuerName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IssuerName/BusinessNameLine2Txt"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Employer Identification Number -->
									<td class="styTableCell " style="text-align:center;vertical-align:top;width:28mm;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="BondIssuerEIN"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- CUSIP # -->
									<td class="styTableCell " style="text-align:center;vertical-align:top;width:28mm;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CUSIPNum"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Date Issued  -->
									<td class="styTableCell " style="text-align:center;vertical-align:top;width:28mm;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="BondIssuedDt"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Issue Price  -->
									<td class="styTableCell " style="text-align:right;vertical-align:top;width:30mm;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="IssuePriceAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Description of Purpose-->
									<td class="styTableCell " style="width:50mm;text-align:left;vertical-align:top;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PurposeDesc"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Defeased  -->
									<td class="styTableCell " style="width:10mm;text-align:center;vertical-align:top;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="DefeasedInd"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<td class="styTableCell " style="width:10mm;text-align:center;vertical-align:top;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="DefeasedInd"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- On Behalf of Issuer-->
									<td class="styTableCell " style="width:10mm;text-align:center;vertical-align:top;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="OnBehalfOfIssuerInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell " style="width:10mm;text-align:center;vertical-align:top;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="OnBehalfOfIssuerInd"/>
										</xsl:call-template>
									</td>
									<!-- Pool Financing-->
									<td class="styTableCell " style="width:10mm;text-align:center;vertical-align:top;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="PoolFinancingInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell " style="width:10mm;border-right:0px;text-align:center;vertical-align:top;padding-right:4mm;border-style: solid; border-color: black;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="PoolFinancingInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<!-- Display the first blank row if the data set is empty. If the number of data elements is more than 2 -->
						<!-- and the print option is separated, display a message in the first row directing the user to the -->
						<!-- additional data table -->
					</table>
					<!--   END Part 1   -->
					<!--   Begin Part II   -->
					<div class="styBB" style="width: 256mm;border-bottom-width:0px; border-top-width:0px;float:none;">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8545;</span></div>
						<div class="styPartDesc">Proceeds 
						</div>
					</div>
				
			<xsl:variable name="pos">1</xsl:variable>
					
						<!-- end -->
						<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both;display:table;">
							<thead>
								<tr>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width: 128mm;border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
										<span style="width:2px"/>
									</th>
									<th class="styTableCellHeader " scope="col" colspan="2" style=" border-style: solid; border-color: black; border-top-width: 1px;">A </th>
									<th class="styTableCellHeader " scope="col" colspan="2" style=" border-style: solid; border-color: black;border-top-width: 1px;">B</th>
									<th class="styTableCellHeader " scope="col" colspan="2" style=" border-style: solid; border-color: black;border-top-width: 1px;">C</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style=" border-style: solid; border-color: black;border-top-width: 1px;border-right-width: 0px;">D</th>
								<!--	<th class="styTableCellHeader" scope="col" colspan="2" style="border-right:0px;">E</th>-->
								</tr>
							</thead>
						
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">1</span>
           Amount of bonds retired
          <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..................  </span>
							
								</td>
								
						
								<td class="styTableCell" colspan="2" style=" text-align:right;border-style: solid; border-color: black;border-left-width: 1px; border-right-width: 1px; ">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/RetiredAmt"/>
									</xsl:call-template>
									
								</td>
						
							
								<td class="styTableCell" colspan="2" style="text-align:right;border-style: solid; border-color: black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/RetiredAmt"/>
									</xsl:call-template>
								</td>
						
						
								<td class="styTableCell" colspan="2" style="text-align:right;border-style: solid; border-color: black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/RetiredAmt"/>
									</xsl:call-template>
								</td>
							
							
								<td class="styTableCell" colspan="2" style="text-align:right;border-style: solid; border-color: black;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/RetiredAmt"/>
									</xsl:call-template>
								</td>
								
						
							
								
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">2</span>
            Amount of bonds legally defeased
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/BondDefeasedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/BondDefeasedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/BondDefeasedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/BondDefeasedAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;text-align:right;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/AmountBondDefeased"/>
									</xsl:call-template>
								</td>
-->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">3</span>
            Total proceeds of issue
             <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..................  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/TotalProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/TotalProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/TotalProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/TotalProceedsAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;text-align:right;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/TotalProceeds"/>
									</xsl:call-template>
								</td>
-->
							</tr>
							<!-- Line4 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">4</span>
           Gross proceeds in reserve funds
             <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/InReserveFundAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/InReserveFundAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/InReserveFundAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/InReserveFundAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/AmountInReserveFund"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<!-- Line 5 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">5</span>
           Capitalized interest from proceeds
             <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/CapitalizedInterestAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/CapitalizedInterestAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/CapitalizedInterestAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/CapitalizedInterestAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/CapitalizedInterest"/>
									</xsl:call-template>
								</td>
                  -->
							</tr>
							<!-- Line 6 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">6</span>
          Proceeds in refunding escrows
             <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">...............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/RefundingEscrowAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/RefundingEscrowAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/RefundingEscrowAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/RefundingEscrowAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/RefundingEscrow"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
							<!-- Line7 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">7</span>
            Issuance costs from proceeds
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">............... </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/IssuanceCostsFromProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/IssuanceCostsFromProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/IssuanceCostsFromProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/IssuanceCostsFromProceedsAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/IssuanceCostsFromProceeds"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<!-- Line 8 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">8</span>
          Credit enhancement from proceeds 
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/CreditEnhancementAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/CreditEnhancementAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/CreditEnhancementAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/CreditEnhancementAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/CreditEnhancement"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
							<!-- Line9 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">9</span>
          Working capital expenditures from proceeds
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/WorkingCapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/WorkingCapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/WorkingCapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/WorkingCapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/WorkingCapitalExpenditures"/>
									</xsl:call-template>
								</td>
              -->
							</tr>
							<!-- Line 10 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">10</span>
          Capital expenditures from proceeds
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/CapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/CapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/CapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/CapitalExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/CapitalExpenditures"/>
									</xsl:call-template>
								</td>
              -->
							</tr>
							<!-- Line 11 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">11</span>
         Other spent proceeds
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/OtherSpentProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/OtherSpentProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/OtherSpentProceedsAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/OtherSpentProceedsAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/OtherSpentProceeds"/>
									</xsl:call-template>
								</td>
              -->
							</tr>
							<!-- Line 12 -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">12</span>
          Other unspent proceeds
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/UnspentAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/UnspentAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/UnspentAmt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/UnspentAmt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/AmountUnspent"/>
									</xsl:call-template>
								</td>
              -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black;width:128mm; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">13</span>
           Year of substantial completion
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center; border-style: solid; border-color: black;border-left-width: 1px;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/SubstantialCompletionYr"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center; border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[2]/SubstantialCompletionYr"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center; border-style: solid; border-color: black;border-left-width: 0px;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[3]/SubstantialCompletionYr"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center; border-style: solid; border-color: black;border-left-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[4]/SubstantialCompletionYr"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellText" colspan="2" style="border-right:0px;text-align:center">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/YearOfSubstCompletion"/>
									</xsl:call-template>
								</td>
                 -->
								<tr>
									<th class="styTableCellText" scope="col" style="border-style: solid; border-color: black;width:128mm;border-right-width:0px;border-bottom-width:1px;">
										
									</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm;border-left-width: 1px;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:16mm;border-right-width: 0px;">No</th>
									<!--
									<th class="styTableCellHeader" scope="col" style="width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                   -->
								</tr>
														
								<!-- Line 14 -->
								<tr>
									<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:1mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;padding-bottom:0mm;">14</span>
         Were the bonds issued as part of a current refunding issue of tax-exempt <br/>bonds (or, if issued prior to 2019, a current refunding issue)?
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">........</span>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 1px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
								
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
               
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
									
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/RefundingTaxExemptBondsInd"/>
										</xsl:call-template>
									</td>
									
		
								</tr>
								<!-- Line 15 -->
								<tr>
									<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">15</span>
         Were the bonds issued as part of an advance refunding issue of taxable <br/>bonds (or, if issued prior to 2019, an advance refunding issue)?
          <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">........</span>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 1px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
                
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/RefundingTaxableBondsInd"/>
										</xsl:call-template>
									</td>
									
								</tr>
								<!-- Line 16 -->
								<tr>
									<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">16</span>
         Has the final allocation of proceeds been made?
          <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..........</span>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 1px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/FinalAllocationMadeInd"/>
										</xsl:call-template>
									</td>
									</tr>
								<!-- Line 17 -->
								<tr>
									<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">17</span>
        Does the organization maintain adequate books and records to support the final
         allocation of proceeds?
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..................  </span>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 1px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[1]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 1]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 2]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="border-left-width: 0px;border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsProceedsGrp[$pos + 3]/AdequateBooksAndRecMaintInd"/>
										</xsl:call-template>
									</td>
									
								</tr>
							</tr>
						</table>
					
					<!--   Begin Part III   -->
					<div class="styBB" style="width: 256mm;border-bottom-width:0px; border-top-width:0px;float:none;display:table;display:inline; ">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8546;</span></div>
						<div class="styPartDesc">Private Business Use  
						</div>
					
					<!--<div class="styTableContainerLandscape " id="p3TbCtnr"> -->
					<!-- print logic -->
					<!-- <xsl:call-template name="SetInitialState"/>-->
					<!-- end -->
					<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm;display:table;">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width: 128mm"/>
						        <th class="styTableCellHeader " scope="col" colspan="2" style="border-left-width: 0px;border-style: solid; border-color: black;border-top-width:1px;">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-left-width: 0px;border-style: solid; border-color: black;border-top-width:1px;">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-left-width: 0px;border-style: solid; border-color: black;border-top-width:1px;">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="border-left-width: 0px;border-style: solid; border-color: black;border-top-width:1px;border-right-width: 0px;">D</th>
								
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="border-right:0px">E</th>-->
							</tr>
							<tr>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">Yes</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">No</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">Yes</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">No</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">Yes</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">No</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;">Yes</th>
						<th class="styTableCellHeader " scope="col" style="border-left-width:0px;width:16mm;border-style: solid; border-color: black;border-right-width: 0px;">No</th>
								
							</tr>
					
												
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;padding-top:0mm;">1</span>
        Was the organization a partner in a partnership, or a member of an LLC, which owned property financed by tax-exempt bonds?
          <!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
							
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
								
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
								
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/OwningBondFinancedPropertyInd"/>
									</xsl:call-template>
								</td>
							
								</tr>
									</thead>
						<tfoot/>
						<tbody>
						
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width:128mm;padding-top:.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">2</span>
         Are there any lease arrangements that may result in private business use of bond-financed property?
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">...............</span>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;border-top:1px;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;border-top:1px;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;border-top:1px;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;border-top:1px;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/AnyLeaseArrangementsInd"/>
									</xsl:call-template>
								</td>
								</tr>
						</tbody>
						
					</table>
					</div>
					<!--   BEGIN FORM FOOTER  -->
               <div style="width:256mm;float:none;clear:both;border-top:solid 0px" class="pageEnd">
						<div class="styGenericDiv" style="width:140mm;font-weight:bold">For Paperwork Reduction Act Notice, see the Instructions for Form 990. </div>
						<div class="styGenericDiv" style="width:25mm;">Cat. No. 50193E</div>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText">Schedule K (Form 990) 2020</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
				 <p style="page-break-before: always"/>
					<div class="styBB" style="width:256mm; float: none; clear:none;border-bottom-width:1px">
						<div style="float:left"> Schedule K (Form 990) 2020</div>
						<div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">2</span>
						</div>
					</div>
					<!--   Begin Part III   Continued-->
					<div class="styBB" style="width: 256mm;border-bottom-width:0px;float:none;">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8546;</span></div>
						<div class="styPartDesc">Private Business Use  <span style="font:italic;font-weight:normal">(Continued)</span>
						</div>
					</div>
					<!-- end -->
					<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width: 128mm"/>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px;border-top-width:1px;" colspan="2">A</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px;border-top-width:1px;" colspan="2">B</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px;border-top-width:1px;" colspan="2">C</th>
								<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;border-left-width:0px;border-top-width:1px;border-right-width: 0px;" colspan="2">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px; width:16mm;border-right-width: 0px;">No</th>
								<!--
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                 -->
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								<td class="styTableCellText" style=" border-style: solid; border-color: black;border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">3a</span>
        Are there any management or service contracts that may result in private business use of bond-financed property?
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/MgmtContractBondFincdPropInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<tr>
								<td class="styTableCellText" style=" border-style: solid; border-color: black;border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">b</span>
              If "Yes" to line 3a, does the organization routinely engage bond counsel or other outside counsel to review any management or service contracts relating to the  
              financed property?

        <!--   <span class="styNoAudioRead">-->
										
 
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/EngageBondCounselContractsInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;height:7.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;height:7.5mm">c</span>
          Are there any research agreements that may result in private business use of bond-financed property?
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/AnyResearchAgreementsInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
							<!-- end yes/no boxes begin percentage -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;height:7.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;height:7.5mm">d</span>
          If "Yes" to line 3c, does the organization routinely engage bond counsel or other outside counsel to review any research agreements relating to the financed property?
           
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/EngageBondCounselResearchInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
							<!-- end yes/no boxes begin percentage -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;height:7.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:7.5mm">4</span>
 Enter the percentage of financed property used in a private business use by entities other than a section 501(c)(3) organization or a state or local government       
 <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">....</span>



<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>

								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
<!--Leave this here, every other year they take out the hard code % sign	<xsl:call-template name="PopulatePercent">-->
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/PrivateBusUseByOthersPct"/>
									</xsl:call-template><!--% Percent sign hardcoded while PopulateAmount used. IBM starts testing with 0000.0000 numbers and now must change to PopulatePercent and lose % sign-->
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/PrivateBusUseByOthersPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/PrivateBusUseByOthersPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right;border-right-width: 0px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/PrivateBusUseByOthersPct"/>
									</xsl:call-template>
								</td>
								
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;border-right:0px;text-align:right;padding-right:4mm">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/PrcntgePrvtBusinessUseByOthers"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:10mm">5</span>
 Enter the percentage of financed property used in a private business use as a result of unrelated trade or business activity carried on by your organization, another section 501(c)(3) organization, or a state or local government
 <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.........  </span>
<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
         
</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/PrivateBusConcerningUBIPct"/>
									</xsl:call-template><!--% Percent sign hardcoded while PopulateAmount used. IBM starts testing with 0000.0000 numbers and now must change to PopulatePercent and lose % sign-->
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/PrivateBusConcerningUBIPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/PrivateBusConcerningUBIPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right;border-right-width: 0px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/PrivateBusConcerningUBIPct"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/PercentageOfPrvtBusinessReUBI"/>
									</xsl:call-template>
								</td>
                  -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">6</span>
        Total of lines 4 and 5
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/TotalPrivateBusinessUsePct"/>
									</xsl:call-template><!--% Percent sign hardcoded while PopulateAmount used. IBM starts testing with 0000.0000 numbers and now must change to PopulatePercent and lose % sign-->
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/TotalPrivateBusinessUsePct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/TotalPrivateBusinessUsePct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right;border-right-width: 0px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/TotalPrivateBusinessUsePct"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/TotalPrivateBusinessUse"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							    <tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">7</span>
    Does the bond issue meet the private security or
             payment test?  

     
                          
  <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">...</span>
 
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;border-left-width: 0px;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/BondIssMeetPrvtSecPymtTestInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/PostIssuanceComplianceProcdrs"/>
									</xsl:call-template>
									<span class="styTableCellPad "/>
								</td>
                 -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">8a</span>
    Has there been a sale or disposition of any of the bond-financed property to a nongovernmental person other than a 501(c)(3) organization since the bonds were <span class="styNormalText" style="padding-left:9mm;">issued?</span>                     
 <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/ChangeInUseBondFinancedPropInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
									<span class="styTableCellPad "/>
								</td>
                 -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">b</span>
         If "Yes" to line 8a, enter the percentage of bond-financed property sold or disposed of.
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/ChangeInUseBondFinancedPropPct"/>
									</xsl:call-template><!--% Percent sign hardcoded while PopulateAmount used. IBM starts testing with 0000.0000 numbers and now must change to PopulatePercent and lose % sign-->
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/ChangeInUseBondFinancedPropPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/ChangeInUseBondFinancedPropPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:right;border-right-width: 0px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/ChangeInUseBondFinancedPropPct"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">c</span>
    If "Yes" to line 8a, was any remedial action taken pursuant to Regulations sections 1.141-12 and 1.145-2?                    
  <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.............  </span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/RemedialActionTakenInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
									<span class="styTableCellPad "/>
								</td>
                 -->
             
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:0px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">9</span>
   Has the organization established written procedures to ensure that all nonqualified bonds of the issue are remediated in accordance with the requirements under <br></br>
     <span style="padding-left:9mm">Regulations sections 1.141-12 and 1.145-2? </span>
                                 
 <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">........  </span>
 


								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[1]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 1]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 2]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsPrivateBusUseGrp[$pos + 3]/ProcsNonqualifiedBondRemdtdInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 4]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
									<span class="styTableCellPad "/>
								</td>
                 -->
							</tr>
						</tbody>
					</table>
					<!--   Begin Part IV  -->
					<div class="styBB" style="width: 256mm;border-bottom-width:0px;border-top-width:0px;float:none ">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8547;</span></div>
						<div class="styPartDesc">Arbitrage 
						</div>
					</div>
					
					<!-- end -->
					<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both;display:table;">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:96mm"/>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px;">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px;">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px;">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px;border-right-width: 0px;">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm;border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm;border-right-width: 0px;">No</th>
								<!--
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                  -->
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							
						
							<tr>
								
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm; ">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">1</span>
        Has the issuer filed Form 8038-T, Arbitrage Rebate, Yield Reduction and
Penalty in Lieu of Arbitrage Rebate?   
         <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">...  </span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/Form8038TFiledInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
                   -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">2</span>
       If "No" to line 1, did the following apply?
        <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.... </span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;">
								
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black; border-bottom:0px;width:16mm;text-align:center;border-right-width: 0px;">
									</td>
								
								
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">a</span>
       Rebate not due yet?  
        <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.......</span>

          
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width:1px;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/RebateNotDueYetInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">b</span>
       Exception to rebate?   
       <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">........</span>


								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/ExceptionToRebateInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">c</span>
      No rebate due? 
     <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.........</span>


                                  </td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/NoRebateDueInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
													<tr>
							<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
							 <span class="styNormalText" style="padding-left:9mm;"/>If "Yes" to line 2c, provide in Part <span style="font-size: 8pt;">&#8549;</span> the date the rebate<br></br>
                             <span class="styNormalText" style="padding-left:9mm;"/>computation was performed   
  <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">......</span>

          
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">3</span>
       Is the bond issue a variable rate issue?
         <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.....</span>

								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-top-width: 0px;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/VariableRateIssueInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							<tr>
								
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:88mm;padding-top:0mm;float:none;clear:both">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">4a</span>
         Has the organization or the governmental issuer entered into a qualified hedge with respect to the bond issue?
          								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/HedgeIdentifiedInBksAndRecInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							<!-- end yes/no boxes begin percentage -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">b</span>
        Name of provider
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..........</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/HedgeProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/HedgeProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/HedgeProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/HedgeProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/HedgeProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/HedgeProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left;border-right-width: 0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/HedgeProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/HedgeProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;border-right:0px;text-align:left;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfHedgeProvider/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfHedgeProvider/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">c</span>
        Term of hedge
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.........</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/TermOfHedgePct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;" colspan="2">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/TermOfHedgePct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/TermOfHedgePct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;border-right-width: 0px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/TermOfHedgePct"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/TermOfHedge"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							
							
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;height:4.5mm">d</span>
        Was the hedge superintegrated?
          <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">......</span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/SuperintegratedHedgeInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;height:4.5mm">e</span>
        Was the hedge terminated?
         <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">........</span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/HedgeTerminatedInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/HedgeTerminated"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							
						</tbody>
					</table>
					
					<!-- Footer -->
					<div style="width:256mm;float:none;clear:both;padding-top:.5mm;border-top:solid 0px" class="pageEnd">
						<div class="styGenericDiv" style="width:95mm;"/>
						<div class="styGenericDiv" style="width:25mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule K (Form 990) 2020</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
		<!-- =========================================================================-->
		 <p style="page-break-before: always"/>
					<!--  Page header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
						<div style="width:90mm;" class="styGenericDiv">Schedule K (Form 990) 2020</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</div>
					</div>
							
							<!--   Begin Part IV  continued-->
					<div class="styBB" style="width: 256mm;border-bottom-width:0px;border-top-width:0px;float:none ">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8547;</span></div>
						<div class="styPartDesc">Arbitrage <span style="font:italic;font-weight:normal">(Continued)</span>
						</div>
					</div>
					<!-- end -->
					<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-style: solid; border-color: black;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:96mm"/>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px;border-right-width: 0px;">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm;border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm;border-right-width: 0px;">No</th>
								
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">5a</span>
        Were gross proceeds invested in a guaranteed investment contract (GIC)?
          <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; "></span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/GrossProceedsInvestedInGICInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-right:0px;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
                   -->
							</tr>
							<!-- end yes/no boxes begin percentage -->
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">b</span>
         Name of provider
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">..........</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/GICProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/GICProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/GICProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/GICProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/GICProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/GICProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="border-style: solid; border-color: black;width:32mm;text-align:left;border-right-width: 0px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/GICProviderName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/GICProviderName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;border-right:0px;text-align:left;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfGICProvider/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfGICProvider/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">c</span>
               Term of GIC
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.........</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/TermOfGICPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/TermOfGICPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/TermOfGICPct"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;border-style: solid; border-color: black;width:38mm;text-align:right;border-right-width: 0px;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/TermOfGICPct"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="font-size:6pt;width:38mm;border-right:0px;text-align:right;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/TermOfGIC"/>
									</xsl:call-template>
								</td>
                   -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;height:4.5mm">d</span>
        Was the regulatory safe harbor for establishing the fair market value of the GIC satisfied?
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">........</span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/RegulatorySafeHarborStsfdInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
					
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">6</span>
        Were any gross proceeds invested beyond an available temporary period?
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; "></span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/GrossProceedsInvestedInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
							<tr>
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">7</span>
        Has the organization established written procedures to monitor the requirements of section 148?
 <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">...</span>								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[1]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 1]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 2]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxExemptBondsArbitrageGrp[$pos + 3]/WrittenProcToMonitorReqsInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
               -->
							</tr>
						</tbody>
					</table>
					
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="16"/>
						<xsl:with-param name="containerID" select="'p2TbCtnr'"/>
					</xsl:call-template>
					
					
					<!-- Part V Procedures To Undertake Corrective Action -->
					<div class="styBB" style="width: 256mm;border-color: black;border-bottom-width:0px;border-top-width: 0px;float:none;">
						<div class="styPartName">Part <span style="font-size: 8.75pt;">&#8548;</span></div>
						<div class="styPartDesc">Procedures To Undertake Corrective Action
						</div>
					</div>
					
<table class="styTableContainerLandscape" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both;display:table;">
						<thead>
							<tr>
								<th class="styTableCell" rowspan="2" scope="col" style="border-style: solid; border-color: black;border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:96mm">---------------------------------------------------------------------------------------------------------------</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="border-style: solid; border-color: black;width:32mm;border-top-width:1px;border-right-width: 0px;">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm;border-right:0px">E</th>-->
							</tr>
							<tr>
							
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;border-left-width:0px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="border-style: solid; border-color: black;width:16mm;border-right-width: 0px;">No</th>
								<!--
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                  -->
							</tr>
						</thead>
						<tfoot/>
						<tbody>
						
							<tr>
								
								<td class="styTableCellText" style="border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-bottom:4mm;height:10mm;font-weight:7pt;vertical-align:center;"></span>
         Has the organization established written procedures to ensure that violations of federal tax requirements are timely identified and corrected through the voluntary closing agreement program if self-remediation is not available under applicable regulations?   
            <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; "></span>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[1]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[1]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[$pos + 1]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[$pos + 1]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[$pos + 2]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[$pos + 2]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[$pos + 3]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="border-style: solid; border-color: black;width:16mm;text-align:center;border-right-width: 0px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/ProceduresCorrectiveActionGrp[$pos + 3]/ProceduresCorrectiveActionInd"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 4]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 4]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
                   -->
							</tr>
					
						</tbody>
					</table>
					<!--   END LINE 1   -->
					


				<!-- Part VI Supplemental Information -->
					<div class="styGenericDiv" style="width: 256mm;">
						<div class="styPartName" style="width:18mm;">Part <span style="font-size: 8.75pt;">&#8549;</span></div>
						<div class="styPartDesc" style="width:236mm;">
Supplemental Information. <span class="styNormalText"> Provide additional information for responses to questions on Schedule K. (See instructions).</span>
</div>


<span style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
									<xsl:with-param name="containerHeight" select="20"/>
									<xsl:with-param name="containerID" select="'SUPctn'"/>
								</xsl:call-template>
							</span>
						</div>
					
					<div class="styTableContainerLandscape " style="width: 256mm;  border-bottom-width: 1px;display:table;" id="SUPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black;width:256mm" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
				<!--<th class="styDepTblCell" style="border-right-width: 0px;width:50mm" scope="col">Identifier</th>-->
				<th class="styDepTblCell" style="border-right-width: 0px;width:50mm" scope="col">Return Reference</th>
				<th class="styDepTblCell" style="border-right-width: 0px;width:206mm" scope="col">Explanation</th>
								</tr>
							</thead>
							<tfoot/>
							
               
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or count($FormData/SupplementalInformationDetail) &lt;= 20">
									<xsl:for-each select="$FormData/SupplementalInformationDetail">
										<tr>
										<!--	<td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IdentifierTxt"/>
												</xsl:call-template>
											</td>-->
											<td class="styTableCell" style="text-align:left; vertical-align:top; border-right-width: 1px; width: 50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 206mm;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
<!-- For future use to hardcode filler lines in Part VI<xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 1">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 2">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  3">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  4">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  5">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  6">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  7">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  8">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt;  9">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 10">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 11">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 12">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 13">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 14">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 15">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 16">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($FormData/Form990ScheduleKPartVI) &lt; 17">
                  <xsl:call-template name="IRS990ScheduleKPartVITableFillerRow"/>
                </xsl:if>-->
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
						<xsl:with-param name="containerHeight" select="20"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>
										
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty990ScheduleKFormFooter" style="padding-top:1mm">
						<div style="width:140mm;font-weight:bold; float: left; clear: none;"/>
						<div style="width:60mm;font-weight:normal; float: left; clear: none;"/>
						<div style="width:56mm;text-align:center;font-weight:bold;  float: right; clear: none;"> Schedule K (Form 990) 2020</div>
					</div>
					<!--     END FORM FOOTER   -->
					<!--     END FORM FOOTER   -->
					<div class="pageEnd"/>
					 <p style="page-break-before: always"/> 
					
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
      Additional Data        
    </div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
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