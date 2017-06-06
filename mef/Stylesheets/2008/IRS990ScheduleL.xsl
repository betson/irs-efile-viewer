<?xml version="1.0" encoding="UTF-8"?>
<!-- This stylesheet was created by Sandy Cram and last modified by Sandy Cram on 1/8/2009  added shading for SRD -->
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
		<html>
			<head>
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
					<div class="styTBB" style="width:187mm;">
						<div class="styFNBox" style="width:30mm;height:20mm;">
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
						<div class="styFTBox" style="width:126mm;">
							<div class="styMainTitle" style="padding-top:2mm;padding-bottom:0mm">Transactions with Interested Persons</div>
							<div class="styFBT">
								<img src="{$ImagePath}/990SchL_Bullet_Md.gif" alt="MediumBullet"/>
           Attach to Form 990 or Form 990-EZ.<br/>
								<img src="{$ImagePath}/990SchL_Bullet_Md.gif" alt="MediumBullet"/>
To be completed by organizations that answered <br/>"Yes" on Form 990, Part IV,
		 lines 25a, 25b, 26, 27, 28a, 28b, or 28c, <br/>or Form 990-EZ, Part V lines 38a or 40b.
          </div>
						</div>
						<div class="styTYBox" style="width:30mm;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">08</span>
							</div>
							<div class="styPartName" style="height:8mm; width:30.5mm;padding-top:0.3mm">Open to Public Inspection</div>
						</div>
					</div>
					<!-- Begin Name and Identifying Number Section-->
					<div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
						<div class="styFNBox" style="width:134mm;height:8mm;padding-left:2mm">
							<span class="styBoldText">Name of the organization</span>
							<br/>
							<div style="font-family:verdana;font-size:6pt;height:6.25mm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styGenericDiv" style="width:52mm;height:4mm;padding-left:1mm;">
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
					<div class="styBB" style="width:187mm;float:none;border-top-width:0px;">
						<div class="styPartName" style="float:left;width:12mm;">Part I</div>
						<div class="styPartDesc" style="width:174mm;">Excess Benefit Transactions
        <span style="font-size:8pt;font-weight:normal;">
          (section 501(c)(3) and section 501 (c)(4) organizations only). </span>
							<br/>
							<span style="font-size:7pt;font-weight:normal;">
