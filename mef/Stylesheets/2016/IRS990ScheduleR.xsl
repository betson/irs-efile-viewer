<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<!-- Updated 4/23/2015 per UWR 123023 IE11 changes by Robert L Jones -->
	<!-- Updated 6/9/2015 per IBM Defect 43305 by Robert L Jones various IE11 Fixes like Headers not on same page as rest of table-->
	<!-- Updated 7/1/2015 per IBM Defect 43434 by Robert L Jones various IE11 Fixes like Headers not on same page as rest of table-->
	<!-- Updated 7/15/2015 per Kisams IM02150548 Part IV had an instance of element IdRelatedOrgTxblPartnershipGrp which shld be in Part III by Robert L Jones -->
	<!-- Updated 8/05/2015 per UWR 161465 Tax Year by Robert L Jones -->
	<!-- Updated 10/22/2015 per PDF REVIEW by Robert L Jones -->
	<!-- Updated 11/18/2015 per IBM Defect 45356 Toggle Button, so I removed them all - by Robert L Jones -->
	<!-- Updated 5/03/2016 per UWR 177702 Tax Year by Robert L Jones -->
	<!-- Updated 06/17/2016 per IBM Defect 46041 Part III Col K not wide enough for 5 digits plus percent sign by Robert L Jones -->
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990ScheduleRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form990ScheduleRData" select="$RtnDoc/IRS990ScheduleR"/>
	<xsl:template match="/">
		<xsl:param name="ccount">0</xsl:param>
		<!-- count value -->
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form990ScheduleRData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS990ScheduleR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
			<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS990ScheduleRStyle"/>
					<xsl:call-template name="AddOnStyle"/>
		</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS990ScheduleR">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<div class="styTBB" style="width:256mm;height:auto;">
						<div class="styFNBox" style="width:40mm;height:auto;">
							<div style="padding-top:1mm;">
								<span class="styMainTitle">SCHEDULE R <br/>(Form 990)</span>
								<br/>
								<span style="width:2px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form990ScheduleRData"/>
								</xsl:call-template>
							</div>
							<div style="padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:180mm;height:auto;">
							<div class="styMainTitle" style="padding-top:2mm">Related Organizations and Unrelated Partnerships</div>
								<div class="styFBT" style="height:auto;">
								<span style="padding-right:1mm">
									<img src="{$ImagePath}/990SchR_Bullet_Md.gif" alt="MediumBullet"/>
								</span>Complete if the organization answered "Yes" on Form 990, Part IV, line 33, 34, 35b, 36, or 37.<br/>
								<span style="padding-right:1mm">
									<img src="{$ImagePath}/990SchR_Bullet_Md.gif" alt="MediumBullet"/>
								</span>Attach to Form 990. 
								<span style="padding-right:1mm;padding-left:4mm">								
								<!--<img src="{$ImagePath}/990SchR_Bullet_Md.gif" alt="MediumBullet"/>-->
								</span><!-- See separate instructions.-->
								<span style="padding-left:4mm"/>								
								<br/><img src="{$ImagePath}/990SchR_Bullet_Md.gif" alt="MediumBullet"/>
								Information about Schedule R (Form 990) and its instructions is at <!--www.irs.gov/form990.-->
								<a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/form990</i>
            </a>.
          </div>
							<div>
								<br/>
							</div>
						</div>
						<div class="styTYBox" style="width:35mm;height:auto;">
							<div class="styOMB" style="height:auto;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">16</span>
							</div>
							<div class="styPartName" style="height:auto; width:34.5mm;padding-top:0.3mm">Open to Public Inspection</div>
						</div>
					</div>
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="width:256mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:184mm;height:auto;">
							<span class="styNormalText">Name of the organization</span>
							<br/>
							<div style="font-family:verdana;font-size:6pt;height:6.25mm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:52mm;height:auto;padding-left:2mm;">
							<span class="styBoldText">Employer identification number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Name and Identifying Number Section-->
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="height:auto;width:256mm;padding-top:1mm;padding-bottom:1mm;clear:both; border-top:1px solid black">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="height:auto;width:236mm;">
        Identification of Disregarded Entities
        <span style="font-weight:normal">  Complete if the organization answered "Yes" on Form 990, Part IV, line 33.</span>
        <!-- <span class="styItalicText">(See the instructions.)</span> -->
						</div>
					<!--	<div class="styGenericDiv" style="float:right">-->
							<!-- button display logic -->
							<!--<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdDisregardedEntitiesGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'IRT1ctn' "/>
							</xsl:call-template>-->
							<!-- end button display logic
						</div> -->
					</div>
					<!-- END Part I Title -->
					<!-- BEGIN Part I Table -->
					<div class="styTableContainerLandscape" id="IRT1ctn" style="width:256mm;height:auto;display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
								<!-- a -->
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:340mm;padding-right:10mm;vertical-align:top;text-align:center;">
              (a)      
               <!-- Solid line  -->
										<br/>
										<span class="styNormalText"> Name, address, and EIN (if applicable) of disregarded entity
              <br/>
											<br/>
											<br/>
										</span>
									</th>
									<!-- b -->
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:85mm;padding-right:2mm;vertical-align:top;text-align:center;">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											<br/>
											<br/>
										</span>
									</th>
									<!--c -->
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:75mm;padding-right:2mm;vertical-align:top;text-align:center;">
              (c)<br/>
										<span class="styNormalText" style="text-align:center">Legal domicile (state <br/>or foreign country)<br/>
											<br/>
										</span>
									</th>
									<!-- d -->
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:55.25mm;padding-right:2mm;vertical-align:top;text-align:center;">
              (d)<br/>
										<span class="styNormalText">Total income<br/>
											<br/>
											<br/>
										</span>
									</th>
									<!-- e -->
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:68mm;padding-right:2mm;padding-bottom:3mm;vertical-align:top;text-align:center;">
										(e)<br/>
										<span class="styNormalText">End-of-year assets<br/>
											<br/>
											<br/>
										</span>
									</th>
									<!-- f -->
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:110.5mm;border-right-width:0px;vertical-align:top;text-align:center;">
              (f)<br/>
										<span class="styNormalText">Direct controlling<br/>entity<br/>
											<br/>
										</span>
									</th>
						<!--			<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:0px;">
										<br/>
										<span class="styNormalText">
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:0px;">
										<br/>
										<span class="styNormalText">
											<br/>
											<br/>
											<br/>
										</span>
									</th>-->
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form990ScheduleRData/IdDisregardedEntitiesGrp">
									<xsl:if test="($Print != $Separated) or (count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt;=6)">
										<tr>
									<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:126mm;padding-left:1mm;"><b>(<xsl:number value="position()" format="1"/>) </b>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DisregardedEntityName/BusinessNameLine2Txt">
													<span style="width:4px"/>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="USAddress/AddressLine2Txt != ''">
															<!--<br/> -->
															<span style="width:4px"/>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
														<!--<br/> -->
														<span style="width:4px"/>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
														</xsl:call-template>
														<br/>
													</xsl:when>
													<xsl:otherwise>
														<div style="">
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:75mm;padding-left:1mm;text-align:left;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<xsl:choose>
												<xsl:when test="LegalDomicileStateCd">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25.5mm;text-align:right;vertical-align:top">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalIncomeAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:28.05mm;text-align:right;vertical-align:top">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EndOfYearAssetsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<xsl:choose>
												<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
													<td class="styTableCellText" style="border-style: solid; border-color: black;width:130mm;text-align-left;border-right-width:0px;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:130mm;text-align:left;border-right-width:0px;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
														</xsl:call-template>
														<br/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt; 1 or ((count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt; 6) and ($Print = $Separated)) ">
									<tr>
										<!--<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:60mm;">-->
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdDisregardedEntitiesGrp"/>
											</xsl:call-template>
											<span style="width:4px"/>
									<!--	</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:56mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:33mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:55mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:55mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:0px">
											<span style="width:4px"/>
										</td>-->
									</tr>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt; 2 or ((count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt; 3 or ((count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt; 4 or ((count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt; 5 or ((count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &lt; 6 or ((count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartITableFillerRow"/>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<!--<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdDisregardedEntitiesGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'IRT1ctn' "/>
					</xsl:call-template>-->
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part I Table -->
					      <div class="styBB" style="height:auto;width:256mm;padding-top:0mm;padding-bottom:0mm;clear:both; border-top:1px solid black">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styNormalText" style="height:auto;width:236mm;font-size:8pt;padding-left:1mm;"><b>Identification of Related Tax-Exempt Organizations</b>                Complete if the organization answered "Yes" on Form 990, Part IV, line 34 because it had one or more related tax-exempt organizations during the tax year.
        </div>
						            
					<!-- BEGIN Part II Title 
					<div class="styBB" style="height:auto;width:256mm;padding-top:1mm;padding-bottom:1mm;clear:both; border-top:1px solid black">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="width:236mm;height:auto;font-size:7pt;">Identification of Related Tax-Exempt Organizations 
						<span style="font-weight:normal;"> Complete if the organization answered "Yes" on Form 990,Part IV, line 34 <br></br>because it had one or more related tax-exempt organizations during the tax year.</span>
						</div>
						<div class="styGenericDiv" style="float:right">-->
							<!-- button display logic -->
						<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedTaxExemptOrgGrp"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="containerID" select=" 'IRT2ctn' "/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						</div>
					
					<!-- END Part II Title -->
					<!-- BEGIN Part II Table -->
					<div class="styTableContainerLandscape" id="IRT2ctn" style="width:256mm;height:auto;display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
				
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:324mm;padding-right:10mm;vertical-align:top;text-align:center;" rowspan="2">
              (a)      
               <!-- Solid line  -->
										<br/>
										<span class="styNormalText"> Name, address, and EIN of related organization
              <br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:85mm;padding-right:2mm;vertical-align:top;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:75mm;padding-right:2mm;vertical-align:top;text-align:center;" rowspan="2">
              (c)<br/>
										<span class="styNormalText" style="text-align:center">Legal domicile (state <br/>or foreign country)<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:75mm;padding-right:2mm;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Exempt Code section<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:80mm;padding-right:2mm;padding-bottom:3mm;vertical-align:top;text-align:center;" rowspan="2">
										(e)<br/>
										<span class="styNormalText">Public charity status<br/>(if section 501(c)(3))<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:85mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (f)<br/>
										<span class="styNormalText">Direct controlling<br/>entity<br/>
											<br/>
										</span>
									</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:34mm;border-right-width:0px;border-left-width:0px;vertical-align:top;text-align:center;" colspan="2">
										(g)<br/>
									<span class="styNormalText" style="text-align:center">Section 512(b)(13) controlled entity?
											<br/>
											</span>
											</th>
										<tr>
										<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">Yes</th>
										
										<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:0px;vertical-align:top;text-align:center;border-top-width:0px">No</th>
									</tr>
										</tr>
										</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form990ScheduleRData/IdRelatedTaxExemptOrgGrp">
									<xsl:if test="($Print != $Separated) or (count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt;= 7) ">
										<tr>
										<!-- <td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:126mm;padding-left:1mm;"><b>(<xsl:number value="position()" format="1"/>) </b>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DisregardedEntityName/BusinessNameLine2Txt">
													<span style="width:4px"/>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>   -->
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:126mm;padding-left:1mm;">
											<b>(<xsl:number value="position()" format="1"/>)</b>
											  	<!--span style="width:4px"></span-->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="DisregardedEntityName/BusinessNameLine2Txt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:if test="USAddress/AddressLine2Txt != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
														</xsl:call-template>
														<br/>
													</xsl:when>
													<xsl:otherwise>
														<div style="">
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
												<!-- <xsl:if test="normalize-space(EIN) = ''"></xsl:if>-->
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:85mm;padding-right:2mm;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<xsl:choose>
												<xsl:when test="LegalDomicileStateCd">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:left;vertical-align:top;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExemptCodeSectionTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:left;vertical-align:top">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PublicCharityStatusTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<xsl:choose>
												<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:80mm;text-align-left;border-right-width:0px;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</td>
													<!--
													<td class="styTableCell" style="width:10mm;border-right-width:1px;">
														<span style="width:4px"/>
													</td>
													<td class="styTableCell" style="width:10mm;border-right-width:1px;">
														<span style="width:4px"/>
													</td>
                           -->
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:80mm;text-align:left;border-right-width:0px;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
														</xsl:call-template>
														<br/>
													</td>
													</xsl:otherwise>
											</xsl:choose>
												<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:0px;border-left-width:1px;vertical-align:top;text-align:center;">
												<div>
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
													</xsl:call-template>
												</div>
											</td>
									<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:0px;border-top-width:0px; border-left-width:1px;vertical-align:top;text-align:center;">
												<div>
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
														<!--<span style="padding-top:2mm;"/>-->
													</xsl:call-template>
												</div>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 1 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated)) ">
									<tr>
										<!--<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:60mm;">-->
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedTaxExemptOrgGrp"/>
											</xsl:call-template>
											<span style="width:4px"/>
										<!--</td>-->
										<!--<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:56mm;">
											<span style="width:4px"/>
									</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:33mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:55mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:0px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>-->
									</tr>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 2 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 3 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 4 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 5 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 6 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &lt; 7 or ((count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIITableFillerRow"/>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Solid line  -->
					<!-- <div class="styBB" style="width:256mm;border-right-width:0px "> </div> -->
				<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedTaxExemptOrgGrp"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="containerID" select=" 'IRT2ctn' "/>
					</xsl:call-template>-->
					<div style="width:256mm;float:none;clear:both;padding-top:.2mm;border-top:1px;" class="pageEnd">
						<div class="styGenericDiv" style="width:137mm;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 990.</div>
						<div class="styGenericDiv" style="width:50mm;">Cat. No. 50135Y</div>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule R (Form 990) 2016</span>
						</div>
					</div>
					<!-- *********BEGIN NEW PAGE 2********** -->
					<!-- header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;height:auto;" class="styBB">
						<div style="width:90mm;height:auto;" class="styGenericDiv">Schedule R (Form 990) 2016</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;height:auto;">2</span>
						</div>
					</div>
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="height:auto;width:256mm;padding-top:1mm;padding-bottom:1mm;clear:both; border-top:1px solid black">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<span class="styNormalText" style="padding-left:1mm;width:236mm;height:auto;font-size:8pt;"><b>Identification of Related Organizations Taxable as a Partnership</b> Complete if the organization answered "Yes" on Form 990, Part IV, line 34 because it had one or more related organizations treated as a partnership during the tax year.
						</span>
					<!--	<div class="styGenericDiv" style="float:right">
							 button display logic 
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="containerID" select=" 'IRT3ctn' "/>
							</xsl:call-template>
							end button display logic 
						</div>-->
					</div>
					<!-- END Part III Title -->
					
					<!-- BEGIN Part III Table -->
					<div class="styTableContainerLandscape" id="IRT3ctn" style="height:auto;display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:345mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (a)<br/>
										<span class="styNormalText">Name, address, and EIN of<br/>related organization<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:40mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (c)<br/>
										<span class="styNormalText">Legal <br/>domicile<br/> (state or foreign<br/>country)<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Direct controlling<br/>entity<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:20mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (e)<br/>
										<span class="styNormalText">Predominant income(related, unrelated, excluded from tax under sections 512-514) 
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
                (f)<br/>
										<span class="styNormalText">Share of total income<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (g)<br/>
										<span class="styNormalText">Share of end-of-year<br/> assets<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:14mm;border-right-width:1px;vertical-align:top;text-align:center;" colspan="2">
                (h)<br/>
										<span class="styNormalText">Disproprtionate allocations?<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (i)<br/>
										<span class="styNormalText">Code V-UBI <br/>amount in box 20 of <br/>Schedule K-1<br/>(Form 1065)<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:14mm;border-right-width:1px;vertical-align:top;text-align:center;" colspan="2">
              (j) <br/>
										<span class="styNormalText">General or <br/>managing<br/> partner?<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:22mm;border-right-width:0px;vertical-align:top;text-align:center;border-bottom-width:0px;">
                (k)<br/>
										<span class="styNormalText">Percentage<br/>ownership<br/>
											<br/>
											<br/>
										</span>
									</th>
									<tr>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;">No</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;">No</th>
									</tr>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt;= 7) ">
									<xsl:for-each select="$Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp">
										<tr>
									<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;padding-left:1mm;width:45mm"><b> (<xsl:number value="position()" format="1"/>) </b>  
												<!--span style="width:4px"></span-->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="RelatedOrganizationName/BusinessNameLine2Txt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:if test="USAddress/AddressLine2Txt != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>
															<br/>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
														</xsl:call-template>
														<br/>
													</xsl:when>
													<xsl:otherwise>
<!--                                                       <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AddressUS/City"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AddressUS/State"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AddressUS/ZIPCd"/>
														</xsl:call-template>     -->													
													
													
													
													
													
													
														<div style="">
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:40mm;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
												</xsl:call-template>
											</td>
											<xsl:choose>
												<xsl:when test="LegalDomicileStateCd">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;text-align:center;width:10mm;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;text-align:center;width:10mm;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;text-align-left;border-right-width:1px;width:25mm;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:25mm;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
														</xsl:call-template>
														<br/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:20mm;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PredominantIncomeTypeTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:26mm;vertical-align:top;text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfTotalIncomeAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:26mm;vertical-align:top;text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfEOYAssetsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:7mm;vertical-align:top;text-align:center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:7mm;vertical-align:top;text-align:center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:26mm;vertical-align:top;text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UBICodeVAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:7mm;vertical-align:top;text-align:center">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;border-top-width:0px;width:7mm;vertical-align:top;text-align:center">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:30mm;border-right-width:0px;padding-left:5mm;vertical-align:top;border-top-width:1px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="OwnershipPct"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 1 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated)) ">
									<tr>
									<!--	<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:60mm;">-->
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp"/>
											</xsl:call-template>
											<span style="width:4px"/>
									<!--	</td>
										<td class="styTableCell">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:10mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:30mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:7mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:7mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:8mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;border-right-width:0px;width:8mm">
											<span style="width:4px"/>
										</td>-->
									</tr>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 2 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 3 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 4 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 5 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 6 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &lt; 7 or ((count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIIITableFillerRow"/>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<!--<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="containerID" select=" 'IRT3ctn' "/>
					</xsl:call-template>-->
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part III Table -->
					

					
					<!-- BEGIN Part IV Title -->
					
				<div class="styBB" style="height:auto;width:256mm;padding-top:0mm;padding-bottom:1mm;clear:both; border-top:1px solid black;display:table;">
						<div class="styPartName" style="width:15mm;display:inline;display:table;">Part IV</div>
						<div class="styNormalText" style="padding-left:1mm;width:236mm;height:auto;font-size:8pt;">
   <b> Identification of Related Organizations Taxable as a Corporation or Trust</b> Complete if the organization answered "Yes" on Form 990, Part IV, line 34 because it had one or more related organizations treated as a corporation or trust during the tax year.
										
						</div>
						<!--<div class="styGenericDiv" style="float:right">-->
							<!-- button display logic -->
						<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp"/>
								<xsl:with-param name="containerHeight" select="7"/>
								<xsl:with-param name="containerID" select=" 'IRT4ctn' "/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						<!--</div>-->
					</div>
					<!-- END Part IV Title -->
					<!-- BEGIN Part IV Table -->
					<div class="styTableContainerLandscape" id="IRT4ctn" style="height:auto;display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								
							<tr>
								
							
				<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:78mm;padding-right:10mm;vertical-align:top;text-align:center;" rowspan="2">
              (a)<br/>
										<span class="styNormalText">Name, address, and EIN of<br/>related organization<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:40mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;text-align:center; border-style: solid; border-color: black;width:30mm;border-right-width:1px;vertical-align:top;" rowspan="2">
              (c)<br/>
										<span class="styNormalText">Legal <br/>domicile<br/> (state or foreign<br/>country)<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Direct controlling<br/>entity<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:20mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (e)<br/>
										<span class="styNormalText">Type of entity <br/>(C corp,  S corp, <br/> or trust)
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
                (f)<br/>
										<span class="styNormalText">Share of total income<br/>
											
										</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (g)<br/>
										<span class="styNormalText">Share of end-of-year<br/> assets<br/>
											
										</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:21mm;border-right-width:1px;vertical-align:top;text-align:center;border-bottom-width:0px;">
                (h)<br/>
										<span class="styNormalText">Percentage<br/>ownership<br/>
											
										</span>
									</th>
									<!-- i -->
						<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:15mm;border-right-width:0px;border-left-width:0px;vertical-align:top;text-align:center;" colspan="2">
										(i)<br/>
									<span class="styNormalText">Section 512(b)(13) controlled entity?
											<br/>
											</span>
											</th>
					<tr>
						
								<!-- This extra th with no entry pushes the yes box over into the controlled entity column -->		
					<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;text-align:center;border-left-width:1px;"/>
							<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;border-left-width:1px;">Yes</th>
							<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;text-align:center;">No</th>
					</tr>
							</tr>				
										</thead>
							<tfoot/>
							<tbody>
								
									<xsl:for-each select="$Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp">
									<xsl:if test="($Print != $Separated) or (count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt;= 7) ">
										<tr>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;padding-left:1mm;"><span style="font-weight:bold;"> (<xsl:number value="position()" format="1"/>)    </span>
												<!--span style="width:4px"></span-->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="RelatedOrganizationName/BusinessNameLine2Txt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:if test="USAddress/AddressLine2Txt != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>
															<br/>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
														</xsl:call-template>
														<br/>
													</xsl:when>
													<xsl:otherwise>
<!--                                                       <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AddressUS/City"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AddressUS/State"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AddressUS/ZIPCd"/>
														</xsl:call-template>     -->													
													
													
													
													
													
													
														<div style="">
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:40mm;vertical-align:top;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
												</xsl:call-template>
											</td>
											<xsl:choose>
												<xsl:when test="LegalDomicileStateCd">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;text-align:center;vertical-align:top;width:30mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:when>
												<xsl:otherwise>
												<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;text-align:center; width:30mm; vertical-align:top;text-align:center">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
													<td class="styTableCellText" style="border-style: solid; border-color: black;text-align-left;border-right-width:1px;width:25mm;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:25mm;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
														</xsl:call-template>
														<br/>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:20mm;border-right-width:1px;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:26mm;vertical-align:top;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfTotalIncomeAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:26mm;vertical-align:top;text-align:right;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfEOYAssetsAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:21mm;border-right-width:1px;padding-left:5mm;vertical-align:top">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="OwnershipPct"/>
												</xsl:call-template>
											<span class="styTableCellPad"/>
											</td>
										
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:1px;border-left-width:0px;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;border-top-width:0px; border-left-width:0px;text-align:center;vertical-align:top">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												
											</td>
											</tr>
											</xsl:if>
									</xsl:for-each>
								
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 1 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated)) ">
									<tr>
										<!--<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:60mm;">-->
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp"/>
											</xsl:call-template>
											<span style="width:4px"/>
									<!--	</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:40mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:30mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:20mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:21mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:21mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:21mm">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;">
											<span style="width:4px"/>
										</td>-->
									
										</tr>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 2 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 3 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 4 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 5 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 6 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &lt; 7 or ((count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt; 7) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartIVTableFillerRow"/>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
				<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp"/>
						<xsl:with-param name="containerHeight" select="7"/>
						<xsl:with-param name="containerID" select=" 'IRT4ctn' "/>
					</xsl:call-template>-->
					<!-- End Set Initial Height of Above Table -->
					<div style="width:256mm;float:none;clear:both;padding-top:.2mm;" class="pageEnd">
						<div class="styGenericDiv" style="width:137mm;"/>
						<div class="styGenericDiv" style="width:50mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule R (Form 990) 2016</span>
						</div>
					</div>
					<!-- END Part IV Table -->
					
					
					<!-- header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;height:auto;" class="styBB">
						<div style="width:90mm;height:auto;" class="styGenericDiv">Schedule R (Form 990) 2016</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;height:auto;">3</span>
						</div>
					</div>
					
					<!-- BEGIN Part V Title -->
					<div class="styBB" style="height:auto;width:256mm;padding-top:1mm;padding-bottom:1mm;clear:both; border-top:1px solid black;display:table;">
						<div class="styPartName" style="width:15mm;">Part V</div>
						<div class="styBoldText" style="padding-left:1mm;width:236mm;font-size:8pt">
        Transactions With Related Organizations
        <span style="font-weight:normal">  Complete if the organization answered "Yes" on Form 990, Part IV, line 34, 35b, or 36.</span>
       </div>
						
					</div>
				<!-- END Title -->
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:0mm;"/>
						<div class="styLNDesc" style="width:225.2mm;height:4.5mm;">
							<span style="font-weight:bold;font-style:normal">Note.</span>
 Complete line 1 if any entity is listed in Parts II, III, or IV of this schedule.     <span style="width:2px;"/>
						</div>
						<div class="styLNDesc" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;"/>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width:0px;border-top-width:0px;padding-top:0mm;padding-bottom:0mm;">
							<span class="styBoldText">Yes</span>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;padding-top:.7mm;border-bottom-width:0px;border-top-width:0px;padding-top:0mm;padding-bottom:0mm;">
							<span class="styBoldText">No</span>
						</div>
					</div>
					<div style="width:256mm;height:4.5mm;">
						<div class="styLNDesc" style="width:233mm;padding-left:2mm;">
							<span class="styBoldText">1</span>    During the tax year, did the orgranization engage in any of the following transactions with one or more related organizations listed in Parts II-IV?</div>
						<div class="styShadingCell" style="height:100%;width:5mm;height:4.5mm;border-top-width:1px;border-right-width:0px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;height:4.5mm;border-top-width:1px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;height:4.5mm;border-top-width:1px;"/>
					</div>
					<!-- line 1 a -->
					<div style="width:256mm;">
						<!--       <div class="styLNLeftNumBoxSD" style="height:4.5mm;">a</div>-->
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">a</span>
							<span style="padding-left:2mm;"/>

          Receipt of  <span style="font-weight:bold;"> (i)</span>  interest, <span style="font-weight:bold;"> (ii) </span>annuities, <span style="font-weight:bold;">(iii) </span> royalties, or<span style="font-weight:bold;"> (iv) </span> rent from a controlled entity
          
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">.....................  </span>
            
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;padding-right:1mm;border-top-width:1px;padding-top:0px;padding-bottom:0px;">1a</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style=";width:8mm;height:4.5mm;text-align:center;font-weight:bold">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/ReceiptOfIntAnntsRntsRyltsInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/ReceiptOfIntAnntsRntsRyltsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 b -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">b</span>
							<span style="padding-left:2mm;"/>

          Gift, grant, or capital contribution to related organization(s)
          <span style="width:2px;"/>
							<!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
          
    </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;padding-right:1mm;border-right-width:0px;padding-bottom:0px;padding-top:0px;">1b</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/GiftGrntOrCapContriToOthOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/GiftGrntOrCapContriToOthOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 c-->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">c</span>
							<span style="padding-left:2mm;"/>


            Gift, grant, or capital contribution from related organization(s)
          <span style="width:3px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
         
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1c</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/GiftGrntCapContriFromOthOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/GiftGrntCapContriFromOthOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 d-->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">d</span>
							<span style="padding-left:2mm;"/>


            Loans or loan guarantees to or for related organization(s)
          <span style="width:13px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
            
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1d</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/LoansOrGuaranteesToOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/LoansOrGuaranteesToOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 e-->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">e</span>
							<span style="padding-left:2mm;"/>


            Loans or loan guarantees by related organization(s)
          <span style="width:7px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>             
           
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm">1e</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/LoansOrGuaranteesFromOthOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/LoansOrGuaranteesFromOthOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;height:4.5mm;">
						<div class="styLNDesc" style="width:233mm;"/>
						<div class="styShadingCell" style="height:100%;width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;"/>
					</div>
					<!-- New line 1f for 2012-->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">f</span>
							<span style="padding-left:2mm;"/>


            Dividends from related organization(s)
          <span style="width:7px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>       
           
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm">1f</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/DivRelatedOrganizationInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/DivRelatedOrganizationInd"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- line 1 g-->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">g</span>
							<span style="padding-left:2mm;"/>


            Sale of assets to related organization(s)
          <span style="width:1px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
         
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:1px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1g</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/AssetSaleToOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/AssetSaleToOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 h-->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">h</span>
							<span style="padding-left:2mm;"/>


             Purchase of assets from related organization(s)
          <span style="width:1px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
             
           
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1h</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/AssetPurchaseFromOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/AssetPurchaseFromOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 i -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">i</span>
							<span style="padding-left:2mm;"/>


           Exchange of assets with related organization(s)
          <span style="width:1px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
             
             
             
           
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1i</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/AssetExchangeInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/AssetExchangeInd"/>
							</xsl:call-template>
						</div>
					</div>
					
					<!-- line 1 j -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">j</span>
							<span style="padding-left:2mm;"/>


           Lease of facilities, equipment, or other assets to related organization(s)
           <span style="width:4px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">.......................  </span>
         
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1j</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/RentalOfFacilitiesToOthOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/RentalOfFacilitiesToOthOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;height:4.5mm;">
						<div class="styLNDesc" style="width:233mm;"/>
						<div class="styShadingCell" style="height:100%;width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;"/>
					</div>
					<!-- line 1 k -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">k</span>
							<span style="padding-left:2mm;"/>


           Lease of facilities, equipment, or other assets from related organization(s)
           <span style="width:2px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">...................... </span>
             
          
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:1px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1k</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/RentalOfFcltsFromOthOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/RentalOfFcltsFromOthOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 l -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">l</span>
							<span style="padding-left:2mm;"/>


           Performance of services or membership or fundraising solicitations for related organization(s)
           <span style="width:4px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">..................... </span>
             
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1l</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/PerformOfServicesForOthOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/PerformOfServicesForOthOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 m -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">m</span>
							<span style="padding-left:.5mm;"/>


           Performance of services or membership or fundraising solicitations by related organization(s)
           <span style="width:4px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">.................</span>
             
         
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:0mm;">1m</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/PerformOfServicesByOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/PerformOfServicesByOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 n -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">n</span>
							<span style="padding-left:1mm;"/>


           Sharing of facilities, equipment, mailing lists, or other assets with related organization(s)

         <span style="width:2px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">...................  </span>
             
          
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:0mm;">1n</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/SharingOfFacilitiesInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/SharingOfFacilitiesInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 o -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">o</span>
							<span style="padding-left:2mm;"/>


           Sharing of paid employees with related organization(s)
            <span style="width:2px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
             
           
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1o</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/PaidEmployeesSharingInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/PaidEmployeesSharingInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;height:4.5mm;">
						<div class="styLNDesc" style="width:233mm;"/>
						<div class="styShadingCell" style="height:100%;width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;"/>
					</div>
					<!-- line 1 p -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">p</span>
							<span style="padding-left:2mm;"/>


           Reimbursement paid to related organization(s) for expenses
            <span style="width:2px;"/>
							<!--Dotted Line-->
						<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
           
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:1px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1p</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/ReimbursementPaidToOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/ReimbursementPaidToOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 q -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">q</span>
							<span style="padding-left:2mm;"/>


           Reimbursement paid by related organization(s) for expenses
            <span style="width:2px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
			
            
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1q</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/ReimbursementPaidByOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/ReimbursementPaidByOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:256mm;height:4.5mm;">
						<div class="styLNDesc" style="width:233mm;"/>
						<div class="styShadingCell" style="height:100%;width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;border-top-width:0px;"/>
						<div class="styShadingCell" style="height:100%;width:8mm;border-top-width:0px;"/>
					</div>
					<!-- line 1 r -->
					<div style="width:256mm;">
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">r</span>
							<span style="padding-left:2mm;"/>


           Other transfer of cash or property to related organization(s)
            <span style="width:2px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
         
        </div>
						<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:1px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1r</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransferToOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:1px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransferToOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 1 s -->
					<div style="width:256mm;height:4.5mm;border-bottom-width:0px;">
						<!-- padding-top:.7mm-->
						<div class="styLNDesc" style="width:233mm;height:4.5mm;">
							<span style="padding-left:4mm;font-weight:bold;">s</span>
							<span style="padding-left:2mm;"/>

           Other transfer of cash or property from related organization(s)
            <span style="width:2px;"/>
							<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; ">............................  </span>
             </div>
	<div class="styLNRightNumBox" style="width:5mm;height:4.5mm;border-top-width:0px;border-right-width:0px;float:left;padding-bottom:0px;padding-top:0px;padding-right:1mm;">1s</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransferFromOtherOrgInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS990ScheduleRLNYesNoBox" style="width:8mm;height:4.5mm;text-align:center;font-weight:bold;border-top-width:0px;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransferFromOtherOrgInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- line 2 table -->
					<div class="styBB" style="width:256mm;border-top-width:0px;"/>
					<!-- Solid line across -->
					<div style="width:256mm;">
						<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-top:.7mm;">2</div>
						<div class="styLNDesc" style="width:227mm;height:4.5mm;">
           If the answer to any of the above is "Yes," see the instructions for information on who must complete this line, including covered relationships and transaction thresholds.
          <!--Dotted Line-->
						</div>
						<!--<div class="styGenericDiv" style="float:right">-->
							<!-- button display logic -->
						<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransactionsRelatedOrgGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'IRT5ctn' "/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						<!--</div>-->
					</div>
					<!-- BEGIN Question 2 PART V-->
					<div class="styTableContainerLandscape" id="IRT5ctn" style="width:256mm;border-top-width:1px;display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:117mm;padding-right:10mm;border-top-width:1px;vertical-align:top;text-align:center;">(a)      
              <br/>
										<span class="styNormalText"> Name of related organization
              
               </span>
									</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:30mm;padding-right:2mm;border-top-width:1px;vertical-align:top;text-align:center;">
              (b)<br/>
										<span class="styNormalText">Transaction<br/>type (a-s)</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:30mm;padding-right:2mm;border-right-width:1px;border-top-width:1px;vertical-align:top;text-align:center;">
              (c)<br/>
										<span class="styNormalText">Amount involved </span>
									</th>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:79mm;padding-right:2mm;border-right-width:0px;border-top-width:1px;vertical-align:top;text-align:center;">
              (d)<br/>
										<span class="styNormalText">Method of determining amount involved</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt;= 6) ">
									<xsl:for-each select="$Form990ScheduleRData/TransactionsRelatedOrgGrp">
										<tr>
											<td class="styTableCellText" style="border-style: solid; border-color: black;width:117mm;padding-right:4mm;vertical-align:top">
												<span style="font-weight:bold;"> (<xsl:number value="position()" format="1"/>)    </span>
												<span style="font-weight:regular;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherOrganizationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="OtherOrganizationName/BusinessNameLine2Txt">
													<span style="width:4px;"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherOrganizationName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
											</td>
											<td class="styTableCellText" style="border-style: solid; border-color: black;width:30mm;padding-left:1mm;text-align:center;padding-right:4mm;text-align:left;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionTypeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-style: solid; border-color: black;width:30mm;border-right-width:1px;vertical-align:top;text-align:center;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvolvedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="border-style: solid; border-color: black;width:79mm;border-right-width:0px;text-align:left;text-align:left;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MethodOfAmountDeterminationTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt; 2 or ((count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt; 6) and ($Print = $Separated)) ">
									<tr>
									<!--	<td class="styTableCellText" style="border-style: solid; border-color: black;width:60mm;border-right-width:1px;">-->
											<span style="font-weight:bold;"> <!--(<xsl:number value="position()" format="1"/>)-->    </span>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransactionsRelatedOrgGrp"/>
											</xsl:call-template>
										<!--</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:30mm;border-bottom-width:1px;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:30mm;border-bottom-width:1px;border-right-width:0px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="border-style: solid; border-color: black;width:79mm;border-bottom-width:1px;border-right-width:0px">
											<span style="width:4px"/>
										</td>-->
									</tr>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt; 2 or ((count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVTableFillerRow2"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt; 3 or ((count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVTableFillerRow3"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt; 4 or ((count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVTableFillerRow4"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt; 5 or ((count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVTableFillerRow5"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &lt; 6 or ((count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVTableFillerRow6"/>
								</xsl:if>
							</tbody>
						</table>
					</div>
				<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/TransactionsRelatedOrgGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'IRT5ctn' "/>
					</xsl:call-template>-->
					
					<div style="width:256mm;float:none;clear:both;padding-top:.2mm;" class="pageEnd">
						<div class="styGenericDiv" style="width:137mm;"/>
						<div class="styGenericDiv" style="width:50mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule R (Form 990) 2016</span>
						</div>
					</div>
					<!-- Set Initial Height of Above Table -->
					<!-- End Set Initial Height of Above Table -->
					<div style="width:256mm;float:none;clear:both;padding-top:1mm;">
						
					</div>
					<!-- END Part V -->
					<!-- *********BEGIN NEW PAGE 4********** -->
					<!-- header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;height:auto;" class="styBB">
						<div style="width:90mm;height:auto;" class="styGenericDiv">Schedule R (Form 990) 2016</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">4</span>
						</div>
					</div>
				
					<!-- BEGIN Part VI Title -->
					<div class="styBB" style="width:256mm;padding-top:1mm;padding-bottom:1mm;clear:both; border-top:1px solid black;display:table;">
						<div class="styPartName" style="width:15mm;">Part VI</div>
						<div class="styPartDesc" style="height:auto;width:241mm;">Unrelated Organizations Taxable as a Partnership 
		<span style="font-weight:normal">  Complete if the organization answered "Yes" on Form 990, Part IV, line 37.</span>
</div>						
												<span class="styNormalText" style="border-top:1px solid black;width:256mm;"> Provide the following information for each entity taxed as a partnership through which the organization conducted more than five percent of its activities (measured by total assets 
or gross revenue) that was not a related organization. See instructions regarding exclusion for certain investment partnerships.
</span>
			</div>		
					<!--<div class="styGenericDiv">-->
						<!-- button display logic -->
					<!--	<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp"/>
							<xsl:with-param name="containerHeight" select="16"/>
							<xsl:with-param name="containerID" select=" 'IRT6ctn' "/>
						</xsl:call-template>-->
						<!--</div>-->
						<!-- end button display logic -->
					
					<!-- END Part VI Title -->
					<!-- BEGIN Part VI Table -->
					<div class="styTableContainerLandscape" id="IRT6ctn" style="display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;width:324mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (a)<br/>
										<span class="styNormalText" style="text-align:center">Name, address, and EIN of entity</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;width:46mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText" style="text-align:center">Primary activity</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;width:25mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (c)<br/>
										<span class="styNormalText" style="text-align:center">Legal domicile<br/> (state or foreign<br/>country)</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Predominant income (related, unrelated, excluded from tax under sections 512-514) 
											<br/>
											<br/>
										</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;width:20mm;border-right-width:1px;vertical-align:top;text-align:center;" colspan="2">
                (e)<br/>
										<span class="styNormalText">Are all partners<br/> section <br/>501(c)(3) <br/>organizations?</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
                (f)<br/>
										<span class="styNormalText">Share of total income<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:40mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (g)<br/>
										<span class="styNormalText">Share of <br/>end-of-year<br/> assets</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;width:35mm;border-right-width:1px;text-align:center" colspan="2">
                (h)<br/>
										<span class="styNormalText">Disproprtionate allocations?</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;text-align:center;width:35mm;border-right-width:1px;" rowspan="2">
              (i)<br/>
										<span class="styNormalText">Code V-UBI <br/>amount in box 20 <br/>of Schedule K-1<br/>(Form 1065)</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;vertical-align:top;text-align:center;width:14mm;border-right-width:1px;" colspan="2">
              (j) <br/>
										<span class="styNormalText">General or <br/>managing<br/> partner?</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:22mm;border-right-width:0px;vertical-align:top;text-align:center;border-bottom-width:0px;">
                (k)<br/>
										<span class="styNormalText">Percentage<br/>ownership<br/>
											<br/>
											<br/>
										</span>
									</th>
									<tr>
	<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;border-top-width:0px">Yes</th>
	<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;border-top-width:0px">No</th>
	<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;border-top-width:0px">Yes</th>
	<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;border-top-width:0px">No</th>
	<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;border-top-width:0px">Yes</th>
	<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;text-align:center;border-top-width:0px">No</th>
									</tr>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt;=16) ">
									<xsl:for-each select="$Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp">
										<tr>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:324mm;padding-left:1mm;vertical-align:top">
											<span style="font-weight:bold;"> (<xsl:number value="position()" format="1"/>)    </span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="BusinessName/BusinessNameLine2Txt">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<br/>
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="USAddress/AddressLine2Txt != ''">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>
															<br/>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
														</xsl:call-template>,<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
														</xsl:call-template>
														<br/>
													</xsl:when>
													<xsl:otherwise>
														<div style="">
															<xsl:call-template name="PopulateForeignAddressTemplate">
																<xsl:with-param name="TargetNode" select="ForeignAddress"/>
															</xsl:call-template>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:46mm;border-right-width:1px;vertical-align:top">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
												</xsl:call-template>
											</td>
											<xsl:choose>
												<xsl:when test="LegalDomicileStateCd">
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
														</xsl:call-template>
													</td>
												</xsl:when>
												<xsl:otherwise>
													<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:25mm;text-align:center;vertical-align:top">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
														</xsl:call-template>
													</td>
												</xsl:otherwise>
											</xsl:choose>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:25mm;vertical-align:top;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PredominateIncomeDesc"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;border-top-width:0px;vertical-align:top;text-align:center;">
												<div>
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="AllPartnersC3SInd"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;border-top-width:0px;vertical-align:top;text-align:center;">
												<div>
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="AllPartnersC3SInd"/>
														<!--<span style="padding-top:2mm;"/>-->
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;border-right-width:1px;width:35mm;vertical-align:top;text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfTotalIncomeAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:35mm;border-right-width:1px;vertical-align:top;text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfEOYAssetsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;border-top-width:0px;vertical-align:top;text-align:center;">
												<div>
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;border-top-width:0px;vertical-align:top;text-align:center;">
												<div>
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
														<!--<span style="padding-top:2mm;"/>-->
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:35mm;border-right-width:1px;vertical-align:top;text-align:right;font-size:6pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UBICodeVAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;border-top-width:0px;vertical-align:top;text-align:center">
												<div>
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px;border-top-width:0px;vertical-align:top;text-align:center">
												<div>
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
														<!--<span style="padding-top:2mm;"/>-->
													</xsl:call-template>
												</div>
											</td>
											<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:0px;vertical-align:top;text-align:center;border-top-width:1px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="OwnershipPct"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 1 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated)) ">
									<tr>
								<!--		<td class="styTableCellText" style="height:auto;border-style: solid; border-color: black;width:60mm;">-->
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp"/>
											</xsl:call-template>
											<span style="width:4px"/>
										<!--</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:40mm;">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:40mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:35mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:1px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:7mm;border-right-width:0px">
											<span style="width:4px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;border-right-width:0px;width:8mm">
											<span style="width:4px"/>
										</td>-->
										
									</tr>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 2 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 3 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 4 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 5 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 6 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 7 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 8 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 9 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 10 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 11 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 12 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 13 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 14 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 15 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &lt; 16 or ((count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt; 16) and ($Print = $Separated))">
									<xsl:call-template name="IRS990PartVITableFillerRow"/>
								</xsl:if>
							</tbody>
						</table>
					</div>
				
				<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerHeight" select="16"/>
						<xsl:with-param name="containerID" select=" 'IRT6ctn' "/>
					</xsl:call-template>-->
					<!-- End Part VI Table -->
					<div style="width:256mm;float:none;clear:both;padding-top:.2mm;" class="pageEnd">
						<div class="styGenericDiv" style="width:137mm;"/>
						<div class="styGenericDiv" style="width:50mm;"/>
						<div class="styGenericDiv" style="float:right;padding-right:4mm">
							<span class="styBoldText">Schedule R (Form 990) 2016</span>
						</div>
					</div>
					<!-- *********BEGIN NEW PAGE 5********** -->
					<!-- header -->
					<div style="width:256mm;clear:both;padding-bottom:.5mm;float:none;clear:both;height:auto;" class="styBB">
						<div style="width:90mm;height:auto;" class="styGenericDiv">Schedule R (Form 990) 2016</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;padding-right:4mm" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">5</span>
						</div>
					</div>
					<!-- Part VII Supplemental Information -->
					<div class="styGenericDiv" style="height:auto;width: 256mm;">
						<div class="styPartName" style="width:18mm;">Part VII</div>
						<div class="styPartDesc" style="height:auto;width:238mm;font-weight:bold; ">
Supplemental Information
</div>
						<div class="IRS990ScheduleRLineDesc" style="height:auto;width:256mm;height:4.5mm; border-top-width:0px;padding-top:1mm;border-bottom-width:0px;border-right-width:0px;padding-left:21mm">
Provide additional information for responses to questions on Schedule R (see instructions).
<!--<span style="float:right;clear:none">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/Form990ScheduleRPartVII"/>
									<xsl:with-param name="containerHeight" select="20"/>
									<xsl:with-param name="containerID" select="'SUPctn'"/>
								</xsl:call-template>
							</span>-->
						</div>
					</div>
					<div class="styTableContainerLandscape " style="height:auto;width: 256mm;  border-bottom-width: 1px;display:table;" id="SUPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black;" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
									<!--<th class="styDepTblCell" style="width:50mm" scope="col">Identifier</th>-->
									<th class="styDepTblCell" style="width:50mm" scope="col">Return Reference</th>
									<th class="styDepTblCell" style="width:206mm" scope="col">Explanation</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print != $Separated) or count($Form990ScheduleRData/SupplementalInformationDetail) &lt;= 20">
									<xsl:for-each select="$Form990ScheduleRData/SupplementalInformationDetail">
										<tr>
									<!--		<td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IdentifierTxt"/>
												</xsl:call-template>
											</td>-->
											<td class="styTableCell" style="text-align:left; border-right-width: 1px; width: 50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:left; border-right-width: 0px; width: 206mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!--<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$Form990ScheduleRData/SupplementalInformationDetail"/>
						<xsl:with-param name="containerHeight" select="20"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>-->
					
					
					<!-- Page Footer -->
					
					<div class="pageEnd" style="width:256mm;">
      <span style="width:220mm;"/>
					<span style="font-weight:bold;font-size:6pt;">Schedule R (Form 990) 2016</span>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					 <p style="page-break-before: always"/> 
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$Form990ScheduleRData"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- AddTable Part I Start -->
					<xsl:if test="($Print = $Separated) and (count($Form990ScheduleRData/IdDisregardedEntitiesGrp) &gt;=6)">
						<span class="styRepeatingDataTitle">Form 990, Schedule R, Part I - Identification of Disregarded Entities</span>
						<!-- BEGIN Part I Table -->
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:340mm;padding-right:10mm;height:auto;">
              (a)      
           
              <br/>
										<span class="styNormalText"> Name, address, and EIN (if applicable) of disregarded entity
              <br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:85mm;padding-right:2mm;height:auto;">
              (b)<br/>
										<span class="styNormalText">Primary Activity<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:75mm;padding-right:2mm;height:auto;">
              (c)<br/>
										<span class="styNormalText" style="text-align:center">Legal Domicile (State <br/>or Foreign Country)<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:55.25mm;padding-right:2mm;height:auto;">
              (d)<br/>
										<span class="styNormalText">Total income<br/><br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:68mm;padding-right:2mm;padding-bottom:3mm;height:auto;">
										<br/>(e)<br/>
										<span class="styNormalText">End-of-year assets<br/><br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:110.5mm;border-right-width:0px;height:auto;">
              (f)<br/>
										<span class="styNormalText">Direct Controlling<br/>Entity<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:0px;height:auto;">
										<br/>
										<span class="styNormalText">
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:10mm;border-right-width:0px;height:auto;">
										<br/>
										<span class="styNormalText">
											<br/>
											<br/>
											<br/>
										</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$Form990ScheduleRData/IdDisregardedEntitiesGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="height:auto;width:126mm;padding-left:1mm;">(<xsl:number value="position()" format="1"/>)
										<!--span style="width:4px"></span-->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="DisregardedEntityName/BusinessNameLine2Txt">
											<span style="width:4px"/>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:choose>
											<xsl:when test="USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="USAddress/AddressLine2Txt != ''">
													<!--<br/> -->
													<span style="width:4px"/>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<!--<br/> -->
												<span style="width:4px"/>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>,<span style="width:4px"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>
												<span style="width:4px"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
												<br/>
											</xsl:when>
											<xsl:otherwise>
												<div style="">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</div>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellText" style="height:auto;width:75mm;padding-left:1mm;vertical-align:top;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<xsl:choose>
										<xsl:when test="LegalDomicileStateCd">
											<td class="styTableCellText" style="height:auto;width:25mm;text-align:center;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styTableCellText" style="height:auto;width:25mm;text-align:center;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styTableCell" style="height:auto;width:30mm;text-align:right;vertical-align:top;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalIncomeAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="height:auto;width:33mm;text-align:right;vertical-align:top;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="EndOfYearAssetsAmt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<xsl:choose>
										<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
											<td class="styTableCellText" style="height:auto;width:100mm;text-align-left;border-right-width:0px;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styTableCellText" style="height:auto;width:100mm;text-align:left;border-right-width:0px;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
												</xsl:call-template>
												<br/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styTableCell" style="height:auto;width:10mm;border-right-width:0px;vertical-align:top;">
										<span style="width:4px"/>
									</td>
									<td class="styTableCell" style="height:auto;width:10mm;border-right-width:0px;vertical-align:top;">
										<span style="width:4px"/>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- AddTable Part I End -->
					<!-- AddTable Part II Start -->
					<xsl:if test="($Print = $Separated) and (count($Form990ScheduleRData/IdRelatedTaxExemptOrgGrp) &gt;= 6) ">
						<span class="styRepeatingDataTitle">Form 990, Schedule R, Part II - Identification of Related Tax-Exempt Organizations </span>
						<!-- BEGIN Part II Table -->
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="height:auto;width:324mm;padding-right:10mm;vertical-align:top;text-align:center;" rowspan="2">
              (a)      
               <!-- Solid line  -->
										<br/>
										<span class="styNormalText"> Name, address, and EIN of related organization
              <br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:85mm;padding-right:2mm;vertical-align:top;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:75mm;padding-right:2mm;vertical-align:top;text-align:center;" rowspan="2">
              (c)<br/>
										<span class="styNormalText" style="text-align:center">Legal domicile (state <br/>or foreign country)<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:75mm;padding-right:2mm;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Exempt Code section<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:80mm;padding-right:2mm;padding-bottom:3mm;vertical-align:top;text-align:center;" rowspan="2">
										(e)<br/>
										<span class="styNormalText">Public charity status<br/>(if section 501(c)(3))<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:85mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (f)<br/>
										<span class="styNormalText">Direct controlling<br/>entity<br/>
											<br/>
										</span>
									</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;width:34mm;border-right-width:0px;border-left-width:0px;vertical-align:top;text-align:center;" colspan="2">
										(g)<br/>
									<span class="styNormalText" style="text-align:center">Section 512(b)(13) controlled entity?
											<br/>
											</span>
											</th>
										<tr>
										<th class="styTableCellHeader" scope="col" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">Yes</th>
										
										<th class="styTableCellHeader" scope="col" style="height:auto;width:7mm;border-right-width:0px;vertical-align:top;text-align:center;border-top-width:0px">No</th>
								</tr>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$Form990ScheduleRData/IdRelatedTaxExemptOrgGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="height:auto;width:86mm;padding-left:1mm;text-align:left;vertical-align:top;">(<xsl:number value="position()" format="1"/>)
									
										<br/>
										<xsl:if test="DisregardedEntityName/BusinessNameLine2Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DisregardedEntityName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										<br/>
										<xsl:choose>
											<xsl:when test="USAddress">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:if test="USAddress/AddressLine2Txt != ''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
													</xsl:call-template><br/>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
												</xsl:call-template>,<span style="width:4px"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
												</xsl:call-template>
												<span style="width:4px"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
												</xsl:call-template>
												<br/>
											</xsl:when>
											<xsl:otherwise>
												<div style="">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</div>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
										<!-- <xsl:if test="normalize-space(EIN) = ''"></xsl:if>-->
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCellText" style="height:auto;width:85mm;padding-right:2mm;vertical-align:top;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<xsl:choose>
										<xsl:when test="LegalDomicileStateCd">
											<td class="styTableCellText" style="height:auto;width:25mm;text-align:center;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</xsl:when>
										<xsl:otherwise>
											<td class="styTableCellText" style="height:auto;width:25mm;text-align:center;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</xsl:otherwise>
									</xsl:choose>
									<td class="styTableCell" style="height:auto;width:25mm;padding-right:8mm;text-align:left;vertical-align:top;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExemptCodeSectionTxt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<td class="styTableCell" style="height:auto;width:25mm;text-align:left;vertical-align:top;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PublicCharityStatusTxt"/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
									<xsl:choose>
										<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
											<td class="styTableCellText" style="height:auto;width:80mm;text-align-left;border-right-width:0px;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</td>
											
										</xsl:when>
										<xsl:otherwise>
											<td class="styTableCellText" style="height:auto;width:80mm;text-align:left;border-right-width:0px;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
												</xsl:call-template>
												<br/>
											</td>
										
										</xsl:otherwise>
									</xsl:choose>
									<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:0px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</div>
										</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- AddTable Part II End -->
					<!-- AddTable Part III Start -->
					<xsl:if test="($Print = $Separated) and (count($Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp) &gt;= 7) ">
						<span class="styRepeatingDataTitle">Form 990, Schedule R, Part III - Identification of Related Organizations Taxable as a Partnership  </span>
						<!-- BEGIN Part III Table -->
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="height:auto;width:40.5mm;border-right-width:1px" rowspan="2">
              (a)<br/>
										<span class="styNormalText">Name, address, and EIN of<br/>related organization<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:40mm;border-right-width:1px" rowspan="2">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:10.5mm;border-right-width:1px" rowspan="2">
              (c)<br/>
										<span class="styNormalText">Legal <br/>Domicile<br/> (State or <br/>Foreign<br/>Country)<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:25.5mm;border-right-width:1px" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Direct Controlling<br/>Entity<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:25.5mm;border-right-width:1px" rowspan="2">
              (e)<br/>
										<span class="styNormalText">Predominant<br/>income(related, unrelated, excluded from tax under sections <br/>512-514) <br/>
										
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:26mm;border-right-width:1px" rowspan="2">
                (f)<br/>
										<span class="styNormalText">Share of total income<br/><br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:26mm;border-right-width:1px;" rowspan="2">
              (g)<br/>
										<span class="styNormalText">Share of end-of-year assets<br/><br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:14mm;border-right-width:1px" colspan="2">
                (h)<br/>
										<span class="styNormalText">Disproprtionate allocations?<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:43mm;border-right-width:1px;" rowspan="2">
              (i)<br/>
										<span class="styNormalText">Code V-UBI amount in<br/>Box 20 of Schedule K-1<br/>(Form 1065)<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:14mm;border-right-width:1px;" colspan="2">
              (j) <br/>
										<span class="styNormalText">General or <br/>Managing<br/> Partner?<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:22mm;border-right-width:0px">
                (k)<br/>
										<span class="styNormalText">Percentage<br/>ownership<br/>
											<br/>
											<br/>
										</span>
									</th>
									<tr>
										<th class="styTableCellHeader" scope="col" style="height:auto;width:7mm;border-right-width:1px;text-align:center;">Yes</th>
										<th class="styTableCellHeader" scope="col" style="height:auto;width:7mm;border-right-width:1px;text-align:center;">No</th>
										<th class="styTableCellHeader" scope="col" style="height:auto;width:7mm;border-right-width:1px;text-align:center;">Yes</th>
										<th class="styTableCellHeader" scope="col" style="height:auto;width:7mm;border-right-width:1px;text-align:center;">No</th>
									</tr>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
							<xsl:for-each select="$Form990ScheduleRData/IdRelatedOrgTxblPartnershipGrp">
									<tr>
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
										<xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="height:auto;width:60mm;padding-left:1mm;">(<xsl:number value="position()" format="1"/>)
											<!--span style="width:4px"></span-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="RelatedOrganizationName/BusinessNameLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:if test="USAddress/AddressLine2Txt != ''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
													</xsl:call-template>,<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
													</xsl:call-template>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
													</xsl:call-template>
													<br/>
												</xsl:when>
												<xsl:otherwise>
													<div style="">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="height:auto;width:40mm;border-right-width:1px;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
											</xsl:call-template>
										</td>
										<xsl:choose>
											<xsl:when test="LegalDomicileStateCd">
												<td class="styTableCellText" style="height:auto;width:10.5mm;text-align:center;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCellText" style="height:auto;width:10.5mm;text-align:center;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
												<td class="styTableCellText" style="height:auto;width:20mm;text-align-left;border-right-width:1px;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCellText" style="height:auto;width:20mm;border-right-width:1px;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
													</xsl:call-template>
													<br/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCellText" style="height:auto;width:22mm;border-right-width:1px;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PredominantIncomeTypeTxt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:auto;width:26mm;padding-left:7mm;border-right-width:1px;vertical-align:top;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShareOfTotalIncomeAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:auto;width:26mm;padding-left:7mm;border-right-width:1px;vertical-align:top;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShareOfEOYAssetsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:26mm;padding-left:10mm;border-right-width:1px;vertical-align:top;font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UBICodeVAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:30mm;border-right-width:0px;padding-left:5mm;vertical-align:top;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="OwnershipPct"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- AddTable Part III End -->
					<!-- AddTable Part IV Start -->
					<xsl:if test="($Print = $Separated) and (count($Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp) &gt;=7)">
						<span class="styRepeatingDataTitle">Form 990, Schedule R, Part IV - Identification of Related Organizations Taxable as a Corporation or Trust   </span>
						<!-- BEGIN Part IV Table -->
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!--<div class="styBB" style="width:64mm;border-right-width:1px;"> </div> -->
									<!-- Solid line across -->
								
								
							
				<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:78mm;padding-right:10mm;vertical-align:top;text-align:center;" rowspan="2">
              (a)<br/>
										<span class="styNormalText">Name, address, and EIN of<br/>related organization<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:40mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText">Primary activity<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;text-align:center; border-style: solid; border-color: black;width:30mm;border-right-width:1px;vertical-align:top;" rowspan="2">
              (c)<br/>
										<span class="styNormalText">Legal <br/>domicile<br/> (state or foreign<br/>country)<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:25mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Direct controlling<br/>entity<br/>
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:20mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (e)<br/>
										<span class="styNormalText">Type of entity <br/>(C corp,  S corp, <br/> or trust)
											
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
                (f)<br/>
										<span class="styNormalText">Share of total income<br/>
											
										</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (g)<br/>
										<span class="styNormalText">Share of end-of-year<br/> assets<br/>
											
										</span>
									</th>
									
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:21mm;border-right-width:1px;vertical-align:top;text-align:center;">
                (h)<br/>
										<span class="styNormalText">Percentage<br/>ownership<br/>
											
										</span>
									</th>
									<!-- i -->
						<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:15mm;border-right-width:0px;border-left-width:0px;vertical-align:top;text-align:center;" colspan="2">
										(i)<br/>
									<span class="styNormalText">Section 512(b)(13) controlled entity?
											<br/>
											</span>
											</th>
					<tr>
						
								<!-- This extra th with no entry pushes the yes box over into the controlled entity column -->		
					<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;text-align:center;border-left-width:1px;"/>
							<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:1px;text-align:center;border-left-width:1px;">Yes</th>
							<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:10mm;border-right-width:0px;text-align:center;">No</th>
					</tr>
							</tr>				
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form990ScheduleRData/IdRelatedOrgTxblCorpTrGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="height:auto;width:78mm;padding-left:1mm;">(<xsl:number value="position()" format="1"/>)
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="RelatedOrganizationName/BusinessNameLine2Txt">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedOrganizationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="USAddress/AddressLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
													</xsl:call-template>,<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
													</xsl:call-template>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
													</xsl:call-template>
													<br/>
												</xsl:when>
												<xsl:otherwise>
													<div style="">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="height:auto;width:22mm;border-right-width:1px;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<xsl:choose>
											<xsl:when test="LegalDomicileStateCd">
												<td class="styTableCellText" style="height:auto;width:32mm;text-align:center;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCellText" style="height:auto;width:32mm;text-align:center;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="DirectControllingEntityName/BusinessNameLine1Txt">
												<td class="styTableCellText" style="height:auto;width:32mm;text-align-left;border-right-width:1px;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectControllingEntityName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCellText" style="height:auto;width:32mm;border-right-width:1px;vertical-align:top;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DirectControllingNACd"/>
													</xsl:call-template>
													<br/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCellText" style="height:auto;width:32mm;border-right-width:1px;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EntityTypeTxt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:auto;width:32mm;padding-left:5mm;border-right-width:1px;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShareOfTotalIncomeAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="height:auto;width:32mm;padding-left:5mm;border-right-width:1px;vertical-align:top;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShareOfEOYAssetsAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="height:auto;width:26mm;border-right-width:1px;padding-left:5mm;vertical-align:top;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="OwnershipPct"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:0px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="ControlledOrganizationInd"/>
													</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- AddTable Part IV End -->
					<!-- AddTable Part V Q2 Start -->
					<!-- BEGIN Question 2 PART V-->
					<xsl:if test="($Print = $Separated) and (count($Form990ScheduleRData/TransactionsRelatedOrgGrp) &gt;= 6) ">
						<span class="styRepeatingDataTitle">Form 990, Schedule R, Part V - Transactions With Related Organizations   </span>
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="height:auto;width:196mm;padding-right:10mm;border-top-width:1px">
              (a)      
              
              <br/>
										<span class="styNormalText"> Name of related organization
              <br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:30mm;padding-right:2mm;border-top-width:1px">
              (b)<br/>
										<span class="styNormalText">Transaction<br/>type(a-s)<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:30mm;padding-right:2mm;border-right-width:1px;border-top-width:1px">
              (c)<br/>
										<span class="styNormalText">Amount Involved <br/><br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:49mm;padding-right:2mm;border-right-width:0px;border-top-width:1px">
              (d)<br/>
										<span class="styNormalText">Method of determining amount involved</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form990ScheduleRData/TransactionsRelatedOrgGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="height:auto;width:196mm;padding-right:4mm;">
											<span style="font-weight:bold;padding-left:2mm;padding-right:4mm"> (<xsl:number value="position()" format="1"/>)    </span>
								<span style="font-weight:regular;text-align:left;padding-left:1mm;vertical-align:top;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherOrganizationName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="OtherOrganizationName/BusinessNameLine2Txt">
												<span style="width:4px;padding-left:8mm;padding-right:4mm;text-align:left;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OtherOrganizationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
										</td>
										<td class="styTableCellText" style="height:auto;width:30mm;padding-left:1mm;text-align:center;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TransactionTypeTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="height:auto;width:30mm;padding-left:1mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvolvedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="height:auto;width:79mm;padding-left:1mm;border-right-width:0px;text-align:left;vertical-align:top;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MethodOfAmountDeterminationTxt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- AddTable Part V Q2 End -->
					<!-- AddTable Part VI Start -->
					<xsl:if test="($Print = $Separated) and (count($Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp) &gt;= 16) ">
						<span class="styRepeatingDataTitle">Form 990, Schedule R, Part VI - Unrelated Organizations Taxable as a Partnership   </span>
						<!-- BEGIN Part VI Table -->
						<table class="styLeftOverTblLandscape" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="height:auto;width:40.5mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (a)<br/>
										<span class="styNormalText" style="text-align:center">Name, address, and EIN of entity<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:25.5mm;border-right-width:1px;text-align:center;" rowspan="2">
              (b)<br/>
										<span class="styNormalText" style="text-align:center">Primary Activity<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:60.5mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (c)<br/>
										<span class="styNormalText" style="text-align:center">Legal domicile<br/> (state or foreign<br/>country)<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:25mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (d)<br/>
										<span class="styNormalText">Predominant income(related, unrelated, excluded from tax under sections 512-514) 
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:14mm;border-right-width:1px;vertical-align:top;text-align:center;" colspan="2">
                (e)<br/>
										<span class="styNormalText" style="text-align:center">Are all<br/>partners<br/>501(c)(3)<br/>organizations?<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:26mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
                (f)<br/>
										<span class="styNormalText" style="text-align:center">Share of total income<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:45mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (g)<br/>
										<span class="styNormalText">Share of <br/>End-of-year<br/> assets<br/><br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:14mm;border-right-width:1px;vertical-align:top;text-align:center;" colspan="2">
                (h)<br/>
										<span class="styNormalText">Disproprtionate allocations?<br/>
											<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:45mm;border-right-width:1px;vertical-align:top;text-align:center;" rowspan="2">
              (i)<br/>
										<span class="styNormalText">Code V-UBI <br/>amount in Box<br/> 20 of K-1<br/><br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:14mm;border-right-width:0px;vertical-align:top;text-align:center;" colspan="2">
              (j) <br/>
										<span class="styNormalText">General or <br/>Managing<br/> Partner?<br/>
											<br/>
											<br/>
											<br/>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;width:22mm;border-right-width:0px;vertical-align:top;text-align:center;">
                (k)<br/>
										<span class="styNormalText">Percentage<br/>ownership<br/>
											<br/>
											<br/>
										</span>
									</th>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:1px;text-align:center;">Yes</th>
										<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:1px;text-align:center;">No</th>
										<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:1px;text-align:center;">Yes</th>
										<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:1px;text-align:center;">No</th>
										<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:1px;text-align:center;">Yes</th>
										<th class="styTableCellHeader" scope="col" style="width:7mm;border-right-width:0px;text-align:center;">No</th>
									</tr>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form990ScheduleRData/UnrelatedOrgTxblPartnershipGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="height:auto;width:60mm;padding-left:1mm;">(<xsl:number value="position()" format="1"/>)
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="BusinessName/BusinessNameLine2Txt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<br/>
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="USAddress/AddressLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
													</xsl:call-template>,<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
													</xsl:call-template>
													<span style="width:4px"/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
													</xsl:call-template>
													<br/>
												</xsl:when>
												<xsl:otherwise>
													<div style="">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="height:auto;width:40mm;border-right-width:1px;vertical-align:top;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PrimaryActivitiesTxt"/>
											</xsl:call-template>
										</td>
										<xsl:choose>
											<xsl:when test="LegalDomicileStateCd">
												<td class="styTableCellText" style="height:auto;width:47.5mm;text-align:center;vertical-align:top;border-right-width:1px;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LegalDomicileStateCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td class="styTableCellText" style="height:auto;width:47.5mm;text-align:center;vertical-align:top;border-right-width:1px;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LegalDomicileForeignCountryCd"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
										<td class="styTableCellText" style="height:auto;border-right-width:1px;width:25mm;text-align:left;vertical-align:top;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PredominateIncomeDesc"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="AllPartnersC3SInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="AllPartnersC3SInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCell" style="height:auto;border-right-width:1px;width:31mm;text-align:right;vertical-align:top;font-size:8;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShareOfTotalIncomeAmt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										<td class="styTableCell" style="height:auto;width:26mm;border-right-width:1px;text-align:right;vertical-align:top;font-size:8;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShareOfEOYAssetsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DisproportionateAllocationsInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:26mm;border-right-width:1px;vertical-align:top;text-align:right;font-size:8;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UBICodeVAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:1px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:7mm;border-right-width:0px;vertical-align:top;text-align:center;">
											<div>
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="GeneralOrManagingPartnerInd"/>
													<!--<span style="padding-top:2mm;"/>-->
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="height:auto;width:26mm;border-right-width:0px;padding-left:5mm;vertical-align:top;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="OwnershipPct"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- End Part VI Table -->
					<!-- AddTable Part VI End -->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="IRS990PartIXTableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:56mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:33mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:55mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:0px;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:0px;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:0px;">
				<span style="width:4px"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartITableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:256mm;height:6mm">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			
		
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:1px;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:1px;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:0px;">
				<span style="width:4px"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartIITableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:102mm;height:6px">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:33mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:55mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:1px;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:7mm;border-right-width:1px;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:7mm;border-right-width:0px;">
				<span style="width:4px"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartIIITableFillerRow">
		<tr>
			<td class="styTableCellText">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:10mm">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:8mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:8mm;border-right-width:1px;">
			<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:8mm;border-right-width:0px;">
			<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartIVTableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:102mm;height:6px">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:33mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:55mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:0px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px;border-right-width:2px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVTableFillerRow">
		<tr>
			<td class="styTableCellText" style="border-right-width:1px;width:196mm;font-weight:bold;padding-left:0mm"><!--(<xsl:number value="position()" format="1"/>)<br/>-->
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-top-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:0px;border-top-width:1px">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;border-top-width:1px">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVTableFillerRow2">
		<tr>
			<td class="styTableCellText" style="width:196mm;font-weight:bold;padding-left:0mm"><!--(<xsl:number value="position()+1" format="1"/>)<br/>-->
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVTableFillerRow3">
		<tr>
			<td class="styTableCellText" style="width:196mm;font-weight:bold;padding-left:0mm"><!--(<xsl:number value="position()+2" format="1"/>)<br/>-->
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVTableFillerRow4">
		<tr>
			<td class="styTableCellText" style="width:196mm;font-weight:bold;padding-left:0mm"><!--(<xsl:number value="position()+3" format="1"/>)<br/>-->
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVTableFillerRow5">
		<tr>
			<td class="styTableCellText" style="width:196mm;font-weight:bold;padding-left:0mm"><!--(<xsl:number value="position()+4" format="1"/>)<br/>-->
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVTableFillerRow6">
		<tr>
			<td class="styTableCellText" style="width:196mm;font-weight:bold;padding-left:0mm"><!--(<xsl:number value="position()+5" format="1"/>)<br/>-->
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:30mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVITableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:60mm;">
				<br/>
				<br/>
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:40mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:40mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:35mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:35mm;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;border-right-width:1px;">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="width:7mm;border-right-width:0px;">
				<span style="width:4px;"/>
			</td>
			
		</tr>
	</xsl:template>
</xsl:stylesheet>