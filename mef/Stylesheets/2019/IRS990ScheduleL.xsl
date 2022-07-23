<?xml version="1.0" encoding="UTF-8"?>

<!-- Updated 12/23/2014 per PDF Review - Page 2 appearing on page1 when printing. Changed div to float none by Robert L Jones -->
<!-- Updated 4/23/2015 per UWR 123023 IE11 changes by Robert L Jones -->
<!-- Updated 6/4/2015 per IBM Defect 43192 by Robert L Jones -->
<!-- Updated 6/26/2015 per IBM Defect 43491 by Robert L Jones Additional data not on separate page-->
<!-- Updated 10/22/2015 per PDF REVIEW by Robert L Jones -->
<!-- Updated 11/4/2015 per Kisams 2345936 overlapping at Part V but fixed in prior IBM Defect by Robert L Jones -->
<!-- Updated 5/3/2016 per UWR 177702 Tax Year by Robert L Jones -->
<!-- Updated 6/28/2016 per IBM Defect 46039 by Robert L Jones Pt II Miss Add data msg, Pt II table not displ in add data section, Pt I sep print showing in form and add table -->
<!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS990ScheduleLStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleL"/>
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
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 990 Schedule L"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
			<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990ScheduleLStyle"/>
						<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form990ScheduleL">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;height:22.5mm;">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<div style="padding-top:1mm;font-weight:bold;font:8pt">
								<span style="font-size:10pt;font-weight:bold;font-familiy:'Arial Narrow';">Schedule L</span>
								<br/>
								<span style="font-size:8pt;font-weight:bold;font-family:'Arial ';">(Form 990 or 990-EZ)</span>
								<br/>
							</div>
							<div style="padding-top:7mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:126mm;height:22.5mm;">
							<div class="styMainTitle" style="padding-top:1mm;padding-bottom:0mm">Transactions with Interested Persons</div>
							<div class="styFBT" style="margin-top:0mm">
								
								<img src="{$ImagePath}/990SchL_Bullet_Md.gif" alt="MediumBullet"/>
Complete if the organization answered "Yes" on Form 990, Part IV,
		 lines 25a, 25b, 26, 27, 28a, 28b, or 28c, or Form 990-EZ, Part V, line 38a or 40b.<br/>
          <img src="{$ImagePath}/990SchL_Bullet_Md.gif" alt="MediumBullet"/>
           Attach to Form 990 or Form 990-EZ.  <!--<img src="{$ImagePath}/990SchL_Bullet_Md.gif" alt="MediumBullet"/> See separate instructions.--><br/>
        <img src="{$ImagePath}/990SchL_Bullet_Md.gif" alt="MediumBullet"/>Go to <!--www.irs.gov/form990.--><a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for instructions and the latest information. 
           </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:4.25mm;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">19</span>
							</div>
							<div class="styPartName" style="height:auto; width:30.5mm;padding-top:0.3mm">Open to Public Inspection</div>
						</div>
					</div>
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="height:auto;width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:134mm;height:auto;padding-left:2mm">
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
						<div class="styGenericDiv" style="width:52mm;height:auto;;padding-left:1mm;">
							<span class="styBoldText">Employer identification number</span>
							<br/>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Name and Identifying Number Section-->
					<!-- Part I -->
					<!-- Begin  Part I -->
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;height:auto;">
						<div class="styPartName" style="float:left;width:12mm;">Part I</div>
						<div class="styPartDesc" style="width:174mm;height:auto;">Excess Benefit Transactions
        <span style="font-size:7pt;font-weight:normal;">
          (section 501(c)(3), section 501(c)(4), and section 501(c)(29) organizations only). </span>
							<br/>
							<span style="font-size:7pt;font-weight:normal;">
