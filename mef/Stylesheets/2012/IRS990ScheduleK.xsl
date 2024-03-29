<?xml version="1.0" encoding="UTF-8"?>
<!-- Created by Sandy Cram and last modified 11/26/2008-->
<!-- This stylesheet was modified on 7/08/2009 for TY2009/PY2010 changes by Sandy Cram-->
 <!-- Modified by Sandy Cram 12/28/2009 for IBM defect & ITAMS #6539622 -->
<!-- Modified by Sandy Cram 2/8/2009 for ITAMS #6539622 (again)-->
<!-- Modified by Robert Jones 8/10/2010 for UWR BSP-101319-->
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Updated 1/21/2012 per UWR 52085 by Robert L Jones -->
<!-- Updated 7/05/2012 per UWR 58215 by Robert L Jones -->
<!-- Last modified on 09/07/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
<!-- Last modified on 10/02/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
<!-- Last modified on 10/02/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
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
		<html>
			<head>
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
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="sty990ScheduleKBB" style="width:256mm;height:18mm">
						<div class="sty990ScheduleKFN">
							<div class="sty990ScheduleKFNum" style="width:29mm;"> Schedule K
      <br/>
								<span class="sty990ScheduleKFNum2">(Form 990)</span>
							</div>
							<div class="sty990ScheduleKAgency" style="padding-top: 8mm">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
						</div>
						<div class="sty990ScheduleKFTBox" style="width:180mm;border-right-width:1px;height:18mm">
							<div class="styMainTitle" style="padding-top:4mm">Supplemental Information on Tax Exempt Bonds
</div>
							<span class="sty990ScheduleKFST">
								
			<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
								Complete if the organization answered "Yes" to Form 990, Part IV,  line 24a.  Provide descriptions, <br/>explanations, and any additional information in Part VI.  <br/>
   <img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
 Attach to Form 990. 
 <span style="width:10mm;"/><img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
             See separate instructions.</span>
							<br/>
						</div>
						<div class="IRS990ScheduleK_FormYearBlock" style="height:18mm;float:right">
							<!-- OMB No. -->
							<div class="IRS990ScheduleK_OMB">OMB No. 1545-0047</div>
							<!-- Tax Year -->
							<div class="IRS990ScheduleK_TaxYear" style="padding-top:0mm;padding-bottom:0;">
								<span>20<span class="styTYColor">12</span>
								</span>
								<div class="sty990ScheduleKPartName" style="font-size:7pt;font-family:verdana;width:45mm;padding-top:0mm;padding-bottom:0mm;height:7mm">Open to Public <br/>Inspection</div>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div style="width:256mm;float:left;clear:left;">
						<div class="sty990ScheduleKBusinessName" style="width:200mm;height:30px;">Name of the organization
  <br/>
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty990ScheduleKIN" style="width:56mm;height:30px;">
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
					<div class="styBB" style="width:256mm;border-top-width:1px">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:228.8mm;">Bond Issues
         
						</div>
		<!-- ================ Begin changes for Table ========================================== -->
					</div>
					<!--Part I  table -->
					<!--   <div class="styTableContainerLandscape "> -->
					<!-- print logic -->
					<!--<xsl:call-template name="SetInitialState"/>-->
					<!-- end -->
					<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm;">
						<thead>
							<tr>
								<!-- Column -->
								<th class="styTableCellHeader" style="width:50mm;" rowspan="2" colspan="2" scope="col">(a)<span class="styNormalText"> Issuer name</span>
								</th>
								<!-- Column b -->
								<th class="styTableCellHeader" style="width:28mm;border-right-width:1px" rowspan="2" scope="col">(b)<span class="styNormalText"> Issuer EIN</span>
								</th>
								<!-- Column c -->
								<th class="styTableCellHeader" style="width:28mm;border-right-width:1px;" rowspan="2" scope="col">(c)<span class="styNormalText">  CUSIP #</span>
								</th>
								<!-- Column d -->
								<th class="styTableCellHeader" style="width:28mm;border-right-width:1px;" rowspan="2" scope="col">(d)<span class="styNormalText">  Date issued</span>
								</th>
								<!-- Column e -->
								<th class="styTableCellHeader" style="width:30mm;border-right-width:1px;" rowspan="2" scope="col">(e)<span class="styNormalText"> Issue price</span>
								</th>
								<!-- Column f -->
								<th class="styTableCellHeader" style="width:50mm;border-right-width:1px;" rowspan="2" scope="col">(f)<span class="styNormalText">  Description of purpose</span>
								</th>
								<!-- Column g -->
								<th class="styTableCellHeader" style="width:20mm;border-right-width:1px;" colspan="2" scope="col">(g)<span class="styNormalText">  Defeased </span>
								</th>
								<!-- Column h -->
								<th class="styTableCellHeader" style="width:20mm;border-right-width:1px;" colspan="2" scope="col">(h)<span class="styNormalText">  On<br/>behalf of <br/>issuer</span>
								</th>
								<!-- Column i -->
								<th class="styTableCellHeader" style="width:20mm;border-right-width:0px;" colspan="2" scope="col">(i)<span class="styNormalText"> Pool<br/>financing <br/></span>
								</th>
							</tr>
							<tr>
								<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:1px;text-align:center;">No</th>
								<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:1px;text-align:center;">No</th>
								<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:0px;text-align:center;">No</th>
								
							</tr>
						</thead>
						<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
						<!-- If the print parameter is separated, but there are fewer elements than the container height (2) -->
						<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleKPartI) &lt;= 5">
							<xsl:for-each select="$FormData/Form990ScheduleKPartI">
								<tr>
									<xsl:choose>
										<xsl:when test="position() = 1">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;
                 font-weight:bold">A</td>
										</xsl:when>
										<xsl:when test="position() = 2">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;
font-weight:bold">B</td>
										</xsl:when>
										<xsl:when test="position() = 3">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;
font-weight:bold">C</td>
										</xsl:when>
										<xsl:when test="position() = 4">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;
font-weight:bold">D</td>
										</xsl:when>
										<!--
										<xsl:when test="position() = 5">
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;
font-weight:bold">E</td>
										</xsl:when>
                    -->
										<xsl:otherwise>
											<td class="sty990ScheduleKLNLeftNumBoxBB" style="border-bottom:1px solid;
font-weight:bold"/>
										</xsl:otherwise>
									</xsl:choose>
									<!-- Identifier -->
									<!-- Issuer Name -->
									<td class="styTableCell " style=" width:50mm;text-align:left;padding-left:4mm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IssuerName/BusinessNameLine1"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IssuerName/BusinessNameLine2"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Employer Identification Number -->
									<td class="styTableCell " style="text-align:center;width:28mm;">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="IssuerEIN"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- CUSIP # -->
									<td class="styTableCell " style="text-align:center;width:28mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CUSIPNumber"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Date Issued  -->
									<td class="styTableCell " style="text-align:center;width:28mm;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="DateIssued"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Issue Price  -->
									<td class="styTableCell " style="text-align:right;width:30mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="IssuePrice"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Description of Purpose-->
									<td class="styTableCell " style="width:50mm;text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DescriptionOfPurpose"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- Defeased  -->
									<td class="styTableCell " style="width:10mm;text-align:center;">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="Defeased"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<td class="styTableCell " style="width:10mm;text-align:center;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="Defeased"/>
										</xsl:call-template>
										<span class="styTableCellPad "/>
									</td>
									<!-- On Behalf of Issuer-->
									<td class="styTableCell " style="width:10mm;text-align:center;">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="OnBehalfOfIssuer"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell " style="width:10mm;text-align:center;">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="OnBehalfOfIssuer"/>
										</xsl:call-template>
									</td>
									<!-- Pool Financing-->
									<td class="styTableCell " style="width:10mm;text-align:center;">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="PoolFinancing"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell " style="width:10mm;border-right:0px;text-align:center;padding-right:4mm">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="PoolFinancing"/>
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
					<div class="styBB" style="width: 256mm;border-bottom-width:1px; border-top-width:1px">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Proceeds 
						</div>
					</div>
					<xsl:variable name="pos" >1</xsl:variable>
					
						<!-- end -->
						<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both">
							<thead>
								<tr>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width: 128mm;border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px;">
										<span style="width:2px"/>
									</th>
									<th class="styTableCellHeader " scope="col" colspan="2">A </th>
									<th class="styTableCellHeader " scope="col" colspan="2">B</th>
									<th class="styTableCellHeader " scope="col" colspan="2">C</th>
									<th class="styTableCellHeader" scope="col" colspan="2">D</th>
								<!--	<th class="styTableCellHeader" scope="col" colspan="2" style="border-right:0px;">E</th>-->
								</tr>
							</thead>
							<tr>
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">1</span>
           Amount of bonds retired
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AmountRetired"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AmountRetired"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AmountRetired"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AmountRetired"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCell" colspan="2" style="border-right:0px;text-align:right;padding-right:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 4]/AmountRetired"/>
									</xsl:call-template>
								</td>
