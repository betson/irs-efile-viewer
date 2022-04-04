<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS2441Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form2441Data" select="$RtnDoc/IRS2441"/>
	<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form2441Data)"/>
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
				<meta name="Description" content="IRS Form 2441"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				 <style type="text/css"> 
				    <xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS2441Style"/>
						<xsl:call-template name="AddOnStyle"/>
				    </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>  
			</head>
			<body class="styBodyClass" >
				<form name="Form2441">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Begin Form title and Form number section -->		
					<div class="styTBB" style="width:187mm;">
					<div class="styFNBox" style="width:31mm;height:20mm;border-right-width:2px;font-size:7pt;">        
						Form
						<span class="styFormNumber">2441</span><br/>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form2441Data"/>
						</xsl:call-template>
							 <br/>
							<span class="styAgency">Department of the Treasury</span><br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
									</div>
									<!-- Begin Form title -->
									<div class="styFTBox" style="width:120mm;height:20mm;">
										<div class="styMainTitle" style="font-size: 13pt;width:90mm;float:left;padding-top:1mm;padding-left:4mm;">Child and Dependent Care Expenses </div>
										<div class="styFTBox" style="width:25mm;float:right;clear:none;vertical-align:bottom;padding-top:2.2mm;padding-right:6mm;">
										 <img src="{$ImagePath}/2441_Form.gif" alt="1040 Return Attachment" height="65" width="90"/> </div>
										<div class="styFBT" style="height:5mm;margin-top:3mm;width:90mm;">
											<img src="{$ImagePath}/2441_Bullet.gif" alt="Bullet"/> Attach to Form 1040, 1040-SR, or 1040-NR.
											<span style="width:90mm;padding-top:1mm;">
											<img src="{$ImagePath}/2441_Bullet.gif" alt="Bullet"/>Go to <a href="http://www.irs.gov/Form2441">www.irs.gov/Form2441</a> for instructions and the latest information.</span>
											</div>
									</div>
									<!-- Begin Form Tax Year -->
									<div class="styTYBox" style="width:31mm; height:20mm;border-left-width:2px;">
										<div style="border-bottom:1 solid black;padding-top:1mm;">OMB No. 1545-0074</div>
										<div class="styTaxYear" style="font-size:21pt;border-top:1px solid black;width:26mm;">20<span class="styTYColor" style="font-size:21pt:">20</span>
										</div>
										<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">21</b>
										</div>
									</div>
								</div>
					<!--  End title of Form  -->
					<!--Name Shown on return-->
					<div class="styBB" style="width:187mm;font-size:7pt;border-bottom-width:2px;height:7mm;">
						<div class="styFNBox" style="width:140mm; height:7mm;">
                        Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
							<div style="font-family:verdana;font-size:7pt"/>
						</div>
						<div class="styEINBox" style="width:47mm;height:7mm;font-weight:normal;padding-left:0.5mm;">
							<span style="padding-left:2mm;">
							<b>Your social security number</b><br/>
									<span class="styEINFld" style="width:30mm; text-align:left;font-weight:normal;text-align:center;">
										<xsl:call-template name="PopulateReturnHeaderFilerTIN"></xsl:call-template>
									</span>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;font-size:7pt;border-bottom-width:2px;height:9mm;">
						<div class="styFNBox" style="width:187mm; height:7mm;border-right-width: 0px;">
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form2441Data/EligibilityRequirementMetInd"/>
								<xsl:with-param name="BackupName">Eligbility requirement met indicator</xsl:with-param>
							</xsl:call-template>You cannot claim a credit for child and dependent care expenses if your filing status is married filing separately unless you meet the requirements listed in the instructions under “Married Persons Filing Separately.” If you meet these requirements, check this box.
                        </label>
					  <input type="checkbox" alt="EligibilityRequirementMet" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form2441Data/EligibilityRequirementMetInd"/>
								<xsl:with-param name="BackupName">Eligbility requirement met indicator</xsl:with-param>
							</xsl:call-template>
					  </input>
					  </div>
					</div>
					<!-- MAIN SECTION -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styBB" style="width:187mm;height:8mm;">
							<span class="styPartName" style="height:4mm;width:12mm;font-size:13;">Part l</span>
							<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:8pt;">
                                 Persons or Organizations Who Provided the Care <img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="LongDash"/>
								<span class="styNormalText" style="padding-left:1mm;font-size:8pt;"> You  
                                <span class="styBoldText">must </span>
									<span style="width:1mm;"/>complete this part. </span>
								<br/>
								<span class="styNormalText" style="padding-left:0mm;font-size:8pt;"> (If you have more than two care providers, see the instructions.)</span>
							</div>
							<!-- Table expand/collapse toggle button -->
							<div class="styGenericDiv" style="float:right;height:1mm;padding-top:3mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form2441Data/CareProviderGrp"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'CareProviderGrp' "/>
								</xsl:call-template>
							</div>
						</div>
						<!-- END PART I TITLE -->
						<!--Part I table Header -->
						<div class="styTableContainer" id="CareProviderGrp">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Care Provider information " name="CPtable" id="CPtable">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" colspan="1" rowspan="1" style="width:60mm;font-weight:normal;text-align: left;height:9mm; border-color:black;vertical-align:top;">
											<b>
												<span style="width:1mm"/>1</b>
											<span style="width:7mm;"/>
											<span style="font-weight:bold;">(a)</span>
       Care provider's <br/>
											<span style="font-weight:bold;width:1mm;font-size:7pt;"/>
											<span style="width:17mm;"/> name
      </th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="width:70mm;font-weight:normal;height:11mm; border-color:black;vertical-align:top;">
											<span style="font-weight:bold;">(b)<span style="width:1mm;"/>
											</span>Address<br/>(number, street, apt. no., city, state, and ZIP code)
    </th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="width:23mm;font-weight:normal;height:9mm;  border-color:black;vertical-align:top;">
											<span style="font-weight:bold;">(c)</span> Identifying number<br/> (SSN or EIN)
     </th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="width:30mm;font-weight:normal;height:9mm;  border-color:black;vertical-align:top;">
											<span style="font-weight:bold;">(d)</span> Amount paid<br/>(see instructions)
     </th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<!-- print logic -->
									<xsl:for-each select="$Form2441Data/CareProviderGrp">
										<xsl:if test="($Print != $Separated) or (count($Form2441Data/CareProviderGrp) &lt;= 2) ">
											<tr style="vertical-align:top">
												<td class="styTableCellText" style="width:64mm;border-color:black;text-align:none;vertical-align:top;padding-top:0mm">
													<!--CareProviderPersonName-->
													<xsl:choose>
														<xsl:when test="CareProviderPersonName">
															<xsl:if test="CareProviderPersonName !=''">
																<div style="text-align:left;vertical-align:top;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonFirstNm"/>
																	</xsl:call-template>
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonLastNm"/>
																	</xsl:call-template>
																	<br/>
																	<!--CareProviderNameControl-->
																	<xsl:if test="CareProviderNameControlTxt !=''">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="CareProviderNameControlTxt"/>
																		</xsl:call-template>
																		<br/>
																	</xsl:if>
																</div>
															</xsl:if>
															<xsl:if test="CareProviderPersonName=''">
																<span style="width:1mm;"/>
															</xsl:if>
														</xsl:when>
														<xsl:when test="CareProviderBusinessName/BusinessNameLine1Txt">
															<!--CareProviderBusinessName-->
															<xsl:if test="CareProviderBusinessName/BusinessNameLine1Txt !=''">
																<div style="text-align:left;vertical-align:top">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																	<xsl:if test="CareProviderBusinessName/BusinessNameLine2Txt !=''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine2Txt"/>
																		</xsl:call-template>
																	</xsl:if>
																	<br/>
																	<!--CareProviderBusNameCtrl-->
																	<xsl:if test="$Form2441Data/CareProviderGrp/CareProviderBusNameControlTxt  !=''">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="CareProviderBusNameControlTxt"/>
																		</xsl:call-template>
																	</xsl:if>
																</div>
															</xsl:if>
															<xsl:if test="CareProviderBusinessName/BusinessNameLine1Txt=''">
																<span style="width:1mm;"/>
															</xsl:if>
														</xsl:when>
													</xsl:choose>
												</td>
												<!--USAAddress-->
												<td class="styTableCellText" style="width:70mm;vertical-align:top;border-color:black;text-align:left;">
													<!-- <span style="float:left;clear:none;"> -->
													<xsl:if test="USAddress/AddressLine1Txt != ''">
													<div style="text-align:left;vertical-align:top;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<br/>
														<!-- <span style="float:left;clear:none;">  -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
														<!-- <span style="float:left;clear:none;">  -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
														</xsl:call-template>
														<br/>
														<!-- <span style="float:left;clear:none;">  -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<br/>
														<!-- <span style="float:left;clear:none;">  -->
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
														</xsl:call-template>
													</div>
													</xsl:if>
													<!--ForiegnAddress-->
													<xsl:if test="ForeignAddress/AddressLine1Txt != ''">
													<div style="text-align:left;vertical-align:top;">
													<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														 <br/>
												      <xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
											                <br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
														</xsl:call-template>	
											                <br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>	
														    <br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
														</xsl:call-template>
														</div>
													</xsl:if>  
														<!--SeeW2Cd-->
														<!-- <span style="float:left;clear:none;"> -->
													<xsl:if test="$Form2441Data/CareProviderGrp/SeeW2Cd !=''">
													   <div style="text-align:left;vertical-align:top;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SeeW2Cd"/>
															</xsl:call-template>
														</div>
													</xsl:if>
													
												</td>
												<td class="styTableCellCtr" style="width:23mm;  border-color:black;text-align:center;vertical-align:top">
													<!--SSN number-->
													<xsl:if test="$Form2441Data/CareProviderGrp/SSN !=''">
														<div style="text-align:center">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</div>
													</xsl:if>
													<!--EIN number-->
													<xsl:if test="$Form2441Data/CareProviderGrp/EIN !=''">
														<div style="text-align:center">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</div>
													</xsl:if>
													<!--Tax Exempt-->
													<xsl:if test="$Form2441Data/CareProviderGrp/TaxExemptCd !=''">
														<div style="text-align:center">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="TaxExemptCd"/>
															</xsl:call-template>
														</div>
													</xsl:if>
													<!--Living Abroad Foreign Care Providers-->
													<xsl:if test="$Form2441Data/CareProviderGrp/LivingAbroadFrgnCareProviderCd !=''">
														<div style="text-align:center">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="LivingAbroadFrgnCareProviderCd"/>
															</xsl:call-template>
														</div>
													</xsl:if>
													<!--Due Diligence Code-->
													<xsl:if test="$Form2441Data/CareProviderGrp/DueDiligenceCd !=''">
														<div style="text-align:center;vertical-align:top;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DueDiligenceCd"/>
															</xsl:call-template>
														</div>
													</xsl:if>
												</td>
												<!--Paid amount-->
												<td class="styTableCell" style="width:30mm;  border-color:black;text-align:right;vertical-align:top">
													<div style="text-align:right">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="PaidAmt"/>
														</xsl:call-template>
													</div>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="count($Form2441Data/CareProviderGrp)&lt; 1 or ((count($Form2441Data/CareProviderGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:60mm;text-align:left; border-color:black;">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form2441Data/CareProviderGrp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:70mm;  border-color:black;padding-bottom0;">
												<span class="styTableCellPad" style="width:69mm;  border-bottom:1px dashed black;height:3mm;"/>
												<span class="styTableCellPad" style="height:1mm;"/>
											</td>
											<td class="styTableCellCtr" style="width:27mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="count($Form2441Data/CareProviderGrp)&lt; 2  or ((count($Form2441Data/CareProviderGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:60mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:70mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad" style="width:69mm;  border-bottom:1px dashed black;height:3mm;"/>
												<span class="styTableCellPad" style="height:1mm;"/>
											</td>
											<td class="styTableCellCtr" style="width:27mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:30mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form2441Data/CareProviderGrp"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'CareProviderGrp' "/>
						</xsl:call-template>
						<!-- END Part I table -->
						<!--instructions-->
						<div style="width:187mm;">
							<div class="styIRS2441SpaceBox"/>
							<br/>
							<div class="styIRS2441instructionBoxNBB" style="border-top-width:.5mm;border-bottom-width:.5mm;border-left-width:.5mm;border-right-width:.5mm;height:10mm;width:50mm;font-size:8pt;padding-top:0.5mm;">
Did you receive<br/>
								<span class="styBoldText">dependent care benefits?</span>
							</div>
							<span style="vertical-align:top;"> _________</span>
							<span class="styBoldText" style=" vertical-align:bottom; font-size:8pt;">
								<span style="width:1mm;"/>
							No <span style="width:.1.5mm;"/>
							</span>
							<span style="vertical-align:top; "> __________</span>
							<img src="{$ImagePath}/2441_Bullet_Md.gif" alt="MediumBullet" align="bottom" style="padding-top:1.6mm;"/> Complete only Part II below.
							<br/>
							<span style="vertical-align:top;"> _________</span>
							<span class="styBoldText" style="vertical-align:bottom; font-size:8pt">
								<span style="width:1mm;"/>
							Yes <span style="width:1mm;"/>
							</span>
							<span style="vertical-align:top; "> __________</span>
							<span style="width:.25mm;"/>
							<img src="{$ImagePath}/2441_Bullet_Md.gif" alt="MediumBullet" align="bottom" style="padding-top:1.6mm;"/> Complete Part III on the back next.  
						</div>
						<div class="styPartDesc" style="font-weight:Normal;width:187mm;padding-top:2mm;font-size:8pt;height:10mm;padding-left:0mm;">
							<b>Caution.</b> If the care was provided in your home, you may owe employment taxes. For details, see the instructions for Schedule 2 (Form 1040), line 7a. </div>
						<!-- BEGIN PART II TITLE -->
						<div class="styBB" style="width:187mm;border-top-width: 2px;height:4.5mm;">
							<span class="styPartName" style="width:12mm;font-size:13;">Part ll</span>
							<div class="styPartDesc" style="font-size:8pt;">Credit for Child and Dependent Care Expenses
                            </div>
						</div>
						<!-- END PART II TITLE -->
						<!--line 2 Part II-->
						<div class="styBB" style="width:187mm;height:5mm;">
							<div class="styLNLeftNumBox" style="height:6mm;width:6mm;padding-top:1mm;">
								<span style="width:1mm"/>2</div>
							<div class="styLNDesc" style="width:177mm;font-size:8pt;height:1mm;"> Information about your <span class="styBoldText">qualifying person(s).</span>
                                 If you have more than two qualifying persons, see the instructions.
                            </div>
							<!-- Table expand/collapse toggle button -->
							<div style="float:right;padding-top:0mm;height:1mm;">
								<!--div style="width:5mm;float:right;vertical-align:top;"-->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form2441Data/QualifyingPersonGrp"/>
									<xsl:with-param name="containerHeight" select="2"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'CareExpenses' "/>
								</xsl:call-template>
							</div>
						</div>
						<!--Part II table Header -->
						<div class="styTableContainer" id="CareExpenses">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Qualifying persons information" name="Qualtable" id="Qualtable">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" colspan="2" style="width:88mm;font-weight:normal;  border-color:black;height:6mm;">
											<span style=";">
												<span style="font-weight:bold;">(a)</span> Qualifying person's name
                                                 <br/> First<span style="width:35mm"/>Last</span>
										</th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="height:6mm;width:57mm;font-weight:normal;  border-color:black;">
											<span style=";">
												<span style="font-weight:bold;">(b)</span>Qualifying person's social<br/> security number</span>
										</th>
										<th class="styTableCellHeader" scope="col" colspan="1" style="width:50mm;font-weight:normal;  height:6mm;border-color:black;">
											<span style="">
												<span style="font-weight:bold;">(c)</span>
												<span class="styBoldText">Qualified expenses</span> you<br/> incurred and paid in 2020 for the person listed in column (a)</span>
										</th>
									</tr>
								</thead>
								<tfoot/>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($Form2441Data/QualifyingPersonGrp) &lt; 5) ">
										<xsl:for-each select="$Form2441Data/QualifyingPersonGrp">
											<tr>
												<td class="styTableCellText" style="width:44mm; border-color:black">
													<span style="width:0mm;">
											</span>
													<!--Person Name-->
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonFirstNm"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCellText" style="width:44mm;border-color:black;">
													<div style="text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonLastNm"/>
														</xsl:call-template>
														<!--QualifyingPersonLiteralCd-->
														<xsl:if test="$Form2441Data/QualifyingPersonGrp/QualifyingPersonNameControlTxt">
															<span style="width:5mm;"/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="QualifyingPersonNameControlTxt"/>
															</xsl:call-template>
														</xsl:if>
													</div>
												</td>
												<!--Person SSN-->
												<td class="styTableCellCtr" style="width:60mm;  border-color:black;">
													<xsl:choose>
														<xsl:when test="DiedLiteralCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="QualifyingPersonSSN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:49mm;  border-color:black">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="QualifiedCareExpensesPaidAmt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="(count($Form2441Data/QualifyingPersonGrp)&lt; 1) or ((count($Form2441Data/QualifyingPersonGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCell" style="width:44mm;text-align:left;  border-color:black;">
												<span class="styBoldText"/>
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$Form2441Data/QualifyingPersonGrp"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:44mm;  border-color:black">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellCtr" style="width:49mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:49mm;  border-color:black">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="(count($Form2441Data/QualifyingPersonGrp)&lt; 2) or ((count($Form2441Data/QualifyingPersonGrp) &gt; 2) and ($Print = $Separated))">
										<tr>
											<td class="styTableCellText" style="width:44mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCellText" style="width:44mm;  border-color:black;border-bottom-width:0px;">
												<span style="width:1px;"/>
											</td>
											<td class="styTableCellCtr" style="width:49mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="width:49mm;  border-color:black;border-bottom-width:0px;">
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form2441Data/QualifyingPersonGrp"/>
							<xsl:with-param name="containerHeight" select="2"/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerID" select=" 'CareExpenses' "/>
						</xsl:call-template>
						<!-- END Part II table -->
						<!--Line 3-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:3mm; padding-top: 3mm;"><span style="width:1.5mm"/>3
                            </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;padding-top: 3mm;">Add the amounts in column (c) of line 2.  
							<span class="styBoldText">Don't</span> enter more than $3,000 for one qualifying<br/>
						        person or $6,000 for two or more persons. If you completed Part III, enter the amount from<br/> line 31 
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>							
							<div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;border-top-width:0px;background-color:lightgrey;border-top-width:0px;"/>
							<div class="styIRS2441RightSpaceBox" style="height:6mm;border-left-width:1px;border-top-width:0px;"/>
						    <div class="styIRS2441RightSpaceBox" style="width:131mm;height:6mm;border-left-width:0px;border-top-width:0px;"/>
							<div class="styLNRightNumBox" style="height:6mm;border-right-width:0px;padding-top:2.8mm;">3                        
                            </div>
							<div class="styLNAmountBox" style="float:right;height:6mm;border-left-width:1px;width:48mm;padding-top:2.6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/TotalQlfdExpensesOrLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 4-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-top:2.5mm;"><span style="width:1.5mm"/>4
                            </div>
							<div class="styLNDesc" style="width:123mm;height:4mm;padding-top:2.5mm;">Enter your  
					    	    <span class="styBoldText">earned income.</span> See instructions
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;border-right-width:0px;padding-top:2.8mm;">4                         
                            </div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:1px;width:48mm;padding-top:2.4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/PrimaryEarnedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:5mm;"><span style="width:1.5mm"/>5
                            </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;">If married filing jointly, enter your spouse's 
								earned income (if you or your spouse was a student or was disabled, see the instructions); <span class="styBoldText">all others,</span>
								 enter the amount from line 4
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;border-right-width:0px;padding-top:2.8mm;">5                       
                            </div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:1px;width:48mm;padding-top:2.8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/SpouseEarnedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 6-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;padding-top:2mm;"><span style="width:1.5mm"/>6
                            </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:2mm;">Enter the <span class="styBoldText">smallest </span> of line 3, 4, or 5
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;border-right-width:0px;padding-top:2.8mm;">6                      
                            </div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:1px;width:48mm;padding-top:2.8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/SmallerOfExpensesOrIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 7-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;"><span style="width:1.5mm"/>7
                        </div>
							<div class="styLNDesc" style="width:123mm;height:4mm;">Enter the amount from Form 1040, 1040-SR, or  
       		                </div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4mm;border-right-width:0px;width:48mm;"/>
							<div class="styLNDesc" style="width:91mm;height:4mm;font-size:7pt;">
								<span style="width:8mm"/> 1040-NR, line 11    
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;padding-top:1.2mm;"><span style="width:1mm"/>7                     
                            </div>
							<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;width:32mm;padding-top:1.2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
						</div>
						<!--Line 8-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;"><span style="width:1.5mm"/>8
							</div>
						    <div class="styLNDesc" style="width:123mm;height:4mm;">Enter on line 8 the decimal amount shown below that applies to the amount on line 7  
						   </div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						</div>
						<!--Decimal chart Headers-->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:131mm;height:4mm;">
								<span style="width:17mm"/>
								<span class="styBoldText">If line 7 is:</span>
								<span style="width:40mm"/>
								<span class="styBoldText">If line 7 is:</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						</div>
						<!--Column Headers-->
						<div style="width:187mm;">
							<div class="styLNDesc" style="width:57mm;">
								<div class="styLNAmountBoxNBB" style="height:5mm;border-left-width:0px;width:57mm;border-top-width: 0px;text-align:left;">
									<span style="width:27mm"/>
									<span class="styBoldText">But not</span>
									<span style="width:1.7mm"/>
									<span class="styBoldText">Decimal</span>
									<br/>
									<span style="width:17mm"/>
									<span class="styBoldText"> Over</span>
									<span style="width:3.7mm"/>
									<span class="styBoldText">over</span>
									<span style="width:3mm;padding-left:4.9mm;"/>
									<span class="styBoldText"><span style="width:.55mm"/>amount is</span>
								</div>
							</div>
							<div class="styLNAmountBoxNBB" style="height:6.0mm;border-left-width:0px;width:5mm;"/>
							<div class="styLNDesc" style="width:56.9mm;">
								<div class="styLNAmountBoxNBB" style="height:5mm;border-left-width:0px;width:56.9mm;border-top-width: 0px;text-align:left;">
									<span style="width:19mm"/>
									<span class="styBoldText">But not</span>
									<span style="width:4mm"/>
									<span class="styBoldText">Decimal</span>
									<br/>
									<span style="width:10mm"/>
									<span class="styBoldText"> Over</span>
									<span style="width:3mm"/>
									<span class="styBoldText">over</span>
									<span style="width:8mm"/>
									<span class="styBoldText">amount is</span>
								</div>
							</div>
							<div class="styLNAmountBoxNBB" style="height:9mm;border-left-width:0px;width:12.1mm;"/>
							<div class="styLNRightNumBoxNBB" style="height:9mm;border-right-width:0px;background-color:lightgrey;width:8mm;"/>
							<div class="styIRS2441RightSpaceBox" style="height:9mm;border-left-width:1px;"/>
						</div>
						<!--Decimal values-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;width:49px;"/>
							<div class="styLNDesc" style="width:45mm;height:6mm;">
								<div class="styIRS2441TableBox" style="height:7mm;border-left-width:0px;width:45mm;border-top-width: 2px;text-align:left;">
									<span style="width:8.3mm"/>$0 &#8212; 15,000   <span style="width:10mm"/>       .35<br/>
									<span style="width:2.5mm"/>15,000 &#8212; 17,000   <span style="width:10mm"/> .34<br/>
									<span style="width:2.5mm"/>17,000 &#8212; 19,000   <span style="width:10mm"/> .33<br/>
									<span style="width:2.5mm"/>19,000 &#8212; 21,000   <span style="width:10mm"/> .32<br/>
									<span style="width:2.5mm"/>21,000 &#8212; 23,000   <span style="width:10mm"/> .31<br/>
									<span style="width:2.5mm"/>23,000 &#8212; 25,000   <span style="width:10mm"/> .30<br/>
									<span style="width:2.5mm"/>25,000 &#8212; 27,000   <span style="width:10mm"/> .29<br/>
									<span style="width:2.5mm"/>27,000 &#8212; 29,000   <span style="width:10mm"/> .28              
                            </div>
							</div>
							<div class="styLNAmountBoxNBB" style="height:26.0mm;border-left-width:0px;width:5mm;"/>
							<div class="styLNAmountBoxNBB" style="height:26.0mm;border-left-width:1px;width:5mm;"/>
							<div class="styLNDesc" style="width:45mm;">
								<div class="styIRS2441TableBox" style="height:7mm;border-left-width:0px;width:45mm;border-top-width: 2px;text-align:left;">
									<span style="width:.7mm"/>$29,000 &#8212; 31,000   <span style="width:10mm"/> .27<br/>
									<span style="width:2.5mm"/>31,000 &#8212; 33,000   <span style="width:10mm"/> .26<br/>
									<span style="width:2.5mm"/>33,000 &#8212; 35,000   <span style="width:10mm"/> .25<br/>
									<span style="width:2.5mm"/>35,000 &#8212; 37,000   <span style="width:10mm"/> .24 <br/>
									<span style="width:2.5mm"/>37,000 &#8212; 39,000   <span style="width:10mm"/> .23<br/>
									<span style="width:2.5mm"/>39,000 &#8212; 41,000   <span style="width:10mm"/> .22 <br/>
									<span style="width:2.5mm"/>41,000 &#8212; 43,000   <span style="width:10mm"/> .21<br/>
									<span style="width:2.5mm"/>43,000 &#8212; No limit  <span style="width:10mm"/>.20</div>
							</div>
							<div style="width:72mm;height:24mm;float:right">
								<div class="styLNAmountBoxNBB" style="height:100%;border-left-width:0px;width:16mm;float:left;"/>
								<div style="height:6.3mm;width:56mm;float:right;">
									<div class="styLNRightNumBoxNBB" style="height:6.3mm;border-right-width:0px;background-color:lightgrey;"/>
									<div class="styIRS2441RightSpaceBox" style="height:6.3mm;border-left-width:1px;"/>
								</div>
								<div style="height:9mm;width:56mm;float:right">
									<div class="styLNRightNumBoxNBB" style="height:100%;border-right-width:0px;border-bottom-width:1px;padding-top:5.5mm">  8                  
		                            </div>
									<div class="styLNAmountBox" style="height:100%;border-left-width:1px;width:47.5mm;padding-top:5.5mm;">
										<span style="font-weight:bold;width:1mm;font-size:8pt;"></span>X.
										<span style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form2441Data/CareExpensesDecimalAmt"/>
											</xsl:call-template>
										</span>
									</div>
								</div>
								<div style="height:13mm;float:right;width:56mm;">
									<div class="styLNRightNumBoxNBB" style="height:13mm;border-right-width:0px;background-color:lightgrey;"/>
									<div class="styIRS2441RightSpaceBox" style="height:13mm;border-left-width:1px;"/>
								</div>
							</div>
							<!--Line 9-->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:5mm;padding-top:0mm;font-size:7pt;"><span style="width:1.5mm"/>9
                               </div>
								<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:0mm;">Multiply line 6 by the decimal amount on line 8. If you paid 2019 expenses in 2020, see<br/> the instructions
                             <!--CPYEExplainationStatement-->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form2441Data/CalculatedTentativeExpenseAmt"/>
									</xsl:call-template>
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
								</div>
	                        <div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:4.4mm;border-bottom-width:2px;"><span style="width:1mm"/>9                      
                            </div>
								<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:48mm;padding-top:4.8mm;border-bottom-width:2px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form2441Data/CalculatedTentativeExpenseAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--Line 10-->
							<div style="width:187mm;">
								<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">10
                                </div>
								<div class="styLNDesc" style="width:123mm;height:4mm;">Tax liability limit. Enter the amount from the Credit Limit 
       		                    </div>
								<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
								<div class="styLNAmountBoxNBB" style="height:4mm;border-left-width:1px;width:48mm;"/>
							</div>
							<div class="styLNDesc" style="width:91mm;height:4mm;">
								<span style="width:8mm"/>Worksheet in the instructions
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;padding-top:1mm;">10                    
                            </div>
							<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;width:32mm;padding-top:1.2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/TaxLiabLmtFromCrLmtWrkshtAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
							<div class="styIRS2441RightSpaceBox" style="height:4.5mm;border-left-width:1px;"/>
						</div>
						<!--line 11-->
						<div style="width:187mm;height:9mm;">
							<div class="styLNLeftNumBox" style="height:5mm;padding-top:1.5mm;">11
					        </div>
							<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1.5mm;">
								<span class="styBoldText">Credit for child and dependent care expenses.</span> Enter the <b> smaller </b>of line 9 or line 10 here and on Schedule 3 (Form 1040), line 2
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
			                <div class="styLNRightNumBox" style="height:9mm;border-right-width:0px;border-bottom-width:0px;padding-top:4mm;">11                     
                            </div>
						    <div class="styLNAmountBox" style="height:9mm;border-left-width:1px;border-bottom-width:0px;width:48mm;padding-top:6.0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form2441Data/CreditForChildAndDepdCareAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Begin Footer-->
					<div class="pageEnd" style="width:187mm;border-top:0.4mm solid black;clear:all;">
						<div class="stySmallText" style="width:110mm;"><span class="styBoldText">
							For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						</div>
                        <div class="stySmallText" style="width:40mm;">Cat. No. 11862M
                        </div>
					<div class="stySmallText" style="width:36mm;text-align:right;">Form <span class="styBoldText">2441</span> (2020)
                   </div>
					</div>
					<!--End Footer-->
					<!-- Page Header -->
					<div style="width:187mm;padding-top:0.5mm;">
						<div style="float:left;">Form 2441 (2020)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;border-top-width:2px;">
							<span class="styPartName" style="width:17mm;font-size:13;height:3.5mm;">Part lll</span>
						<div class="styPartDesc" style="padding-left:1mm;width:163mm;font-size:8pt;height:3.5mm;">Dependent Care Benefits</div>
					</div>
					<!--End Part IIITitle-->
					<!--line 12-->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">12
                   </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">
						Enter the total amount of <span class="styBoldText">dependent care benefits</span>  
						you received in 2020. Amounts you<br/> received as an employee should be shown in box 10 of your Form(s) W-2. 
						<span class="styBoldText">Don't </span> include <br/>amounts reported as wages in box 1 of Form(s) W-2. 
		             	If you were self-employed or a partner, <br/> include amounts you received under a dependent care assistance program from your sole<br/>
						 proprietorship or partnership
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8mm;border-right-width:0px;background-color:lightgrey;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:8mm;border-left-width:1px;"/>
						<div class="styIRS2441RightSpaceBox" style="width:131mm;height:6mm;border-left-width:0px;border-top-width:0px;"/>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:4.5mm;">12                    
                            </div>
						<div class="styLNAmountBox" style="float:right;height:8mm;border-left-width:1px;width:48mm;padding-top:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/DependentCareBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 13-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;font-size:7pt;">13
                      </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;">Enter the amount, if any, you carried over from 2019 and used in 2020 during the grace<br/> period. See instructions
								<!--Dotted Line -->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
                        <div class="styLNRightNumBox" style="height:8.5mm;border-right-width:0px;padding-top:5.4mm;">13                    
                        </div>
						<div class="styLNAmountBox" style="height:8.5mm;border-left-width:1px;width:48mm;padding-top:5.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/CarryoverAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 14-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;font-size:7pt;">14
                     </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;">Enter the amount, if any, you forfeited or carried forward to 2021. See instructions
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
	                    <div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1.6mm;">14                    
                        </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:1.6mm;">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/ForfeitedAmt"/>
							</xsl:call-template>)
						</div>
					</div>
					<!--line 15-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;">15
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;">Combine lines 12 through 14. See instructions
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1.8mm;">15                     
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:1.8mm">
							<xsl:call-template name="PopulateAmount">
				            	<xsl:with-param name="TargetNode" select="$Form2441Data/AdjustedDepdCareBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 16-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;font-size:7pt;">16
                        </div>
						<div class="styLNDesc" style="width:123mm;height:4mm;">Enter the total amount of <span class="styBoldText">qualified expenses   </span> incurred
       		            </div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;border-left-width:1px;width:48mm;"/>
						<div class="styLNDesc" style="width:91mm;height:4mm;">
							<span style="width:8mm"/>in 2020 for the care of the <span class="styBoldText">qualifying person(s)</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;padding-top:1mm;">16                   
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/QualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
					</div>
					<!--line 17-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">17
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;">Enter the <span class="styBoldText">smaller </span> of line 15 or 16
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;padding-top:1mm;">17                  
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SmallerOfAdjOrQualifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
					</div>
					<!--line 18-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">18
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;">Enter your <span class="styBoldText">earned income. </span><span style="width:2px"/>See instructions
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;padding-top:1.2mm;">18                  
                        </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/EarnedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;"/>
					</div>
					<!--line 19-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">19 </div>
						<div class="styLNDesc" style="width:60mm;height:4mm;">Enter the amount shown below that applies<br/> to you.
                        <br/><br/>
							<span style="text-align:left;">
								<img src="{$ImagePath}/2441_Bullet_Round.gif" alt="MediumBullet"/> 
   If married filing jointly, enter your<br/>
								<span style="width:2mm"/>spouse's earned income (if you or your<br/>
								<span style="width:2mm"/>spouse was a student or was disabled,<br/>
								<span style="width:2mm"/>see the instructions for line 5).
							</span><br/>
							<span style="text-align:left;">
								<img src="{$ImagePath}/2441_Bullet_Round.gif" alt="MediumBullet"/> 
  If married filing separately, see<br/>
								<span style="width:2mm"/>instructions.
							</span><br/>
							<span style="text-align:left;">
								<img src="{$ImagePath}/2441_Bullet_Round.gif" alt="MediumBullet"/> 
							    All others, enter the amount from line 18.
							</span>
						</div>
						<div class="styLNDesc" style="width:5mm;height:12mm;">
							<div class="styLNRightNumBoxNBB" style="height:8mm;border-left-width: 0px; "/>
							<!-- <span style="text-align:left;">
								<img align="bottom" src="{$ImagePath}/2441_Bracket.gif" alt=""/>
							</span>  -->
							
							<div style="width:44mm;">
							<span style="float:left;">
								<img alt="Curly brace" src="{$ImagePath}/CurlyBrace1.77x18.11mm.png" height="88" width="8"/>
							</span>
							<span class="styBoldText" style="padding-top:9mm;"><span style="width:1mm"></span><span style="width:7mm">.</span><span style="width:7mm">.</span><span style="width:7mm">.</span></span>
							</div>							
                           
						</div>
					
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-left-width: 0px;width:15mm; "/>
						<div class="styIRS2441RightSpaceBox" style="width:3mm;height:6mm;border-left-width:0px;border-top-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:16mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:16mm;width:32mm;border-right-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:16mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:16mm;width:48mm;border-right-width:0px;"/>
						<div class="styLNDesc" style="width:15mm;height:5mm;">
							
						</div>
					
						<div class="styIRS2441RightSpaceBox" style="width:76mm;height:6mm;border-left-width:0px;border-top-width:0px;"/>
						<div class="styLNRightNumBox" style="height:7.5mm;border-right-width:0px;padding-top:4mm;">19</div>
						<div class="styLNAmountBox" style="height:7.5mm;border-left-width:1px;width:32mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SpouseIncomeAmt"/>
							</xsl:call-template>
						</div>
						
					<div class="styLNRightNumBoxNBB" style="height:7.5mm;border-left-width: 1px; border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:7.5mm;width:48mm;border-right-width:0px;"/>
						<div class="styIRS2441SpaceBox" style="height:4mm;border-left-width:0px;border-bottom-width:0px;width:15mm;"/><div class="styIRS2441RightSpaceBox" style="width:76mm;height:6mm;border-left-width:0px;border-top-width:0px;"/>
					<div class="styLNRightNumBoxNBB" style="height:8.5mm;border-left-width: 1px; border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:8.5mm;width:32mm;border-right-width:0px;"/>
						<div class="styLNRightNumBoxNBB" style="height:8.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:8.5mm;width:48mm;border-right-width:0px;"/>
					</div>
					<!--line 20-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">20
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;">Enter the <span class="styBoldText">smallest</span> of line 17, 18, or 19
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:0px;padding-top:1mm;">20                  
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:1px;width:32mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/TentativeExclusionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;width:48mm;border-right-width:0px;"/>						
					</div>
					<!--line 21-->
					<div style="width:187mm;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="padding-top:0mm;height:8mm;">21
                            </div>
		<div class="styLNDesc" style="width:83mm;padding-top:0mm;height:8mm;">Enter $5,000 ($2,500 if married filing separately <b>and</b> <br/>you were required to enter your spouse&#8221;s earned <br/>income on line 19)
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.0mm;border-right-width:0px;background-color:lightgrey;border-bottom-width:0px;">                  
                            </div>
                            <div class="styLNAmountBox" style="height:4.0mm;border-left-width:1px;width:32mm;border-bottom-width:0px;">
						</div>
							<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4mm;width:48mm;border-right-width:0px;"/>
						<div class="styLNRightNumBox" style="height:5.5mm;border-right-width:0px;padding-top:2mm;">21                  
                            </div>
						<div class="styLNAmountBox" style="height:5.5mm;border-left-width:1px;width:32mm;padding-top:2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SpecifiedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:6mm;width:48mm;border-right-width:0px;"/>
					</div>
					<!--line 22-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">
							22
					    </div>					    
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">
							Is any amount on line 12 from your sole proprietorship or <br/>partnership?
							<span class="styBoldText"></span>
						</div>						
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;border-top-width:1px;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						<div class="styLNRightNumBoxNBB" style="height:4mm;border-right-width:0px;background-color:lightgrey;border-top-width:1px;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4mm;border-left-width:1px;"/>
						
						<div class="styLNDesc" style="width:131mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Form1040AFiledInd"/>
								</xsl:call-template>
								 <input type="checkbox" alt="Form1040AFiledIndNo" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2441Data/Form1040AFiledInd"/>
										<xsl:with-param name="BackupName">Form2441DataFiled1040ANoInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form2441Data/Form1040AFiledInd"/>
										<xsl:with-param name="BackupName">Form2441DataFiled1040ANoInd</xsl:with-param>
									</xsl:call-template>
									<span style="width:1px;"/>
									<b>No.</b>
								</label> Enter -0-.
							</span>
                        </div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;border-right-width:0px;background-color:lightgrey;border-top-width:1px;border-top-width:0px;"/>
						<div class="styIRS2441RightSpaceBox" style="height:6mm;border-left-width:1px;"/>
						<div class="styLNDesc" style="width:131mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Form1040AFiledInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Form1040AFiledIndYes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$Form2441Data/Form1040AFiledInd"/>
										<xsl:with-param name="BackupName">Form2441DataFiled1040AYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$Form2441Data/Form1040AFiledInd"/>
									<xsl:with-param name="BackupName">Form2441DataFiled1040AYesInd</xsl:with-param>
								</xsl:call-template>
								<b>Yes.</b>
							</label>   Enter the amount here
							</span>
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
                               </div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:0px;padding-top:1.8mm;">22</div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:1px;width:48mm;padding-top:1.8mm;border-bottom-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SolePropshpPrtshpAmt"/>
							</xsl:call-template>
						</div>
						</div>
					<!--line 23-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;">23
                        </div>
						<div class="styLNDesc" style="width:83mm;height:4mm;font-size:7pt;">Subtract line 22 from line 15
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;padding-top:1mm;">23               
                            </div>
						<div class="styLNAmountBox" style="height:4.5mm;border-left-width:0px;width:32mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/PropshpPrtshpLessAdjBnftAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:4.5mm;width:48mm;border-right-width:0px;"/>
					</div>
					<!--line 24-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">24
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;"><b>Deductible benefits.</b> Enter the <b>smallest</b> of line 20, 21, or 22. Also, include this amount on the appropriate line(s) of your return. See instructions
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:0px;padding-top:5mm;">24                    
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:1px;width:48mm;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/DeductibleBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 25-->
					<div style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-top:1mm;">25
                            </div>
						<div class="styLNDesc" style="width:123mm;height:8mm;padding-top:1mm;font-size:7pt;">
						<b>Excluded benefits.</b> If you checked "No" on line 22, enter the smaller of line 20 or 21. Otherwise, subtract line 24 from the smaller of line 20 or line 21. If zero or less, enter -0-.
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:10.5mm;border-right-width:0px;padding-top:5mm;border-bottom-width:2px;">25                     
                            </div>
						<div class="styLNAmountBox" style="height:10.5mm;border-left-width:1px;width:48mm;padding-top:7.5mm;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/ExcludedBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 26 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm; padding-top:1.5mm;">26
                         </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;padding-top: 1.5mm;">
							<b>Taxable benefits.</b> Subtract line 25 from line 23. If zero or less, enter -0-. Also, include this amount on Form 1040 or 1040-SR, line 1; or Form 1040-NR, line 1a. On the dotted line next to Form 1040 or 1040-SR, line 1; or Form 1040-NR, line 1a, enter &#8220;DCB.&#8221;
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:5mm;padding-top:.3mm;border-right-width:0px;background-color:lightgrey;"/>
						<div class="styIRS2441RightSpaceBox" style="height:5mm;width:48mm;border-right-width:0px;"/>						
						<div class="styIRS2441RightSpaceBox" style="width:131mm;height:6mm;border-left-width:0px;border-top-width:0px;"/>
						<div class="styLNRightNumBox" style="height:7mm;border-right-width:0px;border-bottom-width:0px;padding-top:4mm;">26                     
                            </div>
						<div class="styLNAmountBox" style="float:right;height:7mm;border-left-width:1px;width:48mm;border-bottom-width:0px;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/TaxableBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Instructions on Child and dependent care-->
					<div class="styBB" style="width:187mm;border-top-width: 2px;height: 15mm;">
						<div class="styPartDesc" style="text-align:center;padding-top:2.5mm;font-weight: normal;font-size:9pt;">To claim the child and dependent care <br/> credit, complete lines 27 through 31 below.
                        </div>
					</div>
					<!--line 27-->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">27
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">
							Enter $3,000 ($6,000 if two or more qualifying persons)
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:1px;padding-top:1.6mm;border-bottom-width:2px;">27                   
                            </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:0px;width:48mm;padding-top:1.8mm;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/AllowedCaredForAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 28 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">28
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;"> Add lines 24 and 25
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;border-right-width:1px;padding-top:1.6mm;border-bottom-width:2px;">28                     
                        </div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:0px;width:48mm;padding-top:1.8mm;border-bottom-width:2px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SumOfDedAndExcludedBenefitsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;">29
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;font-size:7pt;">Subtract line 28 from line 27. If zero or less, <b>stop.</b> 
						You can't take the credit. <br/><b>Exception.</b> If you paid 2019 expenses in 2020, see the instructions for line 9
							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
						</div>
	             	<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;padding-top:5mm;">29                    
                     </div>
	    	        <div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:48mm;padding-top:5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/NetAllowableAmt"/>
							</xsl:call-template>
				    </div>
					</div>
					<!--line 30-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">30
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;">Complete line 2 on the front of this form. <b> Don't </b>include in column (c) any benefits shown on line 28 above. Then, add the amounts in column (c) and enter the total here
  							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;padding-top:4.9mm;">30                    
                            </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;width:48mm;padding-top:4.9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/TotalQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--line 31-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;border-bottom-width:0px;">31
                            </div>
						<div class="styLNDesc" style="width:123mm;height:5mm;padding-top:1mm;font-size:7pt;border-bottom-width:0px;">Enter the <b>smaller </b>of line 29 or 30. Also, enter this amount on line 3 on the front of this form and complete lines 4 through 11
  							<!--Dotted Line -->
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
			  	        <div class="styLNRightNumBox" style="height:8mm;border-right-width:1px;border-bottom-width:0px;padding-top:4.8mm;">31                    
                        </div>
						<div class="styLNAmountBox" style="height:8mm;border-left-width:0px;border-bottom-width:0px;width:48mm;padding-top:3.5mm;padding-top:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form2441Data/SmallerOfTotalQlfyExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
						<!--Page Footer-->
					<div class="pageEnd" style="width:187mm; border-top:0.5mm solid black;">
						<div style="float:right;">
							<span style="width:80px;"/>  
                             Form <span class="styBoldText">2441</span> (2020)
                    </div>
					</div>
					<!--END Page Footer-->
						 <p style="page-break-before: always"/>
						 <br/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
                             Additional Data        
                         </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
	
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form2441Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Additional Data Left Over Table -->
					<!--Separated Data  Part I Care Provider Table -->
					<div class="styTableContainer" id="CareProviderGrp"  style="border-bottom:0px;">
					<xsl:if test="($Print = $Separated) and (count($Form2441Data/CareProviderGrp) &gt; 2)">
						<br/>
						<span class="styRepeatingDataTitle">Form 2441 - Part I - Care Provider Table, Line 1:</span>
						<br/>
						<table class="styDepTbl" style="font-size:7pt;" cellspacing="0" summary="Table displaying Care Provider information" name="CPtable" id="CPtable" >
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" colspan="1" style="width:50mm;font-weight:normal;text-align: left;">
										<span style="width:7mm;"/>
										<span style="padding-left:7mm;"> <span style="font-weight:bold;">(a)</span>
                                                        Care provider's</span> <br/>
										<span style="width:10mm;"/> <span style="padding-left:13mm;">
										name</span>
                                                           </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:80mm;font-weight:normal;">
										<span style="font-weight:bold;">(b)</span><span style="width:1mm;"/>
										Address<br/>(number, street, apt. no., city, state, and ZIP code)
                                                                </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(c)</span> Identifying number<br/> (SSN or EIN)
                                                                </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:30mm;font-weight:normal;">
										<span style="font-weight:bold;">(d)</span> Amount paid<br/>(see instructions)
                                                             </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form2441Data/CareProviderGrp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
										</xsl:attribute>
										<!--position 1-->
										<td class="styDepTblCell" style="width:80mm;text-align:left;vertical-align:top">
											<xsl:choose>
											<xsl:when test="CareProviderPersonName">
											<!--CareProviderPersonName-->											
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonFirstNm"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderPersonName/PersonLastNm"/>
												</xsl:call-template>
												<br/>											
											<!--CareProviderNameControl-->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderNameControlTxt"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
											<!--CareProviderBusinessName-->										
												
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											
												<br/>
												
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CareProviderBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
												<br/>	
											<!--CareProviderBusNameCtrl-->
													
												<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CareProviderBusNameControlTxt"/>
												</xsl:call-template>
												
											</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styDepTblCell" style="width:80mm;text-align:left;vertical-align:top">
												<!--USAAddress-->
												<xsl:if test="USAddress">													
														 <xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>  
													</xsl:if>
												<!--ForiegnAddress-->
												<xsl:if test="ForeignAddress">	
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
											                <br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
														</xsl:call-template>													
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>									
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
														</xsl:call-template>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
														</xsl:if>
											<!--SeeW2Cd-->
														<xsl:if test="$Form2441Data/CareProviderGrp/SeeW2Cd !=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="SeeW2Cd"/>
															</xsl:call-template>
														</xsl:if>
										 </td>
										<td class="styDepTblCell" style="width:27mm; text-align:center">  
											<!--SSN number-->
											<xsl:if test="$Form2441Data/CareProviderGrp/SSN !=''">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="SSN"/>
												</xsl:call-template>
											</xsl:if>
											<!--EIN number-->
											<xsl:if test="$Form2441Data/CareProviderGrp/EIN !=''">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</xsl:if>
											<!--Tax Exempt-->
											<xsl:if test="$Form2441Data/CareProviderGrp/TaxExemptCd !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxExemptCd"/>
												</xsl:call-template>
											</xsl:if>
											<!--Living Abroad Foreign Care Providers-->
											<xsl:if test="$Form2441Data/CareProviderGrp/LivingAbroadFrgnCareProviderCd !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LivingAbroadFrgnCareProviderCd"/>
													</xsl:call-template>
											</xsl:if><br/>
											<!--Due Diligence Code-->
													<xsl:if test="$Form2441Data/CareProviderGrp/DueDiligenceCd !=''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DueDiligenceCd"/>
															</xsl:call-template>
													</xsl:if><br/>
										</td>
										<td class="styDepTblCell" style="width:30mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PaidAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					</div>
					<!-- END Separated Data for Part I -->
					<!-- Separated Data for Part II Qualifying Peron Table -->
					<xsl:if test="($Print = $Separated) and (count($Form2441Data/QualifyingPersonGrp) &gt; 2)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 2441 - Part II - Qualifying Person Table, Line 2:</span>
						<br/>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;" summary="Table displaying Qualifying persons information" name="Qualtable" id="Qualtable">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" >
									<th class="styDepTblCell" scope="col" colspan="2" style="width:88mm;font-weight:normal;;vertical-align:top;">									
										<span style="font-weight:bold;"></span>
      <span style="height:3mm;padding-top:3mm">
							(a) Qualifying person's name
      <br/> First<span style="width:40mm"/>Last
   	</span>
                                   </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:49mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;"></span>   <span style="height:3mm;padding-bottom:5mm">(b) Qualifying person's social security number  	</span>
                                 </th>
									<th class="styDepTblCell" scope="col" colspan="1" style="width:49mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;"></span>  <span style="height:3mm;padding-bottom:5mm">(c) Qualified expenses you<br/> incurred and paid in 2018 for the person listed in column (a)  	</span>
                                </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form2441Data/QualifyingPersonGrp">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class">
										<xsl:choose>
										<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
										<xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="width:44mm;text-align:left;">
											<span style="width:0mm;">
												<xsl:if test="position()=1">
													<span class="styBoldText"/>
												</xsl:if>
											</span>
											<!--Person Name-->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonFirstNm"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styDepTblCell" style="width:44mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QualifyingPersonName/PersonLastNm"/>
											</xsl:call-template>
											<span style="width:1px;"/>
											<!--QualifyingPersonLiteralCd-->													
											           <span style="width:5mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="QualifyingPersonNameControlTxt"/>
														</xsl:call-template>												
										</td>
										<!--Person SSN-->
										<td class="styDepTblCell" style="width:49mm;text-align:center;">
											<xsl:if test="$Form2441Data/QualifyingPersonGrp/QualifyingPersonSSN">
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="QualifyingPersonSSN"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
											<!--QualifyingPersonLiteralCd-->
											<xsl:if test="$Form2441Data/QualifyingPersonGrp/DiedLiteralCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</xsl:if>
										</td>
										<td class="styDepTblCell" style="width:49mm;text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="QualifiedCareExpensesPaidAmt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- END Separated Data for Part II-->
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="CreateTableUSAAddress">
	<xsl:param name="Start"/>
	<xsl:param name="Stop"/>
	<xsl:param name="TargetNode"/>
		<xsl:if test="($TargetNode[position()=$Start] !='') ">
		<xsl:if test="$Start &lt; $Stop">
		<td class="styTableCellText " style="width:70mm;text-align:top;">	 	   	
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
			</xsl:call-template>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
			</xsl:call-template>
				<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$TargetNode[position()=$Start]"/>
			</xsl:call-template>     
			</td>			
			<xsl:call-template name="CreateTableUSAAddress">
			<xsl:with-param name="Start" select="$Start + 1"/>
			<xsl:with-param name="Stop" select="$Stop"/>
			<xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
		</xsl:if>
		</xsl:if>
</xsl:template>
	<xsl:template name="AddPositionNumber">
  <xsl:if test="position()=1">1</xsl:if>
  <xsl:if test="position()=2">2</xsl:if> 
    <xsl:if test="position()=3">3</xsl:if>  
</xsl:template>
</xsl:stylesheet>