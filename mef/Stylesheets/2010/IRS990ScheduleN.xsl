<?xml version="1.0" encoding="UTF-8"?>
<!-- This stylesheet was created by Sandy Cram and last modified on 11/25/2008 -->
<!-- This stylesheet was last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
<!-- Last modified on 6/25/2009 by Sandy Cram  changed all references to 2008 to 2009 per BSP-091509OTH -->
<!-- Last modified on 9/10/2009 by Sandy Cram  Updates made per BSP-091865OTH -->
<!-- Last modified on 8/11/2010 by Robert Jones  Updates made per BSP-101319OTH -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990ScheduleNStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleN"/>
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
				<meta name="Description" content="IRS Form 990 Schedule N"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<!-- Form 990ScheduleN CSS Styles are located in the template called below -->
					<xsl:call-template name="IRS990ScheduleNStyle"/>
					<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS990ScheduleN">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="sty990ScheduleNBB" style="width:256mm;height:18mm">
						<div class="sty990ScheduleNFN">
							<div class="sty990ScheduleNFNum" style="width:46mm;">SCHEDULE N
      <br/>
								<span class="sty990ScheduleNFNum2">(Form 990 or 990-EZ)</span>
							</div>
							<div class="sty990ScheduleNAgency" style="padding-top: 8mm">Department of the Treasury
      <br/>Internal Revenue Service
    </div>
						</div>
						<div class="sty990ScheduleNFTBox" style="width:163mm;border-right-width:1px;height:18mm;padding-top:1mm">
							<div class="styMainTitle">Liquidation, Termination, Dissolution or Significant Disposition of Assets</div>
							<span class="sty990ScheduleNFST" style="padding-top:.5mm">
								
								<img src="{$ImagePath}/990SchN_Bullet_Md.gif" alt="bullet"/>
								Complete if the organization answered "Yes" to Form 990, Part IV, lines 31 or 32 or Form 990-EZ, line 36.
    <br/>							
								<img src="{$ImagePath}/990SchN_Bullet_Md.gif" alt="bullet"/>
								<span style="width: 4px"/> Attach certified copies of any articles of dissolution, resolutions or plans.
      <br/>		
								<img src="{$ImagePath}/990SchN_Bullet_Md.gif" alt="bullet"/>
								<span style="width: 4px"/> Attach to Form 990 or 990-EZ.
      <br/>
							</span>
						</div>
						<div class="IRS990ScheduleN_FormYearBlock" style="height:18mm;float:right">
							<!-- OMB No. -->
							<div class="IRS990ScheduleN_OMB">OMB No. 1545-0047</div>
							<!-- Tax Year -->
							<div class="IRS990ScheduleN_TaxYear" style="padding-top:0mm;padding-bottom:0;">
								<span>20<span class="styTYColor">10</span>
								</span>
								<div class="sty990ScheduleNPartName" style="font-size:7pt;font-family:verdana;width:45mm;padding-top:0mm;padding-bottom:0mm;height:7mm">Open to Public <br/>Inspection</div>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div style="width:256mm;float:left;clear:left;">
						<div class="sty990ScheduleNBusinessName" style="width:200mm;height:30px;">
							<span style="font-weight:bold">Name of the organization</span>
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
						<div class="sty990ScheduleNIN" style="width:56mm;height:30px;">
							<span style="font-weight:bold;float:left; clear: none; margin-left: 1mm">Employer identification number</span>
							<br/>
							<span class="sty990ScheduleNINBox" style="font-weight:normal;font-size: 7pt; height:4mm;float:left; margin-left: 1mm; padding-top:2mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN HEADER   -->
					<div class="styBB" style="width: 256mm;border-top-width:1px">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width: 242mm;">Liquidation, Termination or Dissolution. 
       <span class="styNormalText">Complete if the organization answered "Yes" to Form 990, Part IV, line 31, or Form 990-EZ, line<br/> 36. Use Part III if </span>
							<span class="styNormalText" style="width:230">additional space is needed.  
<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/LiquidationTable"/>
								</xsl:call-template>
							</span>
							<!-- ================ Begin changes for Table I ========================================== -->
							<xsl:variable name="table1RowCount" select="count($FormData/LiquidationTable/LiquidationDetail)"/>
							<span style="width:4mm;text-align:right;float:right; clear: none;">
								<xsl:call-template name="SetDynamicTableToggleRowCount">
									<xsl:with-param name="DataRowCount" select="$table1RowCount"/>
									<xsl:with-param name="containerHeight" select="9"/>
									<xsl:with-param name="containerID" select=" 'p1TbCtnr' "/>
								</xsl:call-template>
							</span>
						</div>
						<!--Part I  table -->
						<div class="styTableContainerLandscape " id="p1TbCtnr">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
								<!--<div style="width: 256mm;">-->
								<tr>
									<th class="sty990ScheduleNLNCol" scope="col" style="text-align: center;font-size: 7pt; height: 15mm; border-bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top">
										<span style="text-align:left;float:left;padding-left:1mm">
											<b>1</b>
										</span>
										<b>(a)</b>Description of asset(s)<br/>distributed or transaction<br/>expenses paid</th>
									<th class="sty990ScheduleNColA" scope="col" style="text-align: center; height: 15mm; width:20mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top">
										<b>(b)</b>Date of<br/>distribution</th>
									<th class="sty990ScheduleNColB" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top">
										<b>(c)</b>Fair market value of<br/>asset(s) distributed or<br/>amount of transaction<br/>expenses</th>
									<!--<span style="width:94.75mm; height: 8mm">-->
									<th class="sty990ScheduleNColC" scope="col" style="border-top-width:1px;text-align: center; height: 15mm;width:31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(d)</b>Method of	<br/>determining FMV for<br/>asset(s) distributed or<br/>transaction expenses</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:30mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(e)</b>EIN of recipient </th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 15mm; width:48mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(f)</b>Name and address of recipient</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align:center; height: 15mm; width: 32m;padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none;font-size:6pt;font-weight:normal;vertical-align:top">
										<span style="text-align:left">
											<b>(g)</b>IRC section</span>
										<br/>of recipient(s) (if<br/>
										<span style="text-align:left">tax-exempt) or type<br/>
										</span>of entity</th>
								</tr>
								<!--   END HEADER   -->
								<!--   BEGIN LINE 1   -->
								<xsl:if test="($Print != $Separated) or count($FormData/LiquidationTable/LiquidationDetail) &lt; 10">
									<xsl:for-each select="$FormData/LiquidationTable/LiquidationDetail">
										<tr>
											<!-- Description of Asset col(a)-->
											<td class="sty990ScheduleNLNCol" style="padding-top: 1mm;width:62mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfAsset"/>
												</xsl:call-template>
											</td>
											<!-- Date of Distribution col(b)-->
											<td class="sty990ScheduleNColA" style="padding-top: 1mm;width:20mm;font-size:7pt;vertical-align:top;text-align:center">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DateOfDistribution"/>
												</xsl:call-template>
											</td>
											<!-- Fair Market Value col(c)-->
											<td class="sty990ScheduleNColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVOfAsset"/>
												</xsl:call-template>
											</td>
											<!-- Method of determining FMV col(d)-->
											<td class="sty990ScheduleNColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt;vertical-align:top;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MethodOfFMVDetermination"/>
												</xsl:call-template>
											</td>
											<!-- EIN col(e)-->
											<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt;vertical-align:top;text-align:center">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<!-- Name and Address col(f)-->
											<td class="sty990ScheduleNCol" style=" padding-top: 1mm;width: 47mm;font-size:7pt;vertical-align:top;text-align:left">
												<xsl:choose>
													<xsl:when test="NamePerson">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NamePerson"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<br/>
												<xsl:choose>
													<xsl:when test="AddressUS">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="AddressUS"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="AddressForeign"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<!-- IRC Code  col(g)-->
											<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 32mm;font-size:7pt;padding-right:2mm;vertical-align:top;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IRCSection"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable) &lt; 1 or
            (($Print = $Separated) and (count($FormData/LiquidationTable/LiquidationDetail) &gt; 9)) ">
									<tr>
										<td class="sty990ScheduleNLNCol" style="border-right-width:1px;text-align:center">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/LiquidationTable/LiquidationDetail"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="sty990ScheduleNColA" style="border-right-width:1px;border-bottom-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="sty990ScheduleNColB" style="border-right-width:1px;border-bottom-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="sty990ScheduleNColC" style="border-right-width:1px;border-bottom-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="sty990ScheduleNColC" style="border-right-width:1px;border-bottom-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="sty990ScheduleNColC" style="border-right-width:1px;border-bottom-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="sty990ScheduleNCol" style="border-bottom-width:1px">
											<span style="width:3px;"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 2 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 3 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 4 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 5 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 6 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 7 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
							<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 8 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 9 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 10 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LiquidationTable/LiquidationDetail) &lt; 11 or ((count($FormData/LiquidationTable/LiquidationDetail) &gt; 11) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
							</table>
						</div>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/LiquidationTable/LiquidationDetail"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="9"/>
						<xsl:with-param name="containerID" select="'p1TbCtnr'"/>
					</xsl:call-template>
					<!--   END LINE 1   -->
					<!-- Line 2 -->
					<br /><br /><br /><br />
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDescLandscape" style="width:223mm">
							<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
							</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-left-width:0px"/>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:1px;padding-top:0mm;">Yes</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:1px;padding-top:0mm;border-right-width:0px">No</div>
	
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDescLandscape" style="width:223mm">Did or will any officer, director, trustee, or key employee of the organization:
          <!--Dotted Line-->
						</div>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;"/>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDescLandscape" style="width:223mm">Become a director or trustee of a successor or transferee organization?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
           <span style="width:16px"/>.
		<span style="width:16px"/>.
 		<span style="width:16px"/>.
			<span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
           <span style="width:16px"/>.
		<span style="width:16px"/>.
 		<span style="width:16px"/>.
		
		</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2a</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/DirectorOfSuccessor"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/DirectorOfSuccessor"/>
							</xsl:call-template>
						</div>
						<!--  <div class="styLNAmountBox"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtractionIncome" /></xsl:call-template></div>-->
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDescLandscape" style="width:223mm">Become an employee of, or independent contractor for, a successor or transferee organization?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
		 <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
            </span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2b</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeOfSuccessor"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeOfSuccessor"/>
							</xsl:call-template>
						</div>
						<!--  <div class="styLNAmountBox"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtractionIncome" /></xsl:call-template></div>-->
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">c</div>
						<div class="styLNDescLandscape" style="width:223mm">Become a direct or indirect owner of a successor or transferee organization?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
           <span style="width:16px"/>.
		 <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
		 <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
<span style="width:16px"/>.
</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2c</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/OwnerOfSuccessor"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/OwnerOfSuccessor"/>
							</xsl:call-template>
						</div>
						<!--  <div class="styLNAmountBox"><xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$FormData/ForeignOilGasExtractionIncome" /></xsl:call-template></div>-->
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">d</div>
						<div class="styLNDescLandscape" style="width:223mm">Receive, or become entitled to, compensation or other similar payments as a result of the organization's liquidation, termination, or dissolution?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
           <span style="width:16px"/>.
<span style="width:16px"/>.
		</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2d</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ReceiveCompensation"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ReceiveCompensation"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB">
						<div style="width:256mm;padding-bottom:1mm">
							<div class="styLNLeftNumBoxSD">e</div>
							<div class="styLNDescLandscape" style="width:247mm">If the organization answered "Yes" to any of the questions in this line, provide the name of the person involved and explain in Part III.
							<img src="{$ImagePath}/990SchN_Bullet_Md.gif" alt="bullet"/>
          <!--Dotted Line-->
								<!--<span class="styNoAudioRead" style="font-weight:bold;">
            <span style="width:16px"></span>.
            <span style="width:16px"></span>.
            <span style="width:16px"></span>.
		 </span>-->
							</div>
						</div>
					</div>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty990ScheduleNFormFooter" style="padding-top:1mm">
						<div style="width:140mm;font-weight:bold; float: left; clear: none;">For Privacy Act and 
  Paperwork Reduction Act Notice, see the Instructions for Form 990 or Form 990-EZ.</div>
						<div style="width:60mm;font-weight:normal; float: left; clear: none;">Cat. No. 50087Z</div>
						<div style="width:56mm;text-align:center;font-weight:bold;  float: right; clear: none;">Schedule N (Form 990 or 990-EZ) 2010</div>
					</div>
					<!--     END FORM FOOTER   -->
					<div class="pageEnd"/>
					<br/>
					<div class="styBB" style="width:256mm; float: none; clear:none;border-bottom-width:1px">
						<div style="float:left">Schedule N (Form 990 or 990-EZ) 2010</div>
						<div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">2</span>
						</div>
					</div>
					<div class="styBB" style="width: 256mm;border-bottom-width:1px">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Liquidation, Termination or Dissolution <span style="font:italic;font-weight:normal">(continued)</span>
						</div>
					</div>
					<div style="width:256mm; ">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDescLandscape" style="width:223mm">
							<span style="font-weight:bold;">Note.</span>
          If the organization distributed all of its assets during the tax year, then Form 990, Part X, column (B) should equal -0-. 
		<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
							</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-left-width:0px"/>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">Yes</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">No</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDescLandscape" style="width:223mm">Did the organization distribute its assets in accordance with its governing instrument(s)?  If “No,” describe in Part III    
		<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          
            </span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">3</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AssetsDistributed"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AssetsDistributed"/>
							</xsl:call-template>
						</div>
					</div>
					<!--
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">4a</div>
						<div class="styLNDescLandscape" style="width:223mm">Did the organization request or receive a determination letter from EO Determinations that the organization’s exempt status was terminated?     
     <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DeterminationLetter"/>
							</xsl:call-template>
							
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
		</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">4a</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/DeterminationLetter"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/DeterminationLetter"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDescLandscape" style="width:223mm">(If “Yes,” provide the date of the letter.
						<img src="{$ImagePath}/990SchN_Bullet_Md.gif" alt="bullet"/>
        <span class="sty990ScheduleNUnderlineAmount" style="float:none;width:24mm;padding-top:0mm;padding-bottom:0mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/DateOfLetter"/>
								</xsl:call-template> )</span>
							
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
           
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
         <span style="width:16px"/>.
          <span style="width:16px"/>.
</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;"/>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px"/>
					</div>
-->
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">4a</div>
						<div class="styLNDescLandscape" style="width:223mm">Is the organization required to notify the attorney general or other appropriate state official of its intent to dissolve, liquidate, or terminate?          
<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
		 
</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">4a</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RequiredToNotifyAG"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/RequiredToNotifyAG"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDescLandscape" style="width:223mm">If “Yes,” did the organization provide such notice?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
<span style="width:16px"/>.
</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">4b</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AGNotified"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AGNotified"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDescLandscape" style="width:223mm">Did the organization discharge or pay all liabilities in accordance with state laws?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">5</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/LiabilitiesPaid"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/LiabilitiesPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">6a</div>
						<div class="styLNDescLandscape" style="width:223mm">Did the organization have any tax-exempt bonds outstanding during the year?          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
          <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
<span style="width:16px"/>.
          </span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">6a</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BondsOutstanding"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BondsOutstanding"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDescLandscape" style="width:223mm">Did the organization discharge or defease tax-exempt bond liabilities in accordance with the Internal Revenue Code and state laws?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
             <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
 <span style="width:16px"/>.
            <span style="width:16px"/>.
           <span style="width:16px"/>.
          </span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">6b</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BondLiabilitiesDischarged"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/BondLiabilitiesDischarged"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">c</div>
						<div class="styLNDescLandscape" style="width:223mm">If “Yes,” describe in Part III how the organization defeased or otherwise settled these liabilities. If “No,” explain in Part III.          
<!--Dotted Line-->
						</div>
						<br/>
						<!--   BEGIN HEADER   -->
						<div class="styBB" style="width: 256mm;border-top-width:1px">
							<div class="sty990ScheduleNPartName">Part II</div>
							<div class="sty990ScheduleNPartDesc">Sale, Exchange, Disposition or Other Transfer of More Than 25% of the Organization's Assets. 
       <span style="font-weight:normal;">Complete if the organization answered "Yes" to Form 990, Part IV, line 32, or Form 990-EZ, line 36. Use Part III if additional space is needed.
  </span>
							</div>
							<!--==============================Part II Table ======================================-->
							<xsl:variable name="table2RowCount" select="count($FormData/DispositionTable)"/>
							<span style="width:4mm;text-align:right;float:right; clear: none;">
								<xsl:call-template name="SetDynamicTableToggleRowCount">
									<xsl:with-param name="DataRowCount" select="$table2RowCount"/>
									<xsl:with-param name="containerHeight" select="9"/>
									<xsl:with-param name="containerID" select=" 'p2TbCtnr' "/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styTableContainerLandscape " id="p2TbCtnr">
							<!-- print logic -->
							<xsl:call-template name="SetInitialState"/>
							<!-- end -->
							<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
								<thead class="styTableThead">
									<tr>
										<th class="sty990ScheduleNLNCol" scope="col" style="text-align: center;font-size: 7pt; height: 14mm; border-			bottom-width: 1px; border-top-width:1px;padding-top:1mm;font-weight:normal;vertical-align:top">
											<span style="text-align:left;float:left;padding-left:1mm">
												<b>1</b>
											</span>
											<b>(a)</b>Description of asset(s)<br/>distributed or transaction<br/>expenses paid</th>
										<th class="sty990ScheduleNColA" scope="col" style="text-align: center; height: 14mm; width:20mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top">
											<b>(b)</b>Date of<br/>distribution</th>
										<th class="sty990ScheduleNColB" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width: 32mm; padding-right: 0px; font-size: 7pt; padding-top: 1mm;font-weight:normal;vertical-align:top">
											<b>(c)</b>Fair market value of<br/>asset(s) distributed or<br/>amount of transaction<br/>expenses</th>
										<!--<span style="width:94.75mm; height: 8mm">-->
										<th class="sty990ScheduleNColC" scope="col" style="border-top-width:1px;text-align: center; height: 14mm;width:31mm;  margin-top: 0mm;padding-top: 1mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top">
											<b>(d)</b>Method of <br/>determining FMV for<br/>asset(s) distributed or<br/>transaction expenses</th>
										<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:30mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:	none; font-size: 7pt;font-weight:normal;vertical-align:top">
											<b>(e)</b>EIN of recipient </th>
										<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width:49mm; padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear:none; font-size: 7pt;font-weight:normal;vertical-align:top">
											<b>(f)</b>Name and address of recipient</th>
										<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 14mm; width: 30m;padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none;font-size:6pt;font-weight:normal;vertical-align:top">
											<span style="text-align:left">
												<b>(g)</b>IRC section</span>
											<br/>of recipient(s) (if<br/>
											<span style="text-align:left">tax-exempt) or type</span>
											<br/>of entity</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<!--   END HEADER   -->
									<!--   BEGIN LINE 1   -->
									<xsl:if test="($Print != $Separated) or count($FormData/DispositionTable) &lt; 10">
										<xsl:for-each select="$FormData/DispositionTable">
											<tr>
												<!-- Description of Asset col(a) -->
												<td class="sty990ScheduleNLNCol" style="padding-top: 1mm;width:62mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DescriptionOfAsset"/>
													</xsl:call-template>
												</td>
												<!-- Date of Distribution col(b) -->
												<td class="sty990ScheduleNColA" style="padding-top: 1mm;width:20mm;font-size:7pt;vertical-align:top;text-align:center">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DateOfDistribution"/>
													</xsl:call-template>
												</td>
												<!-- Fair Market Value col(c) -->
												<td class="sty990ScheduleNColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="FMVOfAsset"/>
													</xsl:call-template>
												</td>
												<!--Method of Determing FMV col(d) -->
												<td class="sty990ScheduleNColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MethodOfFMVDetermination"/>
													</xsl:call-template>
												</td>
												<!-- EIN col(e) -->
												<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt;vertical-align:top;text-align:center">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</td>
												<!-- Name and Address col(f)-->
												<td class="sty990ScheduleNCol" style=" padding-top: 1mm;width: 49mm;font-size:7pt;vertical-align:top;text-align:left">
													<xsl:choose>
														<xsl:when test="NamePerson">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="NamePerson"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<br/>
													<xsl:choose>
														<xsl:when test="AddressUS">
															<xsl:call-template name="PopulateUSAddressTemplate">
																<xsl:with-param name="TargetNode" select="AddressUS"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="AddressForeign"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<!-- IRC Code col(g)-->
												<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt;padding-right:2mm;vertical-align:top;text-align:left">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="IRCSection"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="count($FormData/DispositionTable) &lt; 1 or
            (($Print = $Separated) and (count($FormData/DispositionTable) &gt; 9)) ">
										<tr>
											<td class="sty990ScheduleNLNCol" style="padding-top: 1mm;width:62mm;font-size:7pt;padding-left: 2.5mm;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/DispositionTable"/>
												</xsl:call-template>
												<span style="width:3px"/>
											</td>
											<td class="sty990ScheduleNColA" style="padding-top: 1mm;width:20mm;font-size:7pt">
												<span style="width:3px"/>
											</td>
											<td class="sty990ScheduleNColB" style="padding-top: 1mm;width: 32mm;font-size:7pt">
												<span style="width:3px"/>
											</td>
											<td class="sty990ScheduleNColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt">
												<span style="width:3px"/>
											</td>
											<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt">
												<span style="width:3px;"/>
											</td>
											<td class="sty990ScheduleNCol" style=" padding-top: 1mm;width: 49mm;font-size:7pt">
												<span style="width:3px;"/>
											</td>
											<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt">
												<span style="width:3px;"/>
											</td>
										</tr>
									</xsl:if>
								
								<xsl:if test="count($FormData/DispositionTable) &lt; 2 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DispositionTable) &lt; 3 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DispositionTable) &lt; 4 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DispositionTable) &lt; 5 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DispositionTable) &lt; 6 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DispositionTable) &lt; 7 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
							<xsl:if test="count($FormData/DispositionTable) &lt; 8 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								
								<xsl:if test="count($FormData/DispositionTable) &lt; 9 or ((count($FormData/DispositionTable) &gt; 9) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/DispositionTable"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="9"/>
						<xsl:with-param name="containerID" select="'p2TbCtnr'"/>
					</xsl:call-template>
					<!--   END LINE 1   -->
					<!-- Line 2 -->
					<br /><br />
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDescLandscape" style="width:223mm">
							<!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
								<span style="width:16px"/>
							</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-left-width:0px"/>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:1px;padding-top:0mm;">Yes</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:1px;padding-top:0mm;border-right-width:0px">No</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDescLandscape" style="width:223mm">Did or will any officer, director, trustee, or key employee of the organization:
          
         </div>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;"/>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;"/>
						<div class="IRS990ScheduleN_LineIndexMidFillerGray" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px"/>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDescLandscape" style="width:223mm">Become a director or trustee of a successor or transferee organization?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
           
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
           <span style="width:16px"/>.
		<span style="width:16px"/>.
 		<span style="width:16px"/>.
			<span style="width:16px"/>.
           <span style="width:16px"/>.
          <span style="width:16px"/>.
		 <span style="width:16px"/>.
          <span style="width:16px"/>.
           <span style="width:16px"/>.
		<span style="width:16px"/>.
 		<span style="width:16px"/>.
		
		</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2a</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/DirectorOfSuccessor"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/DirectorOfSuccessor"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDescLandscape" style="width:223mm">Become an employee of, or independent contractor for, a successor or transferee organization?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
		 <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
<span style="width:16px"/>.
            <span style="width:16px"/>.
            </span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2b</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeOfSuccessor"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeOfSuccessor"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">c</div>
						<div class="styLNDescLandscape" style="width:223mm">Become a direct or indirect owner of a successor or transferee organization?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
           <span style="width:16px"/>.
		 <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
<span style="width:16px"/>.
		 <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
            <span style="width:16px"/>.
</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2c</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/OwnerOfSuccessor"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/OwnerOfSuccessor"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD">d</div>
						<div class="styLNDescLandscape" style="width:223mm">Receive, or become entitled to, compensation or other similar payments as a result of the organization’s significant disposition of assets?
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="width:16px"/>.
            <span style="width:16px"/>.
          <span style="width:16px"/>.
		<span style="width:16px"/>.
          <span style="width:16px"/>.
		<span style="width:16px"/>.
          <span style="width:16px"/>.
		</span>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:1px;border-left-width:1px;">2d</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ReceiveCompensation"/>
							</xsl:call-template>
						</div>
						<div class="IRS990ScheduleN_LineIndexMid" style="font-weight:normal;width:8mm;height:4mm;border-top-width:0px;padding-top:0mm;border-right-width:0px">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ReceiveCompensation"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB">
						<div style="width:256mm;padding-bottom:2mm">
							<div class="styLNLeftNumBoxSD">e</div>
							<div class="styLNDescLandscape" style="width:223mm">If the organization answered "Yes" to any of the questions in this line, provide the name of the person involved and explain in Part III.
          
  </div>
						</div>
					</div>
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty990ScheduleNFormFooter" style="padding-top:1mm">
						<div style="width:140mm;font-weight:bold; float: left; clear: none;"/>
						<div style="width:60mm;font-weight:normal; float: left; clear: none;"/>
						<div style="width:56mm;text-align:center;font-weight:bold;  float: right; clear: none;">Schedule N(Form 990 or 990-EZ) 2010</div>
					</div>
					<!--     END FORM FOOTER   -->
					<div class="pageEnd"/>
					<br/>
					<div class="styBB" style="width:187mm; float: none; clear:none;border-bottom-width:1px">
						<div style="float:left">Schedule N (Form 990 or 990-EZ) 2010</div>
						<div style="float:right">Page <span style="font-weight:bold;font-size:8pt;padding-right:4mm">3</span>
						</div>
					</div>

					<div class="styGenericDiv" style="width: 187mm;">
						<div class="styPartName" style="width:18mm;">Part III</div>
						<div class="styPartDesc" style="width:169mm;font-weight:bold;border-top-width:1px;border-bottom-width:1px">Supplemental Information.
<span style="font-weight:normal;border-top-width:1px;padding-top:1mm;border-bottom-width:1px;border-right-width:0px;padding-left:2mm;border-top-width:1px">
 Complete to provide the information required by Parts I and II,<br/>
 and any additional information.</span>
</div>
						<span style="float:right">
							<!--  Part II - Additional data from Part I  -->
							
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleNPartIII"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select="'SUPctn'"/>
							</xsl:call-template>
						</span>
					</div>
					
					<div class="styTableContainer" style="width: 187mm; border-bottom-width: 2px" id="SUPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
									<!--th class="styDepTblCell" scope="col">Item No.</th-->
									<th class="styDepTblCell" scope="col">Identifier</th>
									<th class="styDepTblCell" scope="col">Return Reference</th>
									<th class="styDepTblCell" scope="col">Explanation</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/Form990ScheduleNPartIII) &lt;20))">
									<xsl:for-each select="$FormData/Form990ScheduleNPartIII">
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
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 86mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Explanation"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
									
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleNPartIII"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm">
						<div style="float:right;">
							<span style="width:80px;"/>
							<span class="styBoldText"> Schedule N (Form 990 or 990-EZ) 2010</span>
						</div>
					</div>
					<!--END Page Footer-->
					<br/>
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
					<!-- Begin SRD for Table I -->
					<xsl:if test="($Print = $Separated) and count($FormData/LiquidationTable/LiquidationDetail) &gt;= 9">
						<span class="styRepeatingDataTitle">Form 990, Schedule N, Part I - Liquidation, Termination or Dissolution</span>
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="sty990ScheduleNLNCol" scope="col" style="text-align: center;font-size: 7pt; height: 16mm; border-			bottom-width: 1px; border-top-width:1px;padding-top:2mm;font-weight:normal;vertical-align:top">
										<span style="text-align:left;float:left;padding-left:1mm">
											<b>1</b>
										</span>
										<b>(a)</b>Description of asset(s)<br/>distributedor transactional<br/>expenses paid</th>
									<th class="sty990ScheduleNColA" scope="col" style="text-align: center; height: 16mm; width:20mm;border-bottom-		width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 2mm;font-weight:normal;vertical-align:top">
										<b>(b)</b>Date of<br/>distribution</th>
									<th class="sty990ScheduleNColB" scope="col" style="border-top-width:1px;text-align: center; height: 16mm; width: 		32mm; padding-top: 0px;padding-right: 0px; font-size: 7pt; padding-top: 2mm;font-weight:normal;vertical-align:top">
										<b>(c)</b>Fair market value of<br/>asset(s) distributed or<br/>amount of transactional<br/>expenses</th>
									<!--<span style="width:94.75mm; height: 8mm">-->
									<th class="sty990ScheduleNColC" scope="col" style="border-top-width:1px;text-align: center; height: 16mm;width: 		31mm;  margin-top: 0mm;padding-top: 2mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(d)</b>Method of	<br/>determining FMV for<br/>asset(s) distributed or<br/>transactional expenses</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 16mm; width: 			30mm; padding-top: 2mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: 		none; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(e)</b>Ein of recipient (if<br/>tax-exempt)</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 16mm; width: 			49mm; padding-top: 2mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: 		none; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(f)</b>Name and address of recipient</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align:center; height: 15mm; width: 25m; 		padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none; 		font-size: 6pt;font-weight:normal;vertical-align:top">
										<span style="text-align:left">
											<b>(g)</b>IRC Code section</span>
										<br/> recipient(s) (if<br/>
										<span style="text-align:left">tax-exempt) or type<br/>
										</span>of entity</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/LiquidationTable/LiquidationDetail">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<!-- Description of Asset col(a)-->
									<td class="sty990ScheduleNLNCol" style="padding-top: 1mm;width:62mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DescriptionOfAsset"/>
										</xsl:call-template>
									</td>
									<!-- Date of Distribution col(b)-->
									<td class="sty990ScheduleNColA" style="padding-top: 1mm;width:20mm;font-size:7pt;vertical-align:top;text-align:center">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="DateOfDistribution"/>
										</xsl:call-template>
									</td>
									<!-- Fair Market Value col(c)-->
									<td class="sty990ScheduleNColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="FMVOfAsset"/>
										</xsl:call-template>
									</td>
									<!-- Method of determining FMV col(d)-->
									<td class="sty990ScheduleNColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt;vertical-align:top;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MethodOfFMVDetermination"/>
										</xsl:call-template>
									</td>
									<!-- EIN col(e)-->
									<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt;vertical-align:top;text-align:center">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</td>
									<!-- Name and Address col(f)-->
									<td class="sty990ScheduleNCol" style=" padding-top: 1mm;width: 47mm;font-size:7pt;vertical-align:top;text-align:left">
										<xsl:choose>
											<xsl:when test="NamePerson">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NamePerson"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
										<xsl:choose>
											<xsl:when test="AddressUS">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressUS"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressForeign"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!-- IRC Code  col(g)-->
									<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 32mm;font-size:7pt;padding-right:2mm;vertical-align:top;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IRCSection"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- SRD for Table II -->
					<xsl:if test="($Print = $Separated) and count($FormData/DispositionTable) &gt;= 9">
						<span class="styRepeatingDataTitle">Form 990, Schedule N, Part II - Sale, Exchange, Disposition or Other Transfer of more than 25% of the Organization's Assets</span>
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="sty990ScheduleNLNCol" scope="col" style="text-align: center;font-size: 7pt; height: 16mm; border-bottom-width: 1px; border-top-width:1px;padding-top:2mm;font-weight:normal;vertical-align:top">
										<span style="text-align:left;float:left;padding-left:1mm">
											<b>1</b>
										</span>
										<b>(a)</b>Description of asset(s)<br/>distributedor transaction<br/>expenses paid</th>
									<th class="sty990ScheduleNColA" scope="col" style="text-align: center; height: 16mm; width:20mm;border-bottom-width: 1px;border-top-width:1px; font-size: 7pt; padding-top: 2mm;font-weight:normal;vertical-align:top">
										<b>(b)</b>Date of<br/>distribution</th>
									<th class="sty990ScheduleNColB" scope="col" style="border-top-width:1px;text-align: center; height: 16mm; width:32mm; padding-top: 0px;padding-right: 0px; font-size: 7pt; padding-top: 2mm;font-weight:normal;vertical-align:top">
										<b>(c)</b>Fair market value of<br/>asset(s) distributed or<br/>amount of transaction<br/>expenses</th>
									<th class="sty990ScheduleNColC" scope="col" style="border-top-width:1px;text-align: center; height: 16mm;width:31mm;  margin-top: 0mm;padding-top: 2mm;padding-right: 0px; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(d)</b>Method of	<br/>determining FMV for<br/>asset(s) distributed or<br/>transaction expenses</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 16mm; width:30mm; padding-top: 2mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: 		none; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(e)</b>Ein of recipient </th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align: center; height: 16mm; width:49mm; padding-top: 2mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: 		none; font-size: 7pt;font-weight:normal;vertical-align:top">
										<b>(f)</b>Name and address of recipient</th>
									<th class="sty990ScheduleNCol" scope="col" style="border-top-width:1px;text-align:center; height: 15mm; width: 25m;padding-top: 1mm; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; float: none; clear: none; 		font-size: 6pt;font-weight:normal;vertical-align:top">
										<span style="text-align:left">
											<b>(g)</b>IRC Code section</span>
										<br/> recipient(s) (if<br/>
										<span style="text-align:left">tax-exempt) or type<br/>
										</span>of entity</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/DispositionTable">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<!-- Description of Asset col(a) -->
									<td class="sty990ScheduleNLNCol" style="padding-top: 1mm;width:62mm;font-size:7pt;padding-left: 2.5mm;vertical-align:top">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DescriptionOfAsset"/>
										</xsl:call-template>
									</td>
									<!-- Date of Distribution col(b) -->
									<td class="sty990ScheduleNColA" style="padding-top: 1mm;width:20mm;font-size:7pt;vertical-align:top">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="DateOfDistribution"/>
										</xsl:call-template>
									</td>
									<!-- Fair Market Value col(c) -->
									<td class="sty990ScheduleNColB" style="padding-top: 1mm;width: 32mm;font-size:7pt;vertical-align:top">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="FMVOfAsset"/>
										</xsl:call-template>
									</td>
									<!--Method of Determing FMV col(d) -->
									<td class="sty990ScheduleNColC" style="padding-top: 1mm;width: 31.75mm;font-size:7pt;vertical-align:top;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MethodOfFMVDetermination"/>
										</xsl:call-template>
									</td>
									<!-- EIN col(e) -->
									<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt;vertical-align:top;text-align:center">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</td>
									<!-- Name and Address col(f)-->
									<td class="sty990ScheduleNCol" style=" padding-top: 1mm;width: 49mm;font-size:7pt;vertical-align:top;text-align:left">
										<xsl:choose>
											<xsl:when test="NamePerson">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NamePerson"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameBusiness/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
										<xsl:choose>
											<xsl:when test="AddressUS">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressUS"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="AddressForeign"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!-- IRC Code col(g)-->
									<td class="sty990ScheduleNCol" style="padding-top: 1mm;width: 30mm;font-size:7pt;padding-right:2mm;vertical-align:top;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IRCSection"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="IRS990PartITableFillerRow">
		<tr>
			<td class="styTableCellText" >
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:32mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:31mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:48mm;">
				<span style="width:0px"/>
			</td>
			
			<td class="styTableCell" style="width:32mm;border-right-width:0px">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartIITableFillerRow">
		<tr>
			<td class="styTableCellText" >
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:20mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:32mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:31mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:48mm;">
				<span style="width:0px"/>
			</td>
			
			<td class="styTableCell" style="width:32mm;border-right-width:0px">
				<span style="width:4px;border-right-width:0px;"/>
			</td>
			
		</tr>
	</xsl:template>
</xsl:stylesheet>