-->
							</tr>
							<tr>
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">2</span>
            Amount of bonds legally defeased
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AmountBondDefeased"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AmountBondDefeased"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AmountBondDefeased"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AmountBondDefeased"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">3</span>
            Total proceeds of issue
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/TotalProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/TotalProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/TotalProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2" style="text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/TotalProceeds"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">4</span>
           Gross proceeds in reserve funds
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AmountInReserveFund"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AmountInReserveFund"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AmountInReserveFund"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AmountInReserveFund"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">5</span>
           Capitalized interest from proceeds
           <span class="styNoAudioRead">
           <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/CapitalizedInterest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/CapitalizedInterest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/CapitalizedInterest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/CapitalizedInterest"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">6</span>
          Proceeds in refunding escrows
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/RefundingEscrow"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/RefundingEscrow"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/RefundingEscrow"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/RefundingEscrow"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">7</span>
            Issuance costs from proceeds
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/IssuanceCostsFromProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/IssuanceCostsFromProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/IssuanceCostsFromProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/IssuanceCostsFromProceeds"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">8</span>
          Credit enhancement from proceeds 
           <span class="styNoAudioRead">
           <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/CreditEnhancement"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/CreditEnhancement"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/CreditEnhancement"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/CreditEnhancement"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">9</span>
          Working capital expenditures from proceeds
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/WorkingCapitalExpenditures"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/WorkingCapitalExpenditures"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/WorkingCapitalExpenditures"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/WorkingCapitalExpenditures"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">10</span>
          Capital expenditures from proceeds
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/CapitalExpenditures"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/CapitalExpenditures"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/CapitalExpenditures"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/CapitalExpenditures"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">11</span>
         Other spent proceeds
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/OtherSpentProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/OtherSpentProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/OtherSpentProceeds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/OtherSpentProceeds"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">12</span>
          Other unspent proceeds
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AmountUnspent"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AmountUnspent"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AmountUnspent"/>
									</xsl:call-template>
								</td>
								<td class="styTableCell" colspan="2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AmountUnspent"/>
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
								<td class="styTableCellText" style="width:128mm; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">13</span>
           Year of substantial completion
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/YearOfSubstCompletion"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/YearOfSubstCompletion"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/YearOfSubstCompletion"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellText" colspan="2" style="text-align:center">
									<xsl:call-template name="PopulateYear">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/YearOfSubstCompletion"/>
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
									<th class="styTableCellHeader" scope="col" style="width:128mm;border-right-width:1px;border-bottom:0px;">
										<span style="width:2px"/>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">No</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">No</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">No</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm">No</th>
									<!--
									<th class="styTableCellHeader" scope="col" style="width:16mm">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                   -->
								</tr>
														
								<!-- Line 14 -->
								<tr>
									<td class="styTableCellText" style="width:128mm;border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">14</span>
         Were the bonds issued as part of a current refunding issue?
           <span class="styNoAudioRead">
           <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/CurrentRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/CurrentRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/CurrentRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/CurrentRefunding"/>
										</xsl:call-template>
									</td>
								
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/CurrentRefunding"/>
										</xsl:call-template>
									</td>
               
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/CurrentRefunding"/>
										</xsl:call-template>
									</td>
									
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/CurrentRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/CurrentRefunding"/>
										</xsl:call-template>
									</td>
									
		
								</tr>
								<!-- Line 15 -->
								<tr>
									<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">15</span>
         Were the bonds issued as part of an advance refunding issue?
           <span class="styNoAudioRead">
           <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
           </span>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
                
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AdvanceRefunding"/>
										</xsl:call-template>
									</td>
									
								</tr>
								<!-- Line 16 -->
								<tr>
									<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">16</span>
         Has the final allocation of proceeds been made?
           <span class="styNoAudioRead">
											<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