Complete if the organization answered "Yes" on Form 990, Part IV, line 25a or 25b, or Form 990-EZ, Part V, line 40b.
        </span>
						</div>
						<div style="float:right">
						<!--<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/DisqualifiedPersonExBnftTrGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select="'IOSctn'"/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN Part I Table -->
					<div class="styTableContainerNBB" style="width:187mm; clear: all; float: none; height: auto; display:table;" id="IOSctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="width:187mm; height: auto; font-size:7pt;float:none;clear:both;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="border-style: solid; border-color: black;width:55mm;font-weight:bold;text-align:center;vertical-align:top;">
										<span class="styLNLeftNumBox">1</span>
										<span style="font-weight:normal">
											<b>(a)</b> Name of disqualified person</span>
									</th>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-style: solid; border-color: black;width:75mm;font-weight:normal; text-align:center;border-right-width:1px;border-bottom-width:1px;vertical-align:top;">
										<span style="font-weight:bold">(b)</span> Relationship between disqualified person and organization</th>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="border-style: solid; border-color: black;width:35mm;font-weight:normal; text-align:center;border-right-width:1px;border-bottom-width:1px;vertical-align:top;">
										<span style="font-weight:bold">(c)</span> Description of transaction</th>
								<th class="styTableCellHeader" colspan="2" scope="col" style="border-style: solid; border-color: black;width:25mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(d)</span> Corrected?</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:9mm;font-weight:bold;text-align:center;border-right-width:1px;border-left-width:0px;">Yes</th>
				<th class="styTableCellHeader" scope="col" style="border-style: solid; border-color: black;width:9mm;font-weight:bold;text-align:center;border-right-width:0px;border-bottom-width:1px;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/DisqualifiedPersonExBnftTrGrp) &lt;= 6">
									<xsl:for-each select="$FormData/DisqualifiedPersonExBnftTrGrp">
										<tr>
						<td class="styTableCellCtr" style="border-style: solid; border-color: black;width:75mm;padding-right:0.75mm;border-bottom-width:0px;vertical-align:top;text-align:left;border-bottom-width:1px;">(<xsl:number value="position()" format="1"/>)
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="border-style: solid; border-color: black;width:35mm;padding-right:0.75mm;border-bottom-width:0px;vertical-align:top;text-align:left;border-bottom-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RlnDisqualifiedPersonOrgTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="border-style: solid; border-color: black;width:55mm;padding-right:0.75mm;border-bottom-width:0px;vertical-align:top;text-align:left;border-bottom-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="border-style: solid; border-color: black;width:9mm;padding-right:0.75mm;border-bottom-width:0px;border-right-width:1px;vertical-align:top;border-bottom-width:1px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="TransactionCorrectedInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="border-style: solid; border-color: black;width:9mm;vertical-align:top;padding-right:0.75mm;border-right-width:0px;border-bottom-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="TransactionCorrectedInd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if> 
							
							<xsl:if test="count($FormData/DisqualifiedPersonExBnftTrGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/DisqualifiedPersonExBnftTrGrp) &gt;6)) ">
									<tr>
								<td class="styTableCellText" style="height: auto; border-style: solid; border-color: black;width:85mm;vertical-align:top;padding-right:0.75mm;border-bottom-width:1px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/DisqualifiedPersonExBnftTrGrp/PersonNm"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
								<td class="styTableCellCtr" style="height: auto;width:55mm;vertical-align:bottom;padding-right:0.75mm;border-left:1px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height: auto;width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height: auto;width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height: auto;width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DisqualifiedPersonExBnftTrGrp) &lt; 2 or ((count($FormData/DisqualifiedPersonExBnftTrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DisqualifiedPersonExBnftTrGrp) &lt; 3 or ((count($FormData/DisqualifiedPersonExBnftTrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DisqualifiedPersonExBnftTrGrp) &lt; 4 or ((count($FormData/DisqualifiedPersonExBnftTrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DisqualifiedPersonExBnftTrGrp) &lt; 5 or ((count($FormData/DisqualifiedPersonExBnftTrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/DisqualifiedPersonExBnftTrGrp) &lt; 6 or ((count($FormData/DisqualifiedPersonExBnftTrGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartITableFillerRow"/>
								</xsl:if>
							
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
			<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/DisqualifiedPersonExBnftTrGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select="'IOSctn'"/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part I Table -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">2</div>
						<div class="styLNDescLandscape" style="width:148mm">Enter the amount of tax incurred by the organization managers or disqualified persons during the year under section 4958.
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="letter-spacing:4mm; font-weight:bold; ">  
        ...........................  </span>
							</span>
							<img src="{$ImagePath}/990SchL_Bullet.gif" alt="Bullet Image"/>
							<span style="padding-left:2mm">$</span>
						</div>
						<div class="styFixedUnderline" style="width:30mm;text-align:center;padding-top:2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxImposedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm">3</div>
						<div class="styLNDescLandscape" style="width:148mm;">Enter the amount of tax, if any, on line 2, above, reimbursed by the organization
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="letter-spacing:3.9mm; font-weight:bold; ">  
        ........ </span>
							</span>
							<img src="{$ImagePath}/990SchL_Bullet.gif" alt="Bullet Image"/>
							<span style="padding-left:2mm">$</span>
						</div>
						<div class="styFixedUnderline" style="width:30mm;text-align:center;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxReimbursedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<br/>
					<!-- End Part I -->
					
					<!-- Begin Part II -->
					<div class="styBB" style="width:187mm;border-top-width:1px;height:auto;">
						<div class="styPartName" style="float:left;width:15mm;">Part II</div>
						<div class="styPartDesc" style="float:left;width:172mm;height:auto;">Loans to and/or From Interested Persons.<br/>
							<span style="font-size: 7pt;font-weight:normal;">
        Complete if the organization answered "Yes" on Form 990-EZ, Part V, line 38a, or Form 990, Part IV, line 26; or if the organization reported an amount on Form 990, Part X, line 5, 6, or 22
        </span>
						
					<span style="float:right;clear:none">
							<!-- button display logic -->
						<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/LoansBtwnOrgInterestedPrsnGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'IPRctn' "/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						</span>
						</div>
					</div>
					<!-- END Part II Title -->
					<!-- BEGIN Part II Table -->
					<div class="styTableContainerNBB" id="IPRctn" style="width: 187mm; height:auto;display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;height:auto;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;border-style: solid; border-color: black;width:40mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
										
									<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;border-style: solid; border-color: black;width:35mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(b)</span> Relationship with organization</th>
										
									<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;border-style: solid; border-color: black;width:25mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(c)</span> Purpose of loan</th>
										
									<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:18mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(d)</span> Loan to or from the organization?</th>
										
									<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:25mm;font-weight:normal;text-align:center;vertical-align:top; ">
										<span style="font-weight:bold">(e)</span> Original principal amount </th>
										
								<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:25mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(f)</span> Balance due</th>
										
									<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:16mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(g)</span> In default?</th>
										
									<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:16mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold;text-align:center;">(h)</span> Approved by board or committee?</th>
										
								<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:16mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(i)</span> Written agreement?</th>
								</tr>
								<tr>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:9mm;font-weight:normal;">To</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:9mm;font-weight:normal;"> From</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;">No</th>
								<th class="styTableCellHeader" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;">No</th>
								<th class="styTableCellHeader" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8 mm;font-weight:bold;border-right-width:0px;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt;6">
									<xsl:for-each select="$FormData/LoansBtwnOrgInterestedPrsnGrp">
										<tr>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:40mm;vertical-align:top;padding-right:0.75mm;border-bottom-width:1px;text-align:left">(<xsl:number value="position()" format="1"/>)
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<!--<br/>-->
												</td>
												<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;vertical-align:top;border-bottom-width:1px;text-align:left;width:35mm;padding-right:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipWithOrgTxt"/>
												</xsl:call-template>
											</td>
												<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;vertical-align:top;border-left-width:0px;text-align:left;width:25mm;padding-right:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanPurposeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;text-align:center;width:9mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanToOrganizationInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;text-align:center;width:9mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanFromOrganizationInd"/>
												</xsl:call-template>
											</td>
											<!--<td class="styTableCellCtr" style="width:30mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:right">-->
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:25mm;vertical-align:top;text-align:right;font-size: 5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OriginalPrincipalAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:25mm;vertical-align:top;text-align:right;font-size: 5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalanceDueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;padding-left:.36mm;width:8mm;vertical-align:top;border-left-width:0px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DefaultInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;padding-left:.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DefaultInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="BoardOrCommitteeApprovalInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="BoardOrCommitteeApprovalInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="WrittenAgreementInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="WrittenAgreementInd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
							<xsl:if test="count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt; 1 or (($Print = $Separated) and (count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt;6)) ">
								
									<tr>
										<td class="styTableCellCtr" style="height:auto;width:40mm;padding-right:0.75mm;border-left-width:0px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/LoansBtwnOrgInterestedPrsnGrp/PersonNm"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
									
									<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCell" style="height:auto;border-style: solid; border-color: black;width:9mm;border-bottom-width:1px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt; 2 or ((count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt; 3 or ((count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt; 4 or ((count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt; 5 or ((count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt;6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/LoansBtwnOrgInterestedPrsnGrp) &lt; 6 or ((count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIITableFillerRow"/>
								</xsl:if>
							
								<tr>
									<td class="styTableCellCtr" scope="col" colspan="6" style="height:auto;border-style: solid; border-color: black;width:64mm;padding-right:0.5mm;border-right-width:0px;border-top-width:0px;">
										<span style="float:left;font-size:7pt;font-weight:bold;"> Total </span>
										<span style="letter-spacing:4mm;padding-right:2mm ">...............</span>
										<img src="{$ImagePath}/990SchL_Bullet.gif" alt="Small Bullet"/>
										<span style="padding-left:2mm; font-weight:bold; "> $</span>
									</td>
									<td class="styTableCell" style="height:auto;border-right-width:1px;width:35mm;border-top-width:0px;font-size:7pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalBalanceDueAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" scope="col" colspan="6" style="height:auto;width:88mm;vertical-align:bottom;border-right-width:1px;background-color:lightgrey;">
									<span class="styTableCellPad"/> 
									</td>
								
									</tr>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
			<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/LoansBtwnOrgInterestedPrsnGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'IPRctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part II Table -->
					<!-- End Part II -->
					<!-- Part III -->
					<div class="styBB" style="height:auto;width:187mm;float:none;border-top:solid 0px;">
						<div class="styPartName" style="float:left;width:14mm;height:auto;border-top-width: 1px;">Part III</div>
						<div class="styPartDesc" style="width:172mm;height:auto;border-top:solid 1px;">Grants or Assistance Benefiting Interested Persons.<br/>
							<span style="font-size: 8pt;font-weight:normal">
         Complete if the organization answered "Yes" on Form 990, Part IV, line 27.
        </span>
						</div>
						<span style="float:right;clear:none">
							<!-- button display logic -->
					<!--<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/GrntAsstBnftInterestedPrsnGrp"/>
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="containerID" select=" 'OActn' "/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						</span>
					</div>
					
					<div class="styTableContainerNBB" id="OActn" style="width: 187mm; height:auto; display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;height:auto;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:40mm;font-weight:normal;border-top-width:1px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:37.2mm;font-weight:normal; text-align:center;vertical-align:top;border-top-width:1px;">
										<span style="font-weight:bold">(b)</span> Relationship between interested person and the organization</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:37.2mm;font-weight:normal;text-align:center;vertical-align:top;border-top-width:1px;border-right-width:1px">
										<span style="font-weight:bold">(c)</span> Amount of assistance</th>
										<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:37.2mm;font-weight:normal; text-align:center;vertical-align:top;border-top-width:1px;border-right-width:1px">
										<span style="font-weight:bold">(d)</span> Type of assistance</th>
										<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:37.2mm;font-weight:normal; text-align:center;vertical-align:top;border-top-width:1px;border-right-width:0px">
										<span style="font-weight:bold">(e)</span> Purpose of assistance</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt;= 6">
								<xsl:for-each select="$FormData/GrntAsstBnftInterestedPrsnGrp">
										<tr>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left;">(<xsl:number value="position()" format="1"/>)
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipWithOrgTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:right;">
												
													
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="CashGrantAmt"/>
														</xsl:call-template>
														</td>
													<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-right-width:1px;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TypeOfAssistanceTxt"/>
														</xsl:call-template>
													
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-right-width:0px;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AssistancePurposeTxt"/>
														</xsl:call-template>
													
											</td>
											
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt; 1 or             (($Print = $Separated) and (count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt;6)) ">
								
									<tr>
										<td class="styTableCellCtr" style="height:auto; width:37.2mm; padding-right:0.75mm;border-left-width:0px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/GrntAsstBnftInterestedPrsnGrp/PersonNm"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:37.2mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt; 2 or ((count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt; 3 or ((count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt; 4 or ((count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt; 5 or ((count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIIITableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/GrntAsstBnftInterestedPrsnGrp) &lt; 6 or ((count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIIITableFillerRow"/>
								</xsl:if>
							
								
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/GrntAsstBnftInterestedPrsnGrp"/>
						<xsl:with-param name="containerHeight" select="6"/>
						<xsl:with-param name="containerID" select=" 'OActn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part III Table -->
					<!-- End Part III -->
					<!-- Footer -->
				<div style="width:187mm;float:none;clear:both;border-top:solid 1px;" class="pageEnd">
				<div class="styGenericDiv" style="width:110mm;font-weight:bold;font-size:6pt">For Paperwork Reduction Act Notice, see the Instructions for Form 990 or 990-EZ. </div>
						<div class="styGenericDiv" style="width:22mm;font-size:6pt">Cat. No. 50056A</div>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText" style="font-size:6pt">Schedule L (Form 990 or 990-EZ) 2019</span>
						</div>
					</div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Schedule L (Form 990 or 990-EZ) 2019</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
					<!-- BEGIN Part IV Title   -->
					<div class="styBB" style="width:187mm;clear:both;border-top-width:1px;height:auto;">
						<div class="styPartName" style="float:left;width:14mm;padding-left:1mm;height:auto;">Part IV</div>
						<div class="styPartDesc" style="float:left;width:164mm;height:auto;">
        Business Transactions Involving Interested Persons.<br/>
							<span style="font-size: 8pt;font-weight:normal">
            Complete if the organization answered "Yes" on Form 990, Part IV, line 28a, 28b, or 28c.
        </span>
						</div>
						<!--<span style="float:right;clear:none">-->
							<!-- button display logic -->
						<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/BusTrInvolveInterestedPrsnGrp"/>
								<xsl:with-param name="containerHeight" select="10"/>
								<xsl:with-param name="containerID" select=" 'ROActn' "/>
							</xsl:call-template>-->
							<!-- end button display logic -->
						<!--</span>-->
					</div>
					<!-- END Part IV Title -->
					<!-- BEGIN Part IVTable -->
					<div class="styTableContainerNBB" id="ROActn" style="width: 187mm; height:auto; display:table;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;height:auto;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;border-style: solid; border-color: black;width:60mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:32mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:1px;">
									<span style="font-weight:bold">(b)</span> Relationship between interested person and the organization</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;border-style: solid; border-color: black;width:30mm;font-weight:normal;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(c)</span> Amount of transaction </th>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:45mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(d)</span> Description of transaction</th>
								<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:16mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(e)</span> Sharing of organization's revenues?</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;border-right-width:1px">Yes</th>
									<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;border-right-width:0px;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/BusTrInvolveInterestedPrsnGrp) &lt;= 6">
									<xsl:for-each select="$FormData/BusTrInvolveInterestedPrsnGrp">
										<tr>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:60mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">(<xsl:number value="position()" format="1"/>)
												<xsl:choose>
													<xsl:when test="NameOfInterested/PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterested/PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterested/BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterested/BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:32mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:30mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TransactionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:45mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TransactionDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;text-align:center;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="SharingOfRevenuesInd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:0px;text-align:center;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="SharingOfRevenuesInd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/BusTrInvolveInterestedPrsnGrp) &lt; 1 or (($Print = $Separated) and (count($FormData/BusTrInvolveInterestedPrsnGrp) &gt;6)) ">
									<tr>
										<td class="styTableCellCtr" style="width:60mm; height:auto; border-style: solid; border-color: black;vertical-align:bottom;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/BusTrInvolveInterestedPrsnGrp/NameOfInterested/PersonNm"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:32mm; height:auto;border-style: solid; border-color: black ;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm; height:auto;border-style: solid; border-color: black;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:45mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;text-align:center;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="height:auto;border-style: solid; border-color: black;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:0px;text-align:center;">
											<span style="width:3px"/>
										</td>
									
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/BusTrInvolveInterestedPrsnGrp) &lt; 2 or ((count($FormData/BusTrInvolveInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/BusTrInvolveInterestedPrsnGrp) &lt; 3 or ((count($FormData/BusTrInvolveInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/BusTrInvolveInterestedPrsnGrp) &lt; 4 or ((count($FormData/BusTrInvolveInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/BusTrInvolveInterestedPrsnGrp) &lt; 5 or ((count($FormData/BusTrInvolveInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIVTableFillerRow"/>
								</xsl:if>
								<xsl:if test="count($FormData/BusTrInvolveInterestedPrsnGrp) &lt; 6 or ((count($FormData/BusTrInvolveInterestedPrsnGrp) &gt; 6) and ($Print = $Separated))">
									<xsl:call-template name="IRS990SchLPartIVTableFillerRow"/>
								</xsl:if>
									
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<!--<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/BusTrInvolveInterestedPrsnGrp"/>
						<xsl:with-param name="containerHeight" select="10"/>
						<xsl:with-param name="containerID" select=" 'ROActn' "/>
					</xsl:call-template>-->
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part ??X Table -->
					
					<div class="styBB" style="width:187mm;clear:both;border-top-width:1px;height:auto;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="height:auto;">
Supplemental Information<br/>
<span style="font-size:7pt;font-weight:normal;height:auto;">Provide additional information for responses to questions on Schedule L (see instructions).</span>
</div>

						
						<span style="float:right;clear:none">
							
						<!--	<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select="'SUPctn'"/>
							</xsl:call-template>-->
						</span>
					</div>
					<div class="styTableContainer" style="width: 187mm; border-bottom-width: 0px;height:auto;display:table;" id="SUPctn">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="font-size: 7pt; border-color:black;height:auto;" cellspacing="0">
							<thead>
								<tr class="styDepTblHdr">
									<!--th class="styDepTblCell" scope="col">Item No.</th-->
				<!--<th class="styDepTblCell" style="border-right-width: 0px;width:50mm" scope="col">Identifier</th>-->
				<th class="styDepTblCell" style="height:auto;border-right-width: 0px;width:50mm" scope="col">Return Reference</th>
				<th class="styDepTblCell" style="height:auto;border-right-width: 0px;width:137mm" scope="col">Explanation</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody valign="top">
								<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($FormData/SupplementalInformationDetail) &lt;20))">
									<xsl:for-each select="$FormData/SupplementalInformationDetail">
										<tr>
									<!--		<td class="styTableCell" style="text-align:left;border-right-width: 1px; width:50mm; ">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IdentifierTxt"/>
												</xsl:call-template>
											</td>-->
											<td class="styTableCell" style="height:auto;text-align:left; border-right-width: 1px; width: 50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="height:auto;text-align:left; border-right-width: 0px; width: 137mm">
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
				<!--	<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'SUPctn' "/>
					</xsl:call-template>-->
						<!-- Footer -->
					<div style="width:187mm;float:none;clear:both;border-top:solid 1px" class="pageEnd">
						<div class="styGenericDiv" style="width:110mm;font-weight:bold;font-size:6pt"/>
						<div class="styGenericDiv" style="width:22mm;font-size:6pt"/>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText" style="font-size:6pt">Schedule L (Form 990 or 990-EZ) 2019</span>
						</div>
					</div>
					 <p style="page-break-before: always"/> 
					<br/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
          Additional Data        
        </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<!-- SRD For Part I -->
					<xsl:if test="($Print = $Separated) and count($FormData/DisqualifiedPersonExBnftTrGrp) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part I - Excess Benefit Transactions </span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="height:auto;width:55mm;font-weight:bold;border-right-width:1px;border-left-width:0px;text-align:center;vertical-align:top;">
										<span class="styLNLeftNumBox">1</span>
										<span style="font-weight:normal">
											<b>(a)</b> Name of disqualified person</span>
									</th>
								<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;border-style: solid; border-color: black;width:55mm;font-weight:normal; text-align:center;border-left-width:1px;vertical-align:top;border-bottom-width:1px;">
										<span style="font-weight:bold">(b)</span> Relationship between disqualified person and organization</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="height:auto;width:55mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold">(c)</span> Description of transaction</th>
									<th class="styDepTblCell" colspan="2" scope="col" style="height:auto; border-left-width: 1px;width:25mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;border-bottom-width:1px;">
										<span style="font-weight:bold">(d)</span> Corrected?</th>
								</tr>
								<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="height:auto;width:8mm;font-weight:bold;text-align:center;">Yes</th>
							<th class="styDepTblCell" scope="col" style="height:auto;border-style: solid; border-color: black;width:8mm;font-weight:bold;text-align:center;border-bottom-width:1px;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/DisqualifiedPersonExBnftTrGrp">
								<tr>
									<xsl:attribute name="class">
									<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
									<xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
									</xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="height:auto;border-style: solid; border-color: black;width:85mm;padding-right:0.75mm;border-bottom-width:1px;vertical-align:top;text-align:left;">(<xsl:number value="position()" format="1"/>)
										<xsl:choose>
											<xsl:when test="PersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellCtr" style="height:auto;width:55mm;padding-right:0.75mm;border-left-width:1px;vertical-align:top;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RlnDisqualifiedPersonOrgTxt"/>
												</xsl:call-template>
											</td>
									<td class="styDepTblCell" style="height:auto;width:85mm;padding-right:0.75mm;border-right-width:1px;vertical-align:top;text-align:left;border-bottom-width:1px">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TransactionDesc"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="height:auto;width:8mm;padding-right:0.75mm;border-right-width:1px;vertical-align:top;border-bottom-width:1px;text-align:center">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="TransactionCorrectedInd"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="height:auto;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:1px;border-right-width:0px;border-bottom-width:1px;text-align:center">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="TransactionCorrectedInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- SRD For Part II -->
					<xsl:if test="($Print = $Separated) and count($FormData/LoansBtwnOrgInterestedPrsnGrp) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part II - Loans to and from Interested Persons</span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
						<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;width:20mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
						<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;width:39mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(b)</span> Relationship with organization</th>
						<th class="styTableCellHeader" scope="col" rowspan="2" style="height:auto;width:35mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(c)</span> Purpose of loan</th>
						<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;width:18mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(d)</span> Loan to or from the organization?</th>
						<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;width:36mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px; ">
										<span style="font-weight:bold">(e)</span>Original principal amount </th>
					<th class="styTableCellHeader" rowspan="2" scope="col" style="height:auto;width:36mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(f)</span>Balance due</th>
					<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;width:16mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(g)</span> In default?</th>
					<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;width:16mm;font-weight:normal;text-align:center;vertical-align:top;border-right-width:1px;">
										<span style="font-weight:bold">(h)</span> Approved by board or committee?</th>
					<th class="styTableCellHeader" colspan="2" scope="col" style="height:auto;width:16mm;font-weight:normal;border-right-width:1px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(i)</span>Written agreement?</th>
								</tr>
								<tr class="styDepTblHdr">
								<th class="styTableCellHeader" scope="col" style="height:auto;width:9mm;font-weight:normal;border-left-width:1px;">To</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;width:9mm;font-weight:normal;"> From</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;width:8mm;font-weight:bold;border-left-width:1px;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;width:8mm;font-weight:bold;">No</th>
								<th class="styTableCellHeader" style="width:8mm;font-weight:bold;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;width:8mm;font-weight:bold;">No</th>
								<th class="styTableCellHeader" style="width:8mm;font-weight:bold;">Yes</th>
								<th class="styTableCellHeader" scope="col" style="height:auto;border-style: solid; border-color: black;width:8 mm;font-weight:bold;border-bottom-width:1px;">No</th>
								</tr>
							</thead>
							<tfoot/>
						<xsl:for-each select="$FormData/LoansBtwnOrgInterestedPrsnGrp">
										<tr>
										<xsl:attribute name="class">
									<xsl:choose>
									<xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when>
									<xsl:otherwise>styDepTblRow2Cell </xsl:otherwise>
									</xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="height:auto;width:39mm;padding-right:0.75mm;border-right-width:1px;vertical-align:top;text-align:left;border-bottom-width:1px">(<xsl:number value="position()" format="1"/>)

										<!--	<td class="styTableCellCtr" style="width:40mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">(<xsl:number value="position()" format="1"/>)-->
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<!--<br/>-->
												</td>
												<td class="styDepTblCell" style="height:auto;vertical-align:top;border-left-width:0px;text-align:left;width:20mm;padding-right:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipWithOrgTxt"/>
												</xsl:call-template>
											</td>
												<td class="styDepTblCell" style="height:auto;vertical-align:top;border-left-width:0px;text-align:left;width:20mm;padding-right:.5mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanPurposeTxt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;text-align:center;width:9mm;vertical-align:top;padding-right:0.75mm;border-left-width:1px;border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanToOrganizationInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;text-align:center;width:9mm;vertical-align:top;padding-right:0.75mm;border-left-width:1px;border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanFromOrganizationInd"/>
												</xsl:call-template>
											</td>
											<!--<td class="styTableCellCtr" style="width:30mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:right">-->
											<td class="styDepTblCell" style="height:auto;width:36mm;vertical-align:top;text-align:right;border-right-width:0px;font-size: 5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OriginalPrincipalAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;width:36mm;vertical-align:top;text-align:right;font-size: 5pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalanceDueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;padding-left:.50mm;width:8mm;vertical-align:top;border-left-width:0px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="DefaultInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;padding-left:.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="DefaultInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="BoardOrCommitteeApprovalInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="BoardOrCommitteeApprovalInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:1px">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="WrittenAgreementInd"/>
												</xsl:call-template>
											</td>
											<td class="styDepTblCell" style="height:auto;padding-left:0.50mm;width:8mm;vertical-align:top;border-left-width:0px;border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="WrittenAgreementInd"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- SRD for Part III -->
					<xsl:if test="($Print = $Separated) and count($FormData/GrntAsstBnftInterestedPrsnGrp) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part III - Grants or Assistance Benefiting Interested Persons</span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="height:auto;width:62mm;font-weight:normal;border-top-width:1px;border-right-width:0px;border-left-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
				<th class="styDepTblCell" scope="col" style="height:auto;width:62mm;font-weight:normal; text-align:center;vertical-align:top;border-top-width:1px;border-right-width:0px">
										<span style="font-weight:bold">(b)</span>Relationship between interested person and the organization</th>
				<th class="styDepTblCell" scope="col" style="height:auto;width:62mm;font-weight:normal; text-align:center;vertical-align:top;border-top-width:1px;border-right-width:0px">
										<span style="font-weight:bold">(c)</span>Amount of grant or type of assistance</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/GrntAsstBnftInterestedPrsnGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="height:auto;width:62mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left;">(<xsl:number value="position()" format="1"/>)
										<xsl:choose>
											<xsl:when test="PersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell" style="height:auto;width:62mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelationshipWithOrgTxt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell">
										<xsl:choose>
											<xsl:when test="CashGrantAmt">
												<xsl:attribute name="style">height:auto;width:62mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:0px;text-align:right</xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CashGrantAmt"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">height:auto;width:62mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:0px;text-align:left</xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfAssistanceTxt"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- SRD for Part IV -->
					<xsl:if test="($Print = $Separated) and count($FormData/BusTrInvolveInterestedPrsnGrp) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part IV - Business Transactions Involving Interested Persons</span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;display:table;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" rowspan="2" style="height:auto;width:60mm;font-weight:normal;border-right-width:0px;border-left-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="height:auto;width:32mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold">(b)</span> Relationship between interested person and the organization</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="height:auto;width:30mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(c)</span> Amount of transaction </th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="height:auto;width:45mm;font-weight:normal; text-align:center;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold">(d)</span> Description of transaction</th>
									<th class="styDepTblCell" colspan="2" scope="col" style="height:auto;width:16mm;font-weight:normal;border-right-width:0px;text-align:center;vertical-align:top;">
										<span style="font-weight:bold">(e)</span> Sharing of organization's revenues?</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="height:auto;width:8mm;font-weight:bold;border-right-width:0px">Yes</th>
									<th class="styDepTblCell" scope="col" style="height:auto;width:8mm;font-weight:bold;border-right-width:0px;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/BusTrInvolveInterestedPrsnGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="height:auto;width:60mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">(<xsl:number value="position()" format="1"/>)
										<xsl:choose>
											<xsl:when test="NameOfInterested/PersonNm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterested/PersonNm"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterested/BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterested/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styDepTblCell" style="height:auto;width:32mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="height:auto;width:30mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TransactionAmt"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="height:auto;width:45mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TransactionDesc"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="height:auto;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:1px;text-align:center;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="SharingOfRevenuesInd"/>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="height:auto;width:8mm;vertical-align:top;padding-right:0.75mm;border-left-width:0px;border-right-width:0px;text-align:center;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="SharingOfRevenuesInd"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Below are a few templates designed to be filler rows for the tables in this form -->
	<xsl:template name="IRS990SchLPartITableFillerRow">
		<tr>
			<td class="styTableCell" style="height: auto; width:8mm; border-right-width:0px/">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="height: auto; width:8mm">
				<span style="width:4px"/>
			</td>
			
			<td class="styTableCell" style="height: auto; width:8mm">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="height: auto; width:8mm">
				<span style="width:4px;"/>
			</td>
			
			<td class="styTableCell" style="height: auto; width:8mm;border-right-width:0px">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990SchLPartIITableFillerRow">
		<tr>
			<td class="styTableCell">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="width:9mm;">
				<span class="styTableCellPad"/>
			</td>
	<td class="styTableCell" style="width:9mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell">
				<span class="styTableCellPad"/>
			</td>			
		<td class="styTableCell">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="width:8mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="width:8mm; ">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCell" style="width:8mm;">
				<span class="styTableCellPad"/>
			</td>						
				<td class="styTableCell" style="width:8mm; ">
				<span class="styTableCellPad"/>
			</td>
			
			<td class="styTableCell" style="width:8mm; ">
				<span class="styTableCellPad"/>
			</td>		
			<td class="styTableCell" style="width:8mm;">
				<span class="styTableCellPad"/>
			</td>						
			<td class="styTableCell" style="width:8mm; ">
				<span class="styTableCellPad"/>
			</td>						
							
			<td class="styTableCell" style="width:8mm;border-right-width:0px">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
<xsl:template name="IRS990SchLPartIIITableFillerRow">
		<tr>
			<td class="styTableCellText">
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
			<td class="styTableCell" style="border-right-width:0px">
				<span style="width:4px"/>
			</td>
		</tr>	
		</xsl:template>
		
	<xsl:template name="IRS990SchLPartIVTableFillerRow">
		<tr>
			<td class="styTableCellText">
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
			<td class="styTableCell" style="width:4mm">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:4mm;border-right-width:0px">
				<span style="width:4px"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>