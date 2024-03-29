<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4563Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form4563Data" select="$RtnDoc/IRS4563"/>
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form4563Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 4563"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS4563Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS4563">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:32mm;height:19mm;border-right-width:2px;">
							Form 
							<span class="styFormNumber" style="font-size:18pt">4563</span>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form4563Data"/>
							</xsl:call-template>
							<br/>
							<span style="font-size:7pt;">(Rev. December 2011)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:122mm;height:19mm;">
							<div class="styMainTitle" style="height:8mm;margin-bottom:3mm;">Exclusion of Income for Bona Fide Residents<br/>of American Samoa</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:50px;">
										<div style="width:35mm;height:5mm;float:left;">
											<img src="{$ImagePath}/4563_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040.
										</div>
										<div style="width:55mm;height:5mm;float:left;">
											<img src="{$ImagePath}/4563_Bullet_Sm.gif" alt="SmallBullet"/> 
											See instructions below and on back.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:32mm;height:19mm;border-left-width:2px;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0074</div>
							<div class="stySequence">
								<br/>Attachment<br/>Sequence No. <b>68</b>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:140mm;height:8mm;font-size:7pt;">
							Name(s) shown on Form 1040<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form4563Data/Name"/>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:45mm;height:8mm;font-size:7pt;padding-left:2mm;">
							Your social security number<br/>
							<span class="styEINFld" style="width:30mm; text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form4563Data/SSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Begin Part I (Header)-->
					<div style="width:187mm;" class="styBB">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;">
							General Information  
						</div>
					</div>
					<!-- Part I (Body) -->
					<div class="styBB" style="width:187mm;">
						<!-- Begin (Line) 1 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftNumBoxSD">1</div>
							<div class="styIRS4563LNDesc" style="width:100mm;">
								Date bona fide residence began
								<span style="width:3px;"/>
								<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image" style="padding-left:1mm"/>
								<span style="width:4px;"> </span>
								<span style="1mm"></span>
								<span style="border-bottom: 1px solid black;width:30mm">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$Form4563Data/BonaFideResidenceBeginDt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styIRS4563LNDesc" style="width:55mm;">
								, and ended
								<span style="width:3px;"/>
								<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image"/>
								<span style="width:4px;"> </span>
								<span style="1mm"></span>
								<span style="border-bottom: 1px solid black;width:30mm">
									<xsl:choose>
										<xsl:when test="$Form4563Data/BonaFideResidenceEndDt">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$Form4563Data/BonaFideResidenceEndDt"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4563Data/ContinueLiteralCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 1 -->
						<!-- Begin (Line) 2 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftNumBoxSD">2</div>
							<div class="styIRS4563LNDesc" style="width:37mm;">
								Type of living quarters in<br/>American Samoa
							</div>
							<div class="styIRS4563LNDesc" style="width:18mm;">
								<span style="width:3px;"/>
								<img src="{$ImagePath}/4563_Bullet_Lg.gif" alt="Bullet Image"/>
								<span style="width:4px;"> </span>
							</div>
							<div class="styIRS4563LNDesc" style="width:124mm;">
								<div class="styIRS4563LNDesc" style="width:54mm">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form4563Data/RentedRoomInd"/>
											<xsl:with-param name="BackupName">IRS4563RentedRoomInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form4563Data/RentedRoomInd"/>
											<xsl:with-param name="BackupName">IRS4563RentedRoomInd</xsl:with-param>
										</xsl:call-template>
										Rented room
									</label>
								</div>
								<div class="styIRS4563LNDesc" style="width:60mm">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form4563Data/RentedHouseInd"/>
											<xsl:with-param name="BackupName">IRS4563RentedHouseInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form4563Data/RentedHouseInd"/>
											<xsl:with-param name="BackupName">IRS4563RentedHouseInd</xsl:with-param>
										</xsl:call-template>
										Rented house or apartment
									</label>
								</div>
								<div class="styIRS4563LNDesc" style="width:54mm">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form4563Data/EmployerFurnishedQuartersInd"/>
											<xsl:with-param name="BackupName">IRS4563EmployerFurnishedQuartersInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form4563Data/EmployerFurnishedQuartersInd"/>
											<xsl:with-param name="BackupName">IRS4563EmployerFurnishedQuartersInd</xsl:with-param>
										</xsl:call-template>
										Quarters furnished by employer
									</label>
								</div>
								<div class="styIRS4563LNDesc" style="width:60mm">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form4563Data/PurchasedHouseInd"/>
											<xsl:with-param name="BackupName">IRS4563PurchasedHouseInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$Form4563Data/PurchasedHouseInd"/>
											<xsl:with-param name="BackupName">IRS4563PurchasedHouseInd</xsl:with-param>
										</xsl:call-template>
										Purchased home
									</label>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 2 -->
						<!-- Begin (Line) 3a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftNumBoxSD">3a</div>
							<div class="styIRS4563LNDesc" style="width:146mm;">
								Did any of your family live with you in American Samoa during any part of the tax year?
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.                              
								</span>
							</div>
							<div class="styIRS4563LNDesc" style="width:29mm;">
								<div class="styIRS4563LNDesc" style="width:13mm">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyLivingWithYouInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyLivingWithYouInd"/>
												<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyLivingWithYouInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyLivingWithYouInd"/>
												<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyLivingWithYouInd</xsl:with-param>
											</xsl:call-template>
											Yes
										</label>
									</span>
								</div>
								<div class="styIRS4563LNDesc" style="width:13mm">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyInAmericanSamoaGrp/FamilyLivingWithYouInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyLivingWithYouInd"/>
												<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyLivingWithYouInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyLivingWithYouInd"/>
												<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyLivingWithYouInd</xsl:with-param>
											</xsl:call-template>
											No
										</label>
									</span>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3a -->
						<!-- Begin (Line) 3b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftLtrBox">b</div>
							<!--+++++++++++++++++++ Text +++++++++++++++++++-->
							<div class="styIRS4563LNDesc" style="width:160mm;">
								<div class="styIRS4563LNDesc" style="width:53mm;padding-left:1px;">
									If “Yes,” who and for what period?
									<span style="width:3px;"/>
									<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image"/>
									<span style="width:4px;"> </span>
								</div>
							</div>
							<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
							<xsl:if test="$Form4563Data/FamilyInAmericanSamoaGrp">
								<!-- Table expand/collapse toggle button -->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styGenericDiv" style="float:right;width:3.2mm">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyInAmericanSamoaGrp"/>
										<xsl:with-param name="containerHeight" select="4"/>
										<xsl:with-param name="containerID" select=" 'FamilyInAmericanSamoaGrpDiv' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</xsl:if>
						</div>
						<xsl:if test="$Form4563Data/FamilyInAmericanSamoaGrp">
							<!-- Identifies the initial number of displayed rows -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<div class="styTableContainerNBB" id="FamilyInAmericanSamoaGrpDiv">
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--													Table Start																	-->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<xsl:call-template name="SetInitialState"/>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<table class="styTable" cellspacing="0">
									<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
									<thead class="styTableThead">
										<tr>
											<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:100mm;font-weight:bold;" scope="col">Relationship</th>
											<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:50%;font-weight:bold;" scope="col">Period</th>
										</tr>
									</thead>
									<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
									<tfoot/>
									<tbody>
										<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
										<xsl:for-each select="$Form4563Data/FamilyInAmericanSamoaGrp">
											<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
											<!--container height (4), execute-->
											<xsl:if test="($Print != $Separated) or (count($Form4563Data/FamilyInAmericanSamoaGrp) &lt;=4)">
												<tr style="font-size: 7pt;">
													<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
													<td class="styIRS4563TableCell" style="width:50%;font-size: 7pt; text-align:left;">
														<xsl:if test="FamilyRelationshipCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="FamilyRelationshipCd"/>
																<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyRelationshipCd</xsl:with-param>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</td>
													<!--+++++++++++++++++++ Time Period +++++++++++++++++++-->
													<td class="styIRS4563TableCell" style="width:50%;font-size: 7pt; text-align:left;">
														<xsl:if test="FamilyLivingWithYouTimePeriod">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="FamilyLivingWithYouTimePeriod"/>
																<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyLivingWithYouTimePeriod</xsl:with-param>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</xsl:if>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<!-- Table Filler Rows -->
										<!-- JMI: added: or.... -->
										<xsl:if test="count($Form4563Data/FamilyInAmericanSamoaGrp) &lt; 1 or ((count($Form4563Data/FamilyInAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
											<tr>
												<!-- Additional Table Data -->
												<td class="styTableCellText" style="width:50%;">
													<span style="width:4px"/>
													<xsl:if test="((count($Form4563Data/FamilyInAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyInAmericanSamoaGrp"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellCtr" style="width:50%mm;">
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
										<!-- JMI: added: or.... -->
										<xsl:if test="count($Form4563Data/FamilyInAmericanSamoaGrp) &lt; 2 or ((count($Form4563Data/FamilyInAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
											<tr>
												<td class="styTableCellText" style="width:50%;">
													<span style="width:4px"/>
												</td>
												<td class="styTableCellCtr" style="width:50%mm;">
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
										<!-- JMI: added: or.... -->
										<xsl:if test="count($Form4563Data/FamilyInAmericanSamoaGrp) &lt; 3 or ((count($Form4563Data/FamilyInAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
											<tr>
												<td class="styTableCellText" style="width:50%;">
													<span style="width:4px"/>
												</td>
												<td class="styTableCellCtr" style="width:50%mm;">
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
										<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
									</tbody>
								</table>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--													Table End																	    -->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</div>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form4563Data/FamilyInAmericanSamoaGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'FamilyInAmericanSamoaGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</xsl:if>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 3b -->
						<!-- Begin (Line) 4a -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftNumBoxSD">4a</div>
							<!--+++++++++++++++++++ Text +++++++++++++++++++-->
							<div class="styIRS4563LNDesc" style="width:146mm;">
								Did you maintain any home(s) outside American Samoa?
								<span class="styBoldText">
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
									<span style="width:11px"/>.
								</span>
							</div>
							<div class="styIRS4563LNDesc" style="width:29mm;">
								<!--+++++++++++++++++++ Yes/No Checkboxes +++++++++++++++++++-->
								<div class="styIRS4563LNDesc" style="width:13mm">
									<span>
										<!--<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintdOutsideAmeSamoaInd"/>
										</xsl:call-template>-->
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintdOutsideAmeSamoaInd"/>
												<xsl:with-param name="BackupName">IRS4563HmMaintOutsdAmericanSamoaGrpHmMaintdOutsideAmeSamoaInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintdOutsideAmeSamoaInd"/>
											<xsl:with-param name="BackupName">IRS4563HmMaintOutsdAmericanSamoaGrpHmMaintdOutsideAmeSamoaInd</xsl:with-param>
										</xsl:call-template>
										Yes
									</label>
								</div>
								<div class="styIRS4563LNDesc" style="width:13mm">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintdOutsideAmeSamoaInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintdOutsideAmeSamoaInd"/>
												<xsl:with-param name="BackupName">IRS4563HmMaintOutsdAmericanSamoaGrpHmMaintdOutsideAmeSamoaInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintdOutsideAmeSamoaInd"/>
											<xsl:with-param name="BackupName">IRS4563HmMaintOutsdAmericanSamoaGrpHmMaintdOutsideAmeSamoaInd</xsl:with-param>
										</xsl:call-template>
										No
									</label>
								</div>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4a -->
						<!-- Begin (Line) 4b -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftLtrBox">b</div>
							<!--+++++++++++++++++++ Text +++++++++++++++++++-->
							<div class="styIRS4563LNDesc" style="width:160mm;">
								<div class="styIRS4563LNDesc" style="width:160mm;padding-left:1px;">
									If “Yes,” show address of your home(s), whether it was rented, the name of each occupant, and his or her relationship to<br/>you.
									<span style="width:3px;"/>
									<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image"/>
									<span style="width:4px;"> </span>
								</div>
							</div>
							<!--+++++++++++++++++++ Table Toggle Button +++++++++++++++++++-->
							<xsl:if test="$Form4563Data/HmMaintOutsdAmericanSamoaGrp">
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<div class="styGenericDiv" style="float:right;width:3.2mm">
									<!-- button display logic -->
									<xsl:call-template name="SetDynamicTableToggleButton">
										<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintOutsdAmericanSamoaGrp"/>
										<xsl:with-param name="containerHeight" select="4"/>
										<xsl:with-param name="containerID" select=" 'HmMaintOutsdAmericanSamoaGrpDiv' "/>
									</xsl:call-template>
									<!-- end button display logic -->
								</div>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</xsl:if>
						</div>
						<xsl:if test="$Form4563Data/HmMaintOutsdAmericanSamoaGrp">
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<div class="styTableContainerNBB" id="HmMaintOutsdAmericanSamoaGrpDiv">
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--													Table Start																	-->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<xsl:call-template name="SetInitialState"/>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<table class="styTable" cellspacing="0">
									<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
									<thead class="styTableThead">
										<tr>
											<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:100mm;font-weight:bold;" scope="col">Name</th>
											<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Relationship</th>
											<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Home Address</th>
											<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Home Status</th>
										</tr>
									</thead>
									<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
									<tfoot/>
									<tbody>
										<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
										<xsl:for-each select="$Form4563Data/HmMaintOutsdAmericanSamoaGrp">
											<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
											<!--container height (4), execute-->
											<xsl:if test="($Print != $Separated) or (count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &lt;=4)">
												<tr style="font-size: 7pt;">
													<!--+++++++++++++++++++ Occupant Name +++++++++++++++++++-->
													<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OccupantName"/>
															<xsl:with-param name="BackupName">IRS4563OccupantName</xsl:with-param>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
													<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OccupantName/@occupantRelationshipCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<!--+++++++++++++++++++ Home Address +++++++++++++++++++-->
													<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
														<xsl:choose>
															<xsl:when test="HomeAddress">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="HomeAddress"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateForeignAddressTemplate">
																	<xsl:with-param name="TargetNode" select="HomeForeignAddress"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</td>
													<!--+++++++++++++++++++ Home Rented Status +++++++++++++++++++-->
													<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="HomeRentedStatusCd"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
										<!-- Table Filler Rows -->
										<!-- JMI: added: or.... -->
										<xsl:if test="count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &lt; 1 or ((count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
											<tr>
												<!--+++++++++++++++++++ Occupant Name +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
													<xsl:if test="((count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintOutsdAmericanSamoaGrp"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Home Address +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Home Rented Status +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
										<!-- JMI: added: or.... -->
										<xsl:if test="count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &lt; 2 or ((count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
											<tr>
												<!--+++++++++++++++++++ Occupant Name +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Home Address +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Home Rented Status +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
										<!-- JMI: added: or.... -->
										<xsl:if test="count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &lt; 3 or ((count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &gt;3) and ($Print = $Separated))">
											<tr>
												<!--+++++++++++++++++++ Occupant Name +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Home Address +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
													<span style="width:4px"/>
												</td>
												<!--+++++++++++++++++++ Home Rented Status +++++++++++++++++++-->
												<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left">
													<span style="width:4px"/>
												</td>
											</tr>
										</xsl:if>
										<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
									</tbody>
								</table>
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
								<!--													Table End																	    -->
								<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							</div>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!-- Set Initial Height of Above Table -->
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$Form4563Data/HmMaintOutsdAmericanSamoaGrp"/>
								<xsl:with-param name="containerHeight" select="3"/>
								<xsl:with-param name="containerID" select=" 'HmMaintOutsdAmericanSamoaGrpDiv' "/>
							</xsl:call-template>
							<!-- End Set Initial Height of Above Table -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</xsl:if>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 4b -->
						<!-- Begin (Line) 5 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftNumBoxSD">5</div>
							<div class="styIRS4563LNDesc" style="height:4mm;width:178.5mm;">
								Name and address of employer (state if self-employed)
								<span style="width:3px;"/>
								<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image"/>
								<span style="width:4px;"> </span>
								<span style="1mm"></span>
								<span style="border-bottom: 1px solid black;">
									<xsl:if test="$Form4563Data/SelfEmployed">
										self-employed
										<br></br>
									</xsl:if>
									<xsl:if test="$Form4563Data/EmployerName">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form4563Data/EmployerName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form4563Data/EmployerName/BusinessNameLine2)!=''">
											,
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form4563Data/EmployerName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<br></br>
									<xsl:choose>
										<xsl:when test="$Form4563Data/EmployerForeignAddress">
											<!-- +++++++++++++++ Foreign Address ++++++++++++++++++-->
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$Form4563Data/EmployerForeignAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!-- +++++++++++++++ Other Foreign Address ++++++++++++++++++-->
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$Form4563Data/EmployerOtherForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 5 -->
						<!-- Begin (Line) 6 -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styIRS4563LineItem">
							<div class="styIRS4563LNLeftNumBoxSD">6</div>
							<div class="styIRS4563LNDesc" style="height:4mm;width:178.5mm;">
								Complete columns (a) through (d) below for days absent from American Samoa during the tax year.
							</div>
						</div>
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6 -->
						<!-- Begin (Line) 6 (Table) -->
						<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
						<div class="styBB" style="width:187mm;">
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<div class="styGenericDiv" style="width:3.2mm;float:right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form4563Data/AmericanSamoaAbsenceGrp"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="containerID" select=" 'AmericanSamoaAbsenceGrpDiv' "/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<div class="styTableContainer" id="AmericanSamoaAbsenceGrpDiv">
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!--													Table Start																	-->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<xsl:call-template name="SetInitialState"/>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<table class="styTable" cellspacing="0">
								<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:30mm;vertical-align:top;font-size:6.5pt;" scope="col">
											<span class="styBoldText">(a)<span class="styNormalText"> Date left</span>
											</span>
										</th>
										<th class="styTableCellHeader" style="width:25mm;vertical-align:top;font-size:6.5pt;" scope="col">
											<span class="styBoldText">(b) <span class="styNormalText"> Date<br/>returned</span>
											</span>
										</th>
										<th class="styTableCellHeader" style="width:25mm;vertical-align:top;font-size:6.5pt;" scope="col">
											<span class="styBoldText">(c)<span class="styNormalText"> Number of<br/>days absent</span>
											</span>
										</th>
										<th class="styTableCellHeader" style="width:106mm;vertical-align:top;font-size:6.5pt;" scope="col">
											<span class="styBoldText">(d) <span class="styNormalText"> Reason for absence</span>
											</span>
										</th>
									</tr>
								</thead>
								<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
								<tfoot/>
								<tbody>
									<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
									<xsl:for-each select="$Form4563Data/AmericanSamoaAbsenceGrp">
										<!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
										<!--container height (4), execute-->
										<xsl:if test="($Print != $Separated) or (count($Form4563Data/AmericanSamoaAbsenceGrp) &lt;=4)">
											<tr style="font-size: 7pt;">
												<td class="styTableCellText" style="width:30mm;height:1mm;text-align:center;">
													<xsl:if test="AmericanSamoaDepartureDt">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="AmericanSamoaDepartureDt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:25mm;height:1mm;text-align:center;">
													<xsl:if test="AmericanSamoaReturnDt">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="AmericanSamoaReturnDt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:25mm;text-align:right;">
													<xsl:if test="DaysAbsentFromSamoaCnt">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DaysAbsentFromSamoaCnt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellText" style="width:106mm;text-align:left;">
													<xsl:if test="AbsenceReasonDesc">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AbsenceReasonDesc"/>
														</xsl:call-template>
													</xsl:if>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<!-- Table Filler Rows -->
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4563Data/AmericanSamoaAbsenceGrp) &lt; 1 or ((count($Form4563Data/AmericanSamoaAbsenceGrp) &gt;4) and ($Print = $Separated))">
										<tr>
											<!-- Additional Table Data -->
											<td class="styTableCellText" style="width:30mm;text-align:center">
												<span style="width:4px"/>
												<xsl:if test="((count($Form4563Data/AmericanSamoaAbsenceGrp) &gt;4) and ($Print = $Separated))">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form4563Data/AmericanSamoaAbsenceGrp"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:right">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:106mm;text-align:left">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4563Data/AmericanSamoaAbsenceGrp) &lt; 2 or ((count($Form4563Data/AmericanSamoaAbsenceGrp) &gt;4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:30mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:right">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:106mm;text-align:left">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4563Data/AmericanSamoaAbsenceGrp) &lt; 3 or ((count($Form4563Data/AmericanSamoaAbsenceGrp) &gt;4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:30mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:right">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:106mm;text-align:left">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- JMI: added: or.... -->
									<xsl:if test="count($Form4563Data/AmericanSamoaAbsenceGrp) &lt; 4 or ((count($Form4563Data/AmericanSamoaAbsenceGrp) &gt;4) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:30mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:center">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:25mm;text-align:right">
												<span style="width:4px"/>
											</td>
											<td class="styTableCellCtr" style="width:106mm;text-align:left">
												<span style="width:4px"/>
											</td>
										</tr>
									</xsl:if>
									<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
								</tbody>
							</table>
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
							<!--													Table End																	    -->
							<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						</div>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<!-- Set Initial Height of Above Table -->
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form4563Data/AmericanSamoaAbsenceGrp"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'AmericanSamoaAbsenceGrpDiv' "/>
						</xsl:call-template>
						<!-- End Set Initial Height of Above Table -->
						<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
						<!-- End (Line) 6 (Table)-->
						<!-- Begin Part || (Header)-->
						<div style="width:187mm;" class="styBB">
							<div class="styPartName" style="width:15mm;">Part II</div>
							<div class="styPartDesc" style="padding-left:3mm;">
								Figure Your Exclusion. <span class="styNormalText">Include </span>only <span class="styNormalText">income that qualifies for the exclusion. See instructions.</span>
							</div>
						</div>
						<!-- End Part || (Header)-->
						<!-- Part || (Body) -->
						<div class="styBB" style="width:187mm;">
							<!-- Begin (Line) 7 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBoxSD">7</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Wages, salaries, tips, etc.
									<span style="width:3px;"/>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">7</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/WagesExclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 7-->
							<!-- Begin (Line) 8 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBoxSD">8</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Taxable interest
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">8</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/TaxableInterestExclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 8-->
							<!-- Begin (Line) 9 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBoxSD">9</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Ordinary dividends
									<span style="width:3px;"/>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">9</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/OrdinaryDividendsExclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 9-->
							<!-- Begin (Line) 10 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBox">10</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Business income
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:9px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">10</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/BusinessIncomeExclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 10-->
							<!-- Begin (Line) 11 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBox">11</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Capital gain
									<span style="width:3px;"/>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">11</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/CapitalGainExclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 11-->
							<!-- Begin (Line) 12 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBox">12</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Rental real estate, royalties, etc.
									<span style="width:3px;"/>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">12</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/RentalRealEstateIncomeExclAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 12-->
							<!-- Begin (Line) 13 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBox">13</div>
								<div class="styIRS4563LNDesc" style="height:4mm;">
									Farm income
									<span style="width:3px;"/>
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
										</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm;">13</div>
								<div class="styLNAmountBox" style="width:33mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form4563Data/FarmIncomeExclusionAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 13-->
							<!-- Begin (Line) 14 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
								<div class="styIRS4563LNLeftNumBox">14</div>
								<xsl:for-each select="$Form4563Data/OtherIncomeExclusionGrp">

								<div style="">
									<xsl:if test="position()=1">
									
										<span style="width:52.4mm;height:15mm">
											Other income. List type and amount
											<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image"/>
										</span>
									</xsl:if> 
									<xsl:if test="position()!=1">
										<span style="width:61mm;height:15mm"/>
									</xsl:if>
											<span style="width:10mm;height:15mm">
												<xsl:if test="OtherIncomeExclusionCd">
												
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherIncomeExclusionCd"/>
													</xsl:call-template>
												</xsl:if>
											</span>
											<span style="width:40mm;height:15mm">
												<xsl:if test="OtherIncomeExclusionDsc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherIncomeExclusionDsc"/>
													</xsl:call-template>
												</xsl:if>
											</span>
											<span style="width:34.84mm;height:15mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherIncomeExclusionAmt"/>
												</xsl:call-template>
											</span>
											<span  style="background-color:lightgrey;width:8.2mm;height:15mm;border-right:1px solid black;border-left:1px solid black;border-bottom-width:0px"/>
									</div>
								</xsl:for-each>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;">14</div>
										<div class="styLNAmountBox" style="width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4563Data/TotalOtherIncomeExclusionAmt"/>
											</xsl:call-template>
										</div>
									</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 14-->
							<!-- Begin (Line) 15 -->
							<!-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
							<div class="styIRS4563LineItem">
								<div class="styIRS4563LNLeftNumBox">15</div>
								<div class="styIRS4563LNDesc" style="height:3mm;">
									Add lines 7 through 14. This is the amount you may exclude from your gross income this tax<br/>year
									<!--Dotted Line-->
									<span class="styBoldText">
										<span style="width:16px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
									</span>
									<span style="width:3mm;"/>
									<img src="{$ImagePath}/4563_Bullet_Md.gif" alt="Bullet Image"/>
									<span style="width:1mm;"> </span>
								</div>
										<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px"/>
										<div class="styLNAmountBoxNBB" style="width:33mm;height:4.5mm;"/>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;border-bottom-width:0px;">15</div>
										<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$Form4563Data/GrossIncomeExclusionAmt"/>
											</xsl:call-template>
										</div>
									</div>
							</div>
							<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
							<!-- End (Line) 15-->
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top-width:0px;">
						<div style="width:100mm;float:left;">
							<b>For Paperwork Reduction Act Notice, see Form 1040 instructions.</b>
						</div>
						<div style="float:left;clear:none;margin-left:10mm">
						Cat. No. 12909U</div>
						<div style="float:left;clear:none;margin-left:16.1mm">
							<!--<span style="width:80px;"/>-->  
								Form 
							<span class="styBoldText" style="font-size:8pt;">4563</span> (Rev. 12-2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form4563Data"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
					</table>
					
					<!-- Separated Data for Part I, Line 3b -->
					<xsl:if test="($Print = $Separated) and  (count($Form4563Data/FamilyInAmericanSamoaGrp) &gt; 3)">
						<br/>
						<span class="styRepeatingDataTitle">
							Form 4563, Part I, Line 3b - If “Yes,” who and for what period?
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:50%;font-weight:bold;" scope="col">Relationship</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:50%;font-weight:bold;" scope="col">Period</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form4563Data/FamilyInAmericanSamoaGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
										<td class="styIRS4563TableCell" style="width:50%;font-size: 7pt; text-align:left;">
											<xsl:if test="FamilyRelationshipCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FamilyRelationshipCd"/>
													<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyRelationshipCd</xsl:with-param>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++ Time Period +++++++++++++++++++-->
										<td class="styIRS4563TableCell" style="width:50%;font-size: 7pt; text-align:left;">
											<xsl:if test="FamilyLivingWithYouTimePeriod">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FamilyLivingWithYouTimePeriod"/>
													<xsl:with-param name="BackupName">IRS4563FamilyInAmericanSamoaGrpFamilyLivingWithYouTimePeriod</xsl:with-param>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
					<!-- Separated Data for Part I, Line 4b -->
					<xsl:if test="($Print = $Separated) and  (count($Form4563Data/HmMaintOutsdAmericanSamoaGrp) &gt; 3)">
						<br/>
						<span class="styRepeatingDataTitle">
			Form 4563, Part I, Line 4b - If “Yes,” show address of your home(s), whether it was rented, the name of each occupant, and his or her relationship to
you.
		</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Name</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Relationship</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Home Address</th>
									<th class="styTableCellHeader" style="text-align:center;font-size: 7pt; width:25%;font-weight:bold;" scope="col">Home Status</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form4563Data/HmMaintOutsdAmericanSamoaGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!--+++++++++++++++++++ Occupant Name +++++++++++++++++++-->
										<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
											<xsl:if test="OccupantName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OccupantName"/>
													<xsl:with-param name="BackupName">IRS4563OccupantName</xsl:with-param>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++ Relationship +++++++++++++++++++-->
										<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
											<xsl:if test="OccupantName/@occupantRelationshipCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OccupantName/@occupantRelationshipCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<!--+++++++++++++++++++ Home Address +++++++++++++++++++-->
										<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
											<xsl:choose>
												<xsl:when test="HomeAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="HomeAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="HomeForeignAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!--+++++++++++++++++++ Home Rented Status +++++++++++++++++++-->
										<td class="styIRS4563TableCell" style="width:25%;font-size: 7pt; text-align:left;">
											<xsl:if test="HomeRentedStatusCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="HomeRentedStatusCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
					<!-- Separated Data for Part I, Line 6 -->
					<xsl:if test="($Print = $Separated) and  (count($Form4563Data/AmericanSamoaAbsenceGrp) &gt; 4)">
						<br/>
						<span class="styRepeatingDataTitle">
							Form 4563, Part I, Line 6 - Complete columns (a) through (d) below for days absent from American Samoa during the tax year.
						</span>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
						<table class="styDepTbl" cellspacing="0">
							<!-- ++++++++++++++++++++++++ Start: Table Headers ++++++++++++++++++++++ -->
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:30mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styBoldText">(a)<span class="styNormalText"> Date left</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styBoldText">(b) <span class="styNormalText"> Date<br/>returned</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:25mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styBoldText">(c)<span class="styNormalText"> Number of<br/>days absent</span>
										</span>
									</th>
									<th class="styDepTblCell" style="width:106mm;vertical-align:top;font-size:6.5pt;" scope="col">
										<span class="styBoldText">(d) <span class="styNormalText"> Reason for absence</span>
										</span>
									</th>
								</tr>
							</thead>
							<!-- ++++++++++++++++++++++++ End: Table Headers +++++++++++++++++++++++ -->
							<tfoot/>
							<tbody>
								<!-- ++++++++++++++++++++++++++ Start  Populating +++++++++++++++++++++++ -->
								<xsl:for-each select="$Form4563Data/AmericanSamoaAbsenceGrp">
									<tr style="border-color:black;">
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:30mm;height:1mm;text-align:center;">
											<xsl:if test="AmericanSamoaDepartureDt">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AmericanSamoaDepartureDt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:25mm;height:1mm;text-align:center;">
											<xsl:if test="AmericanSamoaReturnDt">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="AmericanSamoaReturnDt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:25mm;text-align:right;">
											<xsl:if test="DaysAbsentFromSamoaCnt">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DaysAbsentFromSamoaCnt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellText" style="width:106mm;text-align:left;">
											<xsl:if test="AbsenceReasonDesc">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AbsenceReasonDesc"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<!-- +++++++++++++++++++++++++++ End  Populating +++++++++++++++++++++++ -->
							</tbody>
						</table>
						<!-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