</span>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/FinalAllocationMade"/>
										</xsl:call-template>
									</td>
									</tr>
								<!-- Line 17 -->
								<tr>
									<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
										<span class="styLNLeftLtrBox" style="padding-left:0mm;">17</span>
        Does the organization maintain adequate books and records to support the final
         allocation of proceeds?
           <span class="styNoAudioRead">
											<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
		</span>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 1]/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 2]/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateYesBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellSmall " style="width:16mm;text-align:center">
										<xsl:call-template name="PopulateNoBox">
											<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartII[$pos + 3]/AdequateBooksAndRecdsMaintaind"/>
										</xsl:call-template>
									</td>
									
								</tr>
							</tr>
						</table>
					
					<!--   Begin Part III   -->
					<div class="styBB" style="width: 256mm;border-bottom-width:1px; border-top-width:1px">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Private Business Use  
						</div>
					</div>
					<!--<div class="styTableContainerLandscape " id="p3TbCtnr"> -->
					<!-- print logic -->
					<!-- <xsl:call-template name="SetInitialState"/>-->
					<!-- end -->
					<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm
     ">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width: 128mm"/>
								<th class="styTableCellHeader " scope="col" colspan="2" style="border-left-width:1px;">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2">D</th>
								
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-left-width:1px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">1</span>
        Was the organization a partner in a partnership, or a member of an LLC, which owned property financed by tax-exempt bonds?
          <span class="styNoAudioRead">
										<span class="styNBSP"/>.
   <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 </span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/OwningBondFinancedProperty"/>
									</xsl:call-template>
								</td>
								</tr>
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">2</span>
         Are there any lease arrangements that may result in private business use of bond-financed property?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
   <span class="styNBSP"/>.
 <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall" style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/AnyLeaseArrangements"/>
									</xsl:call-template>
								</td>
								</tr>
						</tbody>
					</table>
					<!--   BEGIN FORM FOOTER  -->
               <div style="width:256mm;float:none;clear:both;border-top:solid 1px" class="pageend">
						<div class="styGenericDiv" style="width:140mm;font-weight:bold">For Paperwork Reduction Act Notice, see the Instructions for Form 990. </div>
						<div class="styGenericDiv" style="width:25mm;">Cat. No. 50193E</div>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText">Schedule K (Form 990) 2012</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
				
					<div class="styBB" style="width:256mm; float: none; clear:none;border-bottom-width:1px">
						<div style="float:left"> Schedule K (Form 990) 2012</div>
						<div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">2</span>
						</div>
					</div>
					<!--   Begin Part III   Continued-->
					<div class="styBB" style="width: 256mm;border-bottom-width:1px">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Private Business Use  <span style="font:italic;font-weight:normal">(Continued)</span>
						</div>
					</div>
					<!-- end -->
					<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width: 128mm"/>
								<th class="styTableCellHeader " scope="col" style="border-left-width:1px" colspan="2">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-left-width:1px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<!--
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                 -->
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">3a</span>
        Are there any management or service contracts that may result in private business use of bond-financed property?
           <!--<span class="styNoAudioRead">-->
           <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <!--</span>-->
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/MngmentCntrctBondFinancdPrprty"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/MngmentCntrctBondFinancdPrprty"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">b</span>
              If "Yes" to line 3a, does the organization routinely engage bond counsel or other outside counsel to review any management or service contracts relating to the financed 
              <span class="styLNLeftLtrBox" style="padding-left:1mm;"></span>property?

        <!--   <span class="styNoAudioRead">-->
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
<!--</span>-->
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/EngageBondCounselContracts"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/EngageBondCounselContracts"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;height:7.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;height:7.5mm">c</span>
          Are there any research agreements that may result in private business use of bond-financed property?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/AnyResearchAgreements"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/AnyResearchAgreements"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;height:7.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;height:7.5mm">d</span>
          If "Yes" to line 3c, does the organization routinely engage bond counsel or other outside counsel to review any research agreements relating to the financed property?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/EngageBondCounselResearch"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/EngageBondCounselResearch"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;height:7.5mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:7.5mm">4</span>
 Enter the percentage of financed property used in a private business use by entities other than a section 501(c)(3) organization or a state or local government       
<span class="styNoAudioRead">
										<span class="styNBSP"/>.
									<span class="styNBSP"/>.
									


</span>
<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>

								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
<!--Leave this here, every other year they take out the hard code % sign	<xsl:call-template name="PopulatePercent">-->
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/PrcntgePrvtBusinessUseByOthers"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/PrcntgePrvtBusinessUseByOthers"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/PrcntgePrvtBusinessUseByOthers"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/PrcntgePrvtBusinessUseByOthers"/>
									</xsl:call-template>%
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:10mm">5</span>
 Enter the percentage of financed property used in a private business use as a result of unrelated trade or business activity carried on by your organization, another section 501(c)(3) organization, or a state or local government
<span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 
</span>
<img src="{$ImagePath}/990SchK_Bullet_Md.gif" alt="SchKMediumBullet"/>
         
</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/PercentageOfPrvtBusinessReUBI"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/PercentageOfPrvtBusinessReUBI"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/PercentageOfPrvtBusinessReUBI"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/PercentageOfPrvtBusinessReUBI"/>
									</xsl:call-template>%
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">6</span>
        Total of lines 4 and 5
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/TotalPrivateBusinessUse"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/TotalPrivateBusinessUse"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/TotalPrivateBusinessUse"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/TotalPrivateBusinessUse"/>
									</xsl:call-template>%
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">7</span>
    Does the bond issue meet the private security or
             payment test?  

     
                          
 <!--<span class="styNoAudioRead"/>-->
 <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
 
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/BondIssMeetPrvtSecurityPayTest"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/BondIssMeetPrvtSecurityPayTest"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">8a</span>
    Has there been a sale or disposition of any of the bond financed property to a nongovernmental person other than a 501(c)(3) organization since the bonds were <span class="styNormalText" style="padding-left:9mm;">issued?</span>                     
 <span class="styNoAudioRead">
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

 </span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/ChangeInUseBondFinancedProp"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/ChangeInUseBondFinancedProp"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">b</span>
         If “Yes” to line 8a, enter the percentage of bond-financed property sold or disposed of.
           <span class="styNoAudioRead">
										<!--<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.-->
</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/PrcntgeBondFinancedProp"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/PrcntgeBondFinancedProp"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/PrcntgeBondFinancedProp"/>
									</xsl:call-template>%
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/PrcntgeBondFinancedProp"/>
									</xsl:call-template>%
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">c</span>
    If “Yes” to line 8a, was any remedial action taken pursuant to Regulations sections 1.141-12 and 1.145-2?                    
 <span class="styNoAudioRead">
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
 </span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/RemedialActionTaken"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/RemedialActionTaken"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:128mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">9</span>
     Has the organization established written procedures to ensure that all nonqualified bonds of the issue are remediated in accordance with the requirements under 
     <div class="styLNDesc" style="width:80mm;height:4.5mm;padding-left:9mm">
      Regulations sections 1.141-12 and 1.145-2? 
       </div>
                          
 <span class="styNoAudioRead"/>
 
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 1]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 2]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/NonQualifiedBondRemedProcdrs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIII[$pos + 3]/NonQualifiedBondRemedProcdrs"/>
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
					<div class="styBB" style="width: 256mm;border-bottom-width:1px;border-top-width:1px">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Arbitrage 
						</div>
					</div>
					
					<!-- end -->
					<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col"  style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:96mm"/>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm;border-left-width:1px">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm;border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-left-width:1px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<!--
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                  -->
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">1</span>
        Has the issuer filed Form 8038-T?   
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/Form8038TFiled"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/Form8038TFiled"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">2</span>
       If "No" to line 1, did the following apply?
       <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.


          
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;">
								
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">a</span>
       Rebate not due yet?  
       <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

          
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/RebateNotDueYet"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/RebateNotDueYet"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">b</span>
       Exception to rebate?   
       <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>. 
          <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.


								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/ExceptionToRebate"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/ExceptionToRebate"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:1mm;">c</span>
      No rebate due? 
      <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<br/>
                                  </td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/NoRebateDue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/NoRebateDue"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
							 <span class="styNormalText" style="padding-left:9mm;"></span>
      If you checked "No rebate due" in line 2c, provide in Part VI 
      <span class="styNormalText" style="padding-left:9mm;"></span>the date the rebate computation was performed   
  
          
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">3</span>
       Is the bond issue a variable rate issue?
          <span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.

								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/VariableRateIssue"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center;border-top-width: 1px;">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/VariableRateIssue"/>
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
							<tr >
								
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:88mm;padding-top:0mm;float:none;clear:both">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">4a</span>
         Has the organization or the governmental issuer entered into a qualified hedge with respect to the bond issue?
          								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/HedgeIdentifiedInBooksAndRecds"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/HedgeIdentifiedInBooksAndRecds"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm;">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">b</span>
        Name of provider
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										
										</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/NameOfHedgeProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/NameOfHedgeProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/NameOfHedgeProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/NameOfHedgeProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/NameOfHedgeProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/NameOfHedgeProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/NameOfHedgeProvider/BusinessNameLine2"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/NameOfHedgeProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;border-right:0px;text-align:left;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfHedgeProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfHedgeProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
                -->
							</tr>
							
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">c</span>
        Term of hedge
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/TermOfHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:32mm;text-align:right;" colspan="2">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/TermOfHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/TermOfHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/TermOfHedge"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;height:4.5mm">d</span>
        Was the hedge superintegrated?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.