To be completed by organizations that answered "Yes" on Form 990, Part IV, line 25a or 25b, or Form 990-EZ, Part V, line 40b.
        </span>
						</div>
						<div class="styGenericDiv" style="float:right">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/DQPTable"/>
								<xsl:with-param name="containerHeight" select="5"/>
								<xsl:with-param name="containerID" select=" 'IOSctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- BEGIN Part I Table -->
					<div class="styTableContainerNBB" id="IOSctn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:83mm;font-weight:bold;">
										<span class="styLNLeftNumBox">1</span>
										<span style="font-weight:normal">
											<b>(a)</b> Name of disqualified person</span>
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:83mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(b)</span> Description of transaction</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold">(c)</span> Corrected?</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;text-align:center">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;text-align:center;border-right:0px">No</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/DQPTable) &lt;= 6">
									<xsl:for-each select="$FormData/DQPTable">
										<tr>
											<td class="styTableCellCtr" style="width:85mm;padding-right:0.75mm;border-left:0px;vertical-align:top;text-align:left">
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
											</td>
											<td class="styTableCellCtr" style="width:85mm;padding-right:0.75mm;border-left:0px;vertical-align:top;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfTransaction"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:8mm;padding-right:0.75mm;border-left:0px;border-right-width:1px;vertical-align:top">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="TransactionCorrected"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:8mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="TransactionCorrected"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/DQPTable) &lt; 1 or
            (($Print = $Separated) and (count($FormData/DQPTable) &gt;6)) ">
									<tr>
										<td class="styTableCellCtr" style="width:85mm;vertical-align:top;padding-right:0.75mm;border-left:0px;border-right:0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/DQPTable/NamePerson"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:85mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:8mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:8mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/DQPTable"/>
						<xsl:with-param name="containerHeight" select="5"/>
						<xsl:with-param name="containerID" select=" 'IOSctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part I Table -->
					<div style="width:187mm;padding-top:1mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm">2</div>
						<div class="styLNDescLandscape" style="width:148mm">Enter the amount of tax imposed on the organization managers or disqualified persons during the year under section 4958.
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="letter-spacing:4mm; font-weight:bold; ">  
        .........................  </span>
							</span>
							<img src="{$ImagePath}/990SchL_Bullet.gif" alt="Bullet Image"/>
							<span style="padding-left:2mm">$</span>
						</div>
						<div class="styFixedUnderline" style="width:30mm;text-align:center;padding-top:2mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AmountOfTaxImposed"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">3</div>
						<div class="styLNDescLandscape" style="width:148mm;">Enter the amount of tax, if any, on line 2, above, reimbursed by the organization
          <!--Dotted Line-->
							<span class="styNoAudioRead" style="font-weight:bold;">
								<span style="letter-spacing:4mm; font-weight:bold; ">  
        ....... </span>
							</span>
							<img src="{$ImagePath}/990SchL_Bullet.gif" alt="Bullet Image"/>
							<span style="padding-left:2mm">$</span>
						</div>
						<div class="styFixedUnderline" style="width:30mm;text-align:center;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AmountOfTaxReimbursed"/>
							</xsl:call-template>
						</div>
					</div>
					<br/>
					<!-- End Part I -->
					<!-- Begin Part II -->
					<div class="styBB" style="width:187mm;float:none;border-top-width:1px;">
						<div class="styPartName" style="float:left;width:15mm;">Part II</div>
						<div class="styPartDesc" style="width:172mm;">Loans to and/or From Interested Persons.<br/>
							<span style="font-size: 7pt;font-weight:normal">
        To be completed by organizations that answered "Yes" on Form 990, Part IV, line 26, or Form 990-EZ, Part V, line 38a.
        </span>
						</div>
						<div class="styGenericDiv" style="float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/LoanTable"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'IPRctn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END Part II Title -->
					<!-- BEGIN Part IITable -->
					<div class="styTableContainerNBB" id="IPRctn" style="height:25mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:61mm;font-weight:normal;">
										<span style="font-weight:bold">(a)</span> Name of interested person and purpose</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:18mm;font-weight:normal;text-align:center">
										<span style="font-weight:bold">(b)</span> Loan to or from the organization?</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:30mm;font-weight:normal; ">
										<span style="font-weight:bold">(c)</span>Original principal amount </th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:30mm;font-weight:normal; text-align:center;border-right-width:1px;">
										<span style="font-weight:bold">(d)</span>Balance due</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:16mm;font-weight:normal;">
										<span style="font-weight:bold">(e)</span> In default?</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:16mm;font-weight:normal;">
										<span style="font-weight:bold">(f)</span> Approved by board or committee?</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:16mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold">(g)</span>Written agreement?</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:9mm;font-weight:normal;">To</th>
									<th class="styTableCellHeader" scope="col" style="width:9mm;font-weight:normal;"> From</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">No</th>
									<th class="styTableCellHeader" style="width:8mm;font-weight:bold;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">No</th>
									<th class="styTableCellHeader" style="width:8mm;font-weight:bold;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8 mm;font-weight:bold;border-right:0px">No</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/LoanTable) &lt; 6">
									<xsl:for-each select="$FormData/LoanTable">
										<tr>
											<td class="styTableCellCtr" style="width:61mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
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
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PurposeOfLoan"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:1px;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanToOrganization"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="text-align:center;width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:1px;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LoanFromOrganization"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="vertical-align:bottom;border-left:0px;text-align:right;width:30mm;padding-right:.5mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OriginalPrincipalAmount"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell" style="width:30mm;vertical-align:bottom;text-align:right;padding-right:.5mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BalanceDue"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="padding-left:.50mm;width:8mm;vertical-align:bottom;border-left:0px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="Default"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="padding-left:.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="Default"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="ApprovedByBoard"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;;border-left:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="ApprovedByBoard"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="WrittenAgreement"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="WrittenAgreement"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/LoanTable) &lt; 1 or
            (($Print = $Separated) and (count($FormData/LoanTable) &gt;6)) ">
									<tr>
										<td class="styTableCellCtr" style="width:61mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/LoanTable/NamePerson"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:9mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;vertical-align:bottom;border-left:0px;padding-right:.5mm">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;vertical-align:bottom;border-left:0px;padding-right:.5mm">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;;border-left:0px;border-right-width:1px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:1px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="padding-left:0.50mm;width:8mm;vertical-align:bottom;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td class="styTableCellCtr" scope="col" colspan="4" style="width:109mm;vertical-align:bottom;padding-right:0.5mm;border-right:0px">
										<span style="float:left;font-size:7pt"> Total </span>
										<span style="letter-spacing:4mm; font-weight:bold;padding-right:2mm ">..................</span>
										<img src="{$ImagePath}/990SchL_Bullet.gif" alt="Small Bullet"/>
										<span style="padding-left:2mm; font-weight:bold; "> $</span>
									</td>
									<td class="styTableCell" style="width:30mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalBalanceDue"/>
										</xsl:call-template>
									</td>
									<td class="styShadingCell" scope="col" colspan="6"/>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/LoanTable"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'IPRctn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part II Table -->
					<!-- End Part II -->
					<!-- Part III -->
					<div class="styBB" style="width:187mm;float:none;border-top:solid 1px;">
						<div class="styPartName" style="float:left;width:14mm;">Part III</div>
						<div class="styPartDesc" style="width:172mm;">Grants or Assistance Benefitting Interested Persons.<br/>
							<span style="font-size: 8pt;font-weight:normal">
         To be completed by organizations that answered "Yes" on Form 990, Part IV, line 27.
        </span>
						</div>
						<div class="styGenericDiv" style="float:right">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleLPartIII"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'OActn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<div class="styTableContainerNBB" id="OActn" style="height:25mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;border-top-width:1px">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal; text-align:center;border-top-width:1px;">
										<span style="font-weight:bold">(b)</span>Relationship between interested person and the organization</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal; text-align:center;border-top-width:1px;border-right-width:0px">
										<span style="font-weight:bold">(c)</span>Amount of grant or type of assistance</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleLPartIII) &lt;= 6">
									<xsl:for-each select="$FormData/Form990ScheduleLPartIII">
										<tr>
											<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;">
												<xsl:choose>
													<xsl:when test="NameOfInterestedPerson">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterestedPerson"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterestedBusiness/BusinessNameLine1"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterestedBusiness/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipWithOrganization"/>
												</xsl:call-template>
											</td>
											<td class="styTableCell">
												<xsl:choose>
													<xsl:when test="AmountOfGrant">
														<xsl:attribute name="style">width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;text-align:right</xsl:attribute>
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="AmountOfGrant"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="style">width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;text-align:left</xsl:attribute>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TypeOfAssistance"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleLPartIII) &lt; 1 or
            (($Print = $Separated) and (count($FormData/Form990ScheduleLPartIII) &gt;4)) ">
									<tr>
										<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleLPartIII/NameOfInterestedPerson"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleLPartIII"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'OActn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part III Table -->
					<!-- End Part IIII -->
					<!-- BEGIN Part IV Title   -->
					<div class="styBB" style="width:187mm;clear:both;border-top-width:1px">
						<div class="styPartName" style="float:left;width:14mm;padding-left:1mm">Part IV</div>
						<div class="styPartDesc" style="float:left;width:164mm">
        Business Transactions Involving Interested Persons.<br/>
							<span style="font-size: 8pt;font-weight:normal">
            To be completed by organizations that answered "Yes" on Form 990, Part IV, line 28a, 28b, or 28c.
        </span>
						</div>
						<div class="styGenericDiv" style="float:right;padding-top:4mm">
							<!-- button display logic -->
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleLPartIV"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'ROActn' "/>
							</xsl:call-template>
							<!-- end button display logic -->
						</div>
					</div>
					<!-- END Part IV Title -->
					<!-- BEGIN Part IVTable -->
					<div class="styTableContainerNBB" id="ROActn" style="height:25mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table class="styTable" style="font-size:7pt;float:none;clear:both;" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:60mm;font-weight:normal;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:32mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(b)</span> Relationship between interested person and the organization</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<span style="font-weight:bold">(c)</span> Amount of transaction </th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:45mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(d)</span> Description of transaction</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold">(e)</span> Sharing of organization's revenues?</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;border-right-width:1px">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;border-right:0px">No</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or count($FormData/Form990ScheduleLPartIV) &lt;= 6">
									<xsl:for-each select="$FormData/Form990ScheduleLPartIV">
										<tr>
											<td class="styTableCellCtr" style="width:60mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">
												<xsl:choose>
													<xsl:when test="NameOfInterestedPerson/NamePerson">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterestedPerson/NamePerson"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterestedPerson/NameBusiness/BusinessNameLine1"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="NameOfInterestedPerson/NameBusiness/BusinessNameLine2"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtr" style="width:32mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="Relationship"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:30mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountOfTransaction"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:45mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DescriptionOfTransaction"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:4mm;vertical-align:top;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="SharingOfRevenues"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtr" style="width:4mm;vertical-align:top;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="SharingOfRevenues"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="count($FormData/Form990ScheduleLPartIV) &lt; 1 or
            (($Print = $Separated) and (count($FormData/Form990ScheduleLPartIV) &gt;5)) ">
									<tr>
										<td class="styTableCellCtr" style="width:60mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleLPartIV/NameOfInterestedPerson/NamePerson"/>
											</xsl:call-template>
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:32mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:30mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:45mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:4mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
										<td class="styTableCellCtr" style="width:4mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
											<span style="width:3px"/>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Set Initial Height of Above Table -->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/Form990ScheduleLPartIV"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="containerID" select=" 'ROActn' "/>
					</xsl:call-template>
					<!-- End Set Initial Height of Above Table -->
					<!-- END Part ??X Table -->
					<!-- Footer -->
					<div style="width:187mm;float:none;clear:both;border-top:solid 1px" class="pageend">
						<div class="styGenericDiv" style="width:122mm;font-weight:bold">For Privacy Act and Paperwork Reduction Act Notice, see the Intructions for Form 990 </div>
						<div class="styGenericDiv" style="width:25mm;">Cat. No. 50056A</div>
						<div class="styGenericDiv" style="float:right;">
							<span class="styBoldText">Schedule L (Form 990) 2008</span>
						</div>
					</div>
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
					<xsl:if test="($Print = $Separated) and count($FormData/DQPTable) &gt;= 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part I - Excess Benefit Transactions </span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:83mm;font-weight:bold;">
										<span class="styLNLeftNumBox">1</span>
										<span style="font-weight:normal">
											<b>(a)</b> Name of disqualified person</span>
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:83mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(b)</span> Description of transaction</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold">(c)</span> Corrected?</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;text-align:center">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;text-align:center">No</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/DQPTable">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellCtr" style="width:85mm;padding-right:0.75mm;border-left:0px;vertical-align:top;text-align:left">
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
									</td>
									<td class="styTableCellCtr" style="width:85mm;padding-right:0.75mm;border-left:0px;vertical-align:top;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DescriptionOfTransaction"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:8mm;padding-right:0.75mm;border-left:0px;border-right-width:1px;vertical-align:top">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="TransactionCorrected"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:8mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="TransactionCorrected"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- SRD For Part II -->
					<xsl:if test="($Print = $Separated) and count($FormData/LoanTable) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part II - Loans to and from Interested Persons</span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:63mm;font-weight:normal;">
										<span style="font-weight:bold">(a)</span> Name of interested person and purpose</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold">(b)</span> Loan to or from the organization?</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:30mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(c)</span>Original principal amount <br/>$</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:30mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(d)</span>Balance due<br/>
			 $</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:24mm;font-weight:normal;">
										<span style="font-weight:bold">(e)</span> In default?</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold">(f)</span> Approved by board or committee?</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold">(g)</span>Written agreement?</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">To</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;">From</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">No</th>
									<th class="styTableCellHeader" style="width:8mm;font-weight:bold;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">No</th>
									<th class="styTableCellHeader" style="width:8mm;font-weight:bold;">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8 mm;font-weight:bold;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/LoanTable">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellCtr" style="width:53mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
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
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PurposeOfLoan"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:4mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="LoanToOrganization"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="LoanToOrganization"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:4mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="LoanFromOrganization"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="LoanFromOrganization"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:32mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OriginalPrincipalAmount"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:32mm;vertical-align:bottom;padding-right:0.75mm;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="BalanceDue"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="padding-left:.50mm;width:4mm;vertical-align:bottom;border-left:0px;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="Default"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="padding-left:.50mm;width:4mm;vertical-align:bottom;border-left:0px;border-right-width:1px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="Default"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="padding-left:0.50mm;width:4mm;vertical-align:bottom;border-left:0px;border-right-width:1px;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="ApprovedByBoard"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="padding-left:0.50mm;width:4mm;vertical-align:bottom;;border-left:0px;border-right-width:1px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="ApprovedByBoard"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="padding-left:0.50mm;width:4mm;vertical-align:bottom;border-left:0px;border-right-width:1px">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="WrittenAgreement"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="padding-left:0.50mm;width:4mm;vertical-align:bottom;border-left:0px;border-right-width:0px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="WrittenAgreement"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:if>
					<br/>
					<!-- SRD for Part III -->
					<xsl:if test="($Print = $Separated) and count($FormData/Form990ScheduleLPartIII) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part III - Grants or Assistance Benefitting Interested Persons</span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal;border-top-width:1px">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal; text-align:center;border-top-width:1px;">
										<span style="font-weight:bold">(b)</span>Relationship between interested person and the organization</th>
									<th class="styTableCellHeader" scope="col" style="width:62mm;font-weight:normal; text-align:center;border-top-width:1px;border-right-width:0px">
										<span style="font-weight:bold">(c)</span>Amount of grant or type of assistance</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/Form990ScheduleLPartIII">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left;">
										<xsl:choose>
											<xsl:when test="NameOfInterestedPerson">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterestedPerson"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterestedBusiness/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterestedBusiness/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellCtr" style="width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="RelationshipWithOrganization"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell">
										<xsl:choose>
											<xsl:when test="AmountOfGrant">
												<xsl:attribute name="style">width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;text-align:right</xsl:attribute>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AmountOfGrant"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">width:62mm;vertical-align:bottom;padding-right:0.75mm;border-left:0px;border-right:0px;text-align:left</xsl:attribute>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TypeOfAssistance"/>
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
					<xsl:if test="($Print = $Separated) and count($FormData/Form990ScheduleLPartIV) &gt; 6">
						<span class="styRepeatingDataTitle">Form 990, Schedule L, Part IV - Business Transactions Involving Interested Persons</span>
						<table class="styLeftOverTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:60mm;font-weight:normal;">
										<span style="font-weight:bold">(a)</span> Name of interested person</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:32mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(b)</span> Relationship between interested person and the organization</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:30mm;font-weight:normal;">
										<span style="font-weight:bold">(c)</span> Amount of transaction $</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:45mm;font-weight:normal; text-    			align:center;border-right-width:1px;">
										<span style="font-weight:bold">(d)</span> Description of transaction</th>
									<th class="styTableCellHeader" colspan="2" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold">(e)</span> Sharing of organization's revenues?</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;border-right-width:1px">Yes</th>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;">No</th>
								</tr>
							</thead>
							<tfoot/>
							<xsl:for-each select="$FormData/Form990ScheduleLPartIV">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1Cell </xsl:when><xsl:otherwise>styDepTblRow2Cell </xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellCtr" style="width:60mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">
										<xsl:choose>
											<xsl:when test="NameOfInterestedPerson/NamePerson">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterestedPerson/NamePerson"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterestedPerson/NameBusiness/BusinessNameLine1"/>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="NameOfInterestedPerson/NameBusiness/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellCtr" style="width:32mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Relationship"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:30mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AmountOfTransaction"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:45mm;vertical-align:top;padding-right:0.75mm;border-left:0px;text-align:left">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DescriptionOfTransaction"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:4mm;vertical-align:top;padding-right:0.75mm;border-left:0px;border-right-width:1px;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="SharingOfRevenues"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellCtr" style="width:4mm;vertical-align:top;padding-right:0.75mm;border-left:0px;border-right-width:0px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="SharingOfRevenues"/>
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
	<xsl:template name="IRS990PartVTableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:71mm;">
				<br/>
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:36mm;text-align:left;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell">
				<span style="width:4px;"/>
			</td>
			<td class="styTableCell" style="border-right-width:0px">
				<span style="width:4px;"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartVIIITableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:8mm;">
				<span class="styTableCellPad"/>
			</td>
			<td class="styTableCellText" style="width:178mm;border-right-width:0px">
				<span class="styTableCellPad"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="IRS990PartIXTableFillerRow">
		<tr>
			<td class="styTableCellText" style="width:56mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px">%</span>
			</td>
			<td class="styTableCell" style="width:55mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;">
				<span style="width:4px"/>
			</td>
			<td class="styTableCell" style="width:25mm;border-right-width:0px">
				<span style="width:4px"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