</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/SuperintegratedHedge"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/SuperintegratedHedge"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;height:4.5mm">e</span>
        Was a hedge terminated?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										

</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/HedgeTerminated"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/HedgeTerminated"/>
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
					<div style="width:256mm;float:none;clear:both;padding-top:.5mm;border-top:solid 1px" class="pageend">
						<div class="styGenericDiv" style="width:95mm;"/>
						<div class="styGenericDiv" style="width:25mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule K (Form 990) 2012</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
		<!-- =========================================================================-->
					<!--  Page header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
						<div style="width:90mm;" class="styGenericDiv">Schedule K (Form 990) 2012</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</div>
					</div>
							
							<!--   Begin Part IV  continued-->
					<div class="styBB" style="width: 256mm;border-bottom-width:1px;border-top-width:1px">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Arbitrage <span style="font:italic;font-weight:normal">(Continued)</span>
						</div>
					</div>
					<!-- end -->
					<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col"  style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:96mm"/>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm;border-left-width:1px">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm;border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-left-width:1px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;">5a</span>
        Were gross proceeds invested in a guaranteed investment contract (GIC)?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										
										</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/GrossProceedsInvestedInGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/GrossProceedsInvestedInGIC"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">b</span>
         Name of provider
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
  </span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/NameOfGICProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/NameOfGICProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/NameOfGICProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/NameOfGICProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/NameOfGICProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/NameOfGICProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:left">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/NameOfGICProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/NameOfGICProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;border-right:0px;text-align:left;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfGICProvider/BusinessNameLine1"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/NameOfGICProvider/BusinessNameLine2"/>
									</xsl:call-template>
								</td>
                 -->
							</tr>
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;">c</span>
               Term of GIC
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
 <span class="styNBSP"/>.
 <span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.


</span>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/TermOfGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/TermOfGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/TermOfGIC"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " colspan="2" style="width:32mm;text-align:right;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/TermOfGIC"/>
									</xsl:call-template>
								</td>
								<!--
								<td class="styTableCellSmall " colspan="2" style="width:32mm;border-right:0px;text-align:right;padding-right:4mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/TermOfGIC"/>
									</xsl:call-template>
								</td>
                   -->
							</tr>
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:2mm;height:4.5mm">d</span>
        Was the regulatory safe harbor for establishing the fair market value of the GIC satisfied?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										

</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/RegulatorySafeHarborSatisfied"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/RegulatorySafeHarborSatisfied"/>
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
					<!--		<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:10mm">6</span>
        Were any gross proceeds invested beyond an available temporary period?
           <span class="styNoAudioRead"/>
								<span class="styNBSP"/>.
								<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;border-right:0px;text-align:center;padding-right:4mm">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 4]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
              
							</tr>-->
							<tr>
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">6</span>
        Were any gross proceeds invested beyond an available temporary period?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										<span class="styNBSP"/>.
										
										
										

</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/GrossProceedsInvested"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/GrossProceedsInvested"/>
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
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:4.5mm">7</span>
        Has the organization established written procedures to monitor the requirements of section 148?
           <span class="styNoAudioRead">
										<span class="styNBSP"/>.
<span class="styNBSP"/>.
<span class="styNBSP"/>.</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 1]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 2]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/WrittenProcToMonitorReqs"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartIV[$pos + 3]/WrittenProcToMonitorReqs"/>
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
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="16"/>
						<xsl:with-param name="containerID" select="'p2TbCtnr'"/>
					</xsl:call-template>
					
					
					<!-- Part V Procedures To Undertake Corrective Action -->
					<div class="styBB" style="width: 256mm;border-color: black;border-bottom-width:1px;border-top-width: 1px">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc">Procedures To Undertake Corrective Action
						</div>
					</div>
					
<table class="styTable" cellspacing="0" style="font-size:7pt;width:256mm;float:none;clear:both">
						<thead>
							<tr>
								<th class="styTableCellHeader" rowspan="2" scope="col"  style="border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 1px; border-bottom-width:0px; width:96mm"/>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm;border-left-width:1px">A</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm">B</th>
								<th class="styTableCellHeader " scope="col" colspan="2" style="width:32mm">C</th>
								<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm">D</th>
								<!--<th class="styTableCellHeader" scope="col" colspan="2" style="width:32mm;border-right:0px">E</th>-->
							</tr>
							<tr>
								<th class="styTableCellHeader " scope="col" style="border-left-width:1px;width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm">No</th>
								<!--
								<th class="styTableCellHeader " scope="col" style="width:16mm">Yes</th>
								<th class="styTableCellHeader " scope="col" style="width:16mm;border-right:0px;padding-right:4mm">No</th>
                  -->
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<tr>
								
								<td class="styTableCellText" style=" border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width:1px; width:96mm;padding-top:0mm">
									<span class="styLNLeftLtrBox" style="padding-left:0mm;height:10mm">1</span>
         Has the organization established written procedures to ensure that violations of federal tax requirements are timely identified and corrected through the voluntary closing agreement program if self-remediation is not available under applicable regulations?   
           <span class="styNoAudioRead">
										
</span>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 1]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 1]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 2]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 2]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateYesBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 3]/ProcToUndertkCorrectiveAction"/>
									</xsl:call-template>
								</td>
								<td class="styTableCellSmall " style="width:16mm;text-align:center">
									<xsl:call-template name="PopulateNoBox">
										<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartV[$pos + 3]/ProcToUndertkCorrectiveAction"/>
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
					
<div class="styBB" style="width:256mm;float:none;"/>

				<!-- Part VI Supplemental Information -->
					<div class="styGenericDiv" style="width: 256mm;">
						<div class="styPartName" style="width:18mm;">Part VI</div>
						<div class="styPartDesc" style="width:236mm;">
Supplemental Information. <span class="styNormalText"> Complete this part to provide additional information for responses to questions on Schedule K (see instructions).</span></div>
</div>
<span style="float:right;clear:none">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartVI"/>
									<xsl:with-param name="containerHeight" select="20"/>
									<xsl:with-param name="containerID" select="'SUPctn'"/>
								</xsl:call-template>
							</span>
						
					
					<div class="styTableContainerLandscape " style="width: 256mm;  border-bottom-width: 1px" id="SUPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black;" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
				<th class="styDepTblCell" style="border-right-width: 0px;width:50mm" scope="col">Identifier</th>
				<th class="styDepTblCell" style="border-right-width: 0px;width:50mm" scope="col">Return Reference</th>
				<th class="styDepTblCell" style="border-right-width: 0px;width:156mm" scope="col">Explanation</th>
								</tr>
							</thead>
							<tfoot/>
							
               
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleKPartVI) &lt;= 20">
									<xsl:for-each select="$FormData/Form990ScheduleKPartVI">
										<tr>
											<td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Identifier"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ReturnReference"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 156mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Explanation"/>
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
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleKPartVI"/>
						<xsl:with-param name="containerHeight" select="20"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>
										
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty990ScheduleKFormFooter" style="padding-top:1mm">
						<div style="width:140mm;font-weight:bold; float: left; clear: none;"/>
						<div style="width:60mm;font-weight:normal; float: left; clear: none;"/>
						<div style="width:56mm;text-align:center;font-weight:bold;  float: right; clear: none;"> Schedule K (Form 990) 2012</div>
					</div>
					<!--     END FORM FOOTER   -->
					<!--     END FORM FOOTER   -->
					<div class="pageEnd"/>
					<br/>
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
