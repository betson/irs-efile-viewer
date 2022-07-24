<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 01/06/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8863Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8863Data" select="$RtnDoc/IRS8863"/>
	<xsl:param name="PartIData" select="$Form8863Data/RefundableAmerOppCreditGroup"/>
	<xsl:param name="PartIIData" select="$Form8863Data/NonrefundableEducationCrGroup"/>
	<xsl:param name="PartIIIData" select="$Form8863Data/StudentAndEducationalInstnGrp"/>
	<xsl:template name="Form8863Page2">
	<xsl:param name="NodeData" select="/.."/>
		<!-- Page Header -->
				 <div style="width:187mm">	
					<div style="width:187mm;padding-top:.5mm;border-bottom:1px solid black;">
						Form 8863 (2020)<span style="width:148mm;"/>						
						Page <span style="font-weight:bold;font-size:8pt;">2</span>						
					</div>					
					<!-- Name(s) shown on return -->
					<div style="width:187mm;border-bottom:1px solid black;">
						<div class="styFNBox" style="width:140mm; height:9mm;">
                            Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<b>Your social security number</b>
						<br/><br/>
						<div style="width:25mm;">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
						</div>
					</div>
					<!-- Part III -->
					<!-- Part III - Header -->			
					<div style="width:187mm; border-bottom:1px solid black;">
						<div class="styGenericDiv" style="width:18mm;padding-top:2mm;padding-bottom:2mm">
							<img alt="Caution" src="{$ImagePath}/8863_Caution.gif" width="50" height="50"/>
						</div>
						<div class="styGenericDiv" style="width:169mm;padding-top:2mm;font-size:8pt;font-weight:bold">
							<i>Complete Part III for each student for whom you're claiming either the American
							opportunity credit or lifetime learning credit. Use additional copies of Page 2 as needed for
							each student.</i>
		                </div>
					</div>
					<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;height:auto;">Part III</span>
						<span style="width:172mm;font-weight:normal;font-size:8pt;height:auto;" class="styPartDesc">
							<span style="font-size:12.5;">
								<b>Student and Educational Institution Information </b>
							</span>
							See instructions. 
						</span>
					</div>					
						<table cellspacing="0" style="width:187mm;clear:all;">
							<tbody>
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="padding-top:0mm;">20</div>
										Student name (as shown on page 1 of your tax return)<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="StudentName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:5px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="StudentName/PersonLastNm"/>
										</xsl:call-template>
										<span style="width:5px"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part III Line 20  -  Student <xsl:number value="position()"/> Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="StudentNameControlTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="padding-top:0mm;">21</div>
										Student social security number (as shown on page 1 of your tax return)<br/>
										<span style="padding-left:8.5mm">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="StudentSSN"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr style="height:6mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:55%;border-right-width:0px;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="padding-top:0mm;">22</div>
										Educational institution information (see instructions)
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:center;border-right-width:0px">&#160;</td>
								</tr>
								</tbody>
								</table>
								<xsl:choose>
									<xsl:when test="$NodeData/EducationalInstitutionGroup">
											<xsl:variable name="studentPos" select="position()"/>
											<xsl:for-each select="$NodeData/EducationalInstitutionGroup">
											<xsl:variable name="pos" select="position()"/>
											<xsl:if test="$pos mod 2 = 1">
											<table cellspacing="0" style="width:187mm;">
												<tbody>
											<!-- Lines a and b -->
											<tr style="height:auto" valign="top">
												<td class="styTableCell" style="font-size:7pt;width:93.5mm;border-color:black;text-align:left;word-wrap:break-word;">
													<div class="styLNLeftNumBox" style="padding-left:5mm;height:10mm;padding-top:0mm;">a.</div>
													<div style="width:83mm;">								
														Name of first educational institution <br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="InstitutionName/BusinessNameLine1Txt"/>
														</xsl:call-template><br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="InstitutionName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</div>
												</td>
												<td class="styTableCell" style="font-size:7pt;width:93.5mm;border-color:black;text-align:left;border-right-width:0px;word-wrap:break-word;">
													<div class="styLNLeftNumBox" style="padding-left:5mm;padding-top:0mm;height:10mm">b.</div>
													<div style="width:83mm;">											
														Name of second educational institution (if any)<br/>
														<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionName">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionName/BusinessNameLine1Txt"/>
															</xsl:call-template><br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</div>
												</td>
											</tr>
											<!-- Lines a(1) and b(1) -->
											<tr style="height:13mm" valign="top">
												<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
													<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(1)</div>
															Address. Number and street (or P.O. box). City, town or
															post office, state, and ZIP code. If a foreign address, see
															instructions.<br/>
															<span style="padding-left:7.5mm;">
																<xsl:if test="USAddress">
																	<xsl:call-template name="PopulateUSAddressTemplate">
																		<xsl:with-param name="TargetNode" select="USAddress"/>
																	</xsl:call-template>
																</xsl:if>
																<xsl:if test="ForeignAddress">
																	<xsl:call-template name="PopulateForeignAddressTemplate">
																		<xsl:with-param name="TargetNode" select="ForeignAddress"/>
																	</xsl:call-template>
																</xsl:if>
															</span>
													</td>
												<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
													<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(1)</div>
													Address. Number and street (or P.O. box). City, town or
													post office, state, and ZIP code. If a foreign address, see
													instructions.<br/>
													<span style="padding-left:7.5mm;">										
														<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/InstitutionName">
															<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/USAddress">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/USAddress"/>
																</xsl:call-template>
															</xsl:if>										
															<xsl:if test="$NodeData/EducationalInstitutionGroup[$pos+1]/ForeignAddress">
																<xsl:call-template name="PopulateForeignAddressTemplate">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/ForeignAddress"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:if>
													</span>
												</td>
											</tr>
											<!-- Lines a(2) and b(2) -->
											<tr style="height:8mm" valign="top">
												<td class="styTableCell" style="font-size:7pt;width:92mm;border-color:black;text-align:left;">
													<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(2)</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
													</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm;">
														Did the student receive Form 1098-T
														from this institution for 2020?
													</div>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														</xsl:call-template>
														<div class="styGenericDiv" style="width:11mm; height:8mm;padding-top:3mm; padding-left:0mm;">
															<input type="checkbox" alt="CurrentYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
																Yes
															</label>
														</div>
														<div class="styGenericDiv" style="width:11mm;padding-top:3mm; padding-left:0mm">
															<input type="checkbox" alt="CurrentYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
																<span style="width:1mm;" />No
															</label>
														</div>
													</span>
												</td>
												<td class="styTableCell" style="font-size:7pt;width:94mm;border-color:black;text-align:left;border-right-width:0px;">
													<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(2)</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
													</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
														Did the student receive Form 1098-T
														from this institution for 2020?
													</div>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
														</xsl:call-template>
														<div class="styGenericDiv" style="width:11mm; height:8mm;padding-top:3mm; padding-left:0mm">
															<input type="checkbox" alt="CurrentYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
																Yes
															</label>
														</div>
														<div class="styGenericDiv" style="width:11mm;padding-top:3mm; padding-left:0mm">
															<input type="checkbox" alt="CurrentYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/CurrentYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
																<span style="width:1mm;" />No
															</label>
														</div>
													</span>
												</td>
											</tr>
											<!-- Lines a(3) and b(3) -->
											<tr style="height:10mm" valign="top">
												<td class="styTableCell" style="font-size:7pt;width:92mm;border-color:black;text-align:left;">
													<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(3)</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
													</div>
													<div class="styGenericDiv" style="width:63%;padding-left:0.5mm;">
														Did the student receive Form 1098-T from this institution for 2019 with box 7 checked?
													</div>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														</xsl:call-template>
														<div class="styGenericDiv" style="width:11mm; height:10mm;padding-top:5.5mm; padding-left:0mm;">
															<input type="checkbox"  alt="PriorYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
																Yes
															</label>
														</div>
														<div class="styGenericDiv" style="width:11mm;padding-top:5.5mm;padding-left:0mm;">
															<input type="checkbox"  alt="PriorYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position()"/></xsl:with-param>
																</xsl:call-template>
																<span style="width:1mm;" />No							
																
															</label>
														</div>
													</span>
												</td>
												<td class="styTableCell" style="font-size:7pt;width:94mm;border-color:black;text-align:left;border-right-width:0px">
													<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(3)</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
													</div>
													<div class="styGenericDiv" style="width:63%; padding-left:0.5mm;">
														Did the student receive Form 1098-T from this institution for 2019 with box 7 checked?
													</div>
													<span>
														<xsl:call-template name="PopulateSpan">
															<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
														</xsl:call-template>
														<div class="styGenericDiv" style="width:11mm; height:9mm;padding-top:5.5mm; padding-left:0mm">
															<input type="checkbox"  alt="PriorYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateYesCheckbox">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelYes">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
																Yes
															</label>
														</div>
														<div class="styGenericDiv" style="width:11mm;padding-top:5.5mm; padding-left:0mm">
															<input type="checkbox"  alt="PriorYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
																<xsl:call-template name="PopulateNoCheckbox">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
															</input>
															<label>
																<xsl:call-template name="PopulateLabelNo">
																	<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/PriorYear1098TReceivedInd"/>
																	<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:value-of select="$studentPos"/>-<xsl:number value="position() + 1"/></xsl:with-param>
																</xsl:call-template>
																<span style="width:1mm;" />No
															</label>
														</div>
													</span>
												</td>
											</tr>
											<!-- Lines a(4) and b(4) -->
											<tr style="height:18mm" valign="top">
												<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
													<div class="styLNLeftNumBox" style="height:10mm;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(4)</div>
												   Enter the institution's employer identification number (EIN) if you're claiming the American opportunity credit or if you checked &#8220;Yes&#8221; in <b>(2) or (3)</b>.  You can get the EIN from Form 1098-T or from the institution.<br/>	
													<span style="padding-left:7.5mm;">																								
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
														<xsl:if test="not(EIN)">
															_ _ - _ _ _ _ _ _ _
														</xsl:if>
													</span>	
												</td>
												<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
													<div class="styLNLeftNumBox" style="height:10mm;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(4)</div>
													Enter the institution's employer identification number (EIN) if you're claiming the American opportunity credit or if you checked &#8220;Yes&#8221; in <b>(2) or (3)</b>.  You can get the EIN from Form 1098-T or from the institution.<br/>
													<span style="padding-left:7.5mm;">										
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup[$pos+1]/EIN"/>
														</xsl:call-template>
														<xsl:if test="not($NodeData/EducationalInstitutionGroup[$pos+1]/EIN)">
															_ _ - _ _ _ _ _ _ _
														</xsl:if>
													</span>
												</td>
											</tr>
											</tbody>
											</table>
											</xsl:if>
											</xsl:for-each>
								</xsl:when>
									<xsl:otherwise>
								<table cellspacing="0" style="width:187mm;">
									<tbody>
								<!-- Lines a and b -->
								<tr style="height:auto" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:93.5mm;border-color:black;text-align:left;word-wrap:break-word;">
										<div class="styLNLeftNumBox" style="padding-left:5mm;height:10mm;padding-top:0mm;">a.</div>
										<div style="width:83mm;">								
											Name of first educational institution <br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InstitutionName/BusinessNameLine1Txt"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InstitutionName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:93.5mm;border-color:black;text-align:left;border-right-width:0px;word-wrap:break-word;">
										<div class="styLNLeftNumBox" style="padding-left:5mm;padding-top:0mm;height:10mm">b.</div>
							            <div style="width:83mm;">											
											Name of second educational institution (if any)<br/>
											<xsl:if test="$NodeData/EducationalInstitutionGroup/InstitutionName">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/InstitutionName/BusinessNameLine1Txt"/>
												</xsl:call-template><br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/InstitutionName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</div>
									</td>
								</tr>
								<!-- Lines a(1) and b(1) -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;;padding-top:0mm;">(1)</div>
												Address. Number and street (or P.O. box). City, town or
												post office, state, and ZIP code. If a foreign address, see
												instructions.<br/>
												<span style="padding-left:7.5mm;">
													<xsl:if test="USAddress">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="USAddress"/>
														</xsl:call-template>
													</xsl:if>
													<xsl:if test="ForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="ForeignAddress"/>
														</xsl:call-template>
													</xsl:if>
												</span>
										</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(1)</div>
										Address. Number and street (or P.O. box). City, town or
										post office, state, and ZIP code. If a foreign address, see
										instructions.<br/>
										<span style="padding-left:7.5mm;">										
											<xsl:if test="$NodeData/EducationalInstitutionGroup/InstitutionName">
												<xsl:if test="$NodeData/EducationalInstitutionGroup/USAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/USAddress"/>
													</xsl:call-template>
												</xsl:if>										
												<xsl:if test="$NodeData/EducationalInstitutionGroup/ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/ForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
										</span>
									</td>
								</tr>
								<!-- Lines a(2) and b(2) -->
								<tr style="height:8mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:92mm;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(2)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
										</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm;">
											Did the student receive Form 1098-T
											from this institution for 2020?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:11mm; height:8mm;padding-top:3mm; padding-left:0mm;">
												<input type="checkbox"  alt="CurrentYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:11mm;padding-top:3mm; padding-left:0mm">
												<input type="checkbox"  alt="CurrentYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;" />No
												</label>
											</div>
										</span>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:94mm;border-color:black;text-align:left;border-right-width:0px;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(2)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
										</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
											Did the student receive Form 1098-T
											from this institution for 2020?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/CurrentYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:11mm; height:8mm;padding-top:3mm; padding-left:0mm">
												<input type="checkbox"  alt="CurrentYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:11mm;padding-top:3mm; padding-left:0mm">
												<input type="checkbox"  alt="CurrentYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/CurrentYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863CY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;" />No
												</label>
											</div>
										</span>
									</td>
								</tr>
								<!-- Lines a(3) and b(3) -->
								<tr style="height:10mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:92mm;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(3)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
										</div>
										<div class="styGenericDiv" style="width:63%;padding-left:0.5mm;">
											Did the student receive Form 1098-T from this institution for 2019 with box 7 checked?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:11mm; height:10mm;padding-top:5.5mm; padding-left:0mm;">
												<input type="checkbox"  alt="PriorYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:11mm;padding-top:5.5mm;padding-left:0mm;">
												<input type="checkbox"  alt="PriorYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position()"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;" />No							
													
												</label>
											</div>
										</span>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:94mm;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(3)</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm">
										</div>
										<div class="styGenericDiv" style="width:63%; padding-left:0.5mm;">
											Did the student receive Form 1098-T from this institution for 2019 with box 7 checked?
										</div>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/PriorYear1098TReceivedInd"/>
											</xsl:call-template>
											<div class="styGenericDiv" style="width:11mm; height:9mm;padding-top:5.5mm; padding-left:0mm">
												<input type="checkbox"  alt="PriorYear1098TReceivedInd Yes" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelYes">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													Yes
												</label>
											</div>
											<div class="styGenericDiv" style="width:11mm;padding-top:5.5mm; padding-left:0mm">
												<input type="checkbox"  alt="PriorYear1098TReceivedInd No" class="styCkbox" name="Checkbox">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabelNo">
														<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/PriorYear1098TReceivedInd"/>
														<xsl:with-param name="BackupName">IRS8863PY1098TReceivedInd<xsl:number value="position() + 1"/></xsl:with-param>
													</xsl:call-template>
													<span style="width:1mm;" />No
												</label>
											</div>
										</span>
									</td>
								</tr>
								<!-- Lines a(4) and b(4) -->
								<tr style="height:18mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;">
										<div class="styLNLeftNumBox" style="height:10mm;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(4)</div>
									   Enter the institution's employer identification number (EIN) if you're claiming the American opportunity credit or if you checked &#8220;Yes&#8221; in <b>(2) or (3)</b>.  You can get the EIN from Form 1098-T or from the institution.<br/>	
										<span style="padding-left:7.5mm;">																								
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
											<xsl:if test="not(EIN)">
												_ _ - _ _ _ _ _ _ _
											</xsl:if>
										</span>	
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:10mm;padding-left:3mm;padding-right:1mm;padding-top:0mm;">(4)</div>
										Enter the institution's employer identification number (EIN) if you're claiming the American opportunity credit or if you checked &#8220;Yes&#8221; in <b>(2) or (3)</b>.  You can get the EIN from Form 1098-T or from the institution.<br/>
										<span style="padding-left:7.5mm;">										
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$NodeData/EducationalInstitutionGroup/EIN"/>
											</xsl:call-template>
											<xsl:if test="not($NodeData/EducationalInstitutionGroup/EIN)">
												_ _ - _ _ _ _ _ _ _	
											</xsl:if>
										</span>
									</td>
								</tr>
								</tbody>
								</table>
									</xsl:otherwise>
										</xsl:choose>
								<table cellspacing="0" style="width:187mm;">
								<tbody>
								<!-- Line 23 -->
								<tr style="height:9mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-top:0mm;">23</div>
											Has the Hope Scholarship Credit or American opportunity
											credit been claimed for this student for any 4 tax years before
											2020?
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5mm;height:100%;padding-top:2mm; padding-left:1mm;">
											<input type="checkbox"  alt="PriorYearCreditClaimedInd Yes" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:0.75mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#150; <b>Stop!</b>
											<br/> Go to line 31 for this student.
										</div>
										<div class="styGenericDiv" style="width:5mm;padding-top:2mm; padding-left:1mm;height:100%;">
											<input type="checkbox"  alt="PriorYearCreditClaimedInd No" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:3mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="PriorYearCreditClaimedInd"/>
													<xsl:with-param name="BackupName">IRS8863PYCreditClaimedInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#150; Go to line 24.
										</div>
									</td>
								</tr>
								<!-- Line 24 -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="height:100%;padding-top:0mm;">24</div>
									    <div style="width:80mm;">
											Was the student enrolled at least half-time for at least one academic period that began or is treated as having begun in
2020 at an eligible educational institution in a program leading towards a postsecondary degree, certificate, or other recognized postsecondary educational credential? See instructions.
										</div>
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5mm;height:100%;padding-top:3mm; padding-left:1mm">
											<input type="checkbox"  alt="AcademicPdEligibleStudentInd Yes" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:4mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#150; Go to line 25.
										</div>
										<div class="styGenericDiv" style="width:5mm;padding-top:3mm; padding-left:1mm;height:100%;">
											<input type="checkbox"  alt="AcademicPdEligibleStudentInd No" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:4mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="AcademicPdEligibleStudentInd"/>
													<xsl:with-param name="BackupName">IRS8863AcademicPdEligStudentInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#150; <b>Stop!</b>  Go to line 31 <br/>for this student.
										</div>
									</td>
								</tr>
								<!-- Line 25 -->
								<tr style="height:9mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="padding-top:0mm;">25</div>
											Did the student complete the first 4 years of postsecondary
											education before 2020?  See instructions.
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5mm;height:100%;padding-top:2mm; padding-left:1mm">
											<input type="checkbox"  alt="PostSecondaryEducationInd Yes" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:0.75mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#150; <b>Stop!</b><br/> Go to line 31 for this student.
										</div>
										<div class="styGenericDiv" style="width:5mm;padding-top:2mm; padding-left:1mm;height:100%;">
											<input type="checkbox"  alt="PostSecondaryEducationInd No" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:3mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="PostSecondaryEducationInd"/>
													<xsl:with-param name="BackupName">IRS8863PostSecondaryEducationInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#150; Go to line 26.
										</div>
									</td>
								</tr>
								<!-- Line 26 -->
								<tr style="height:13mm" valign="top">
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<div class="styLNLeftNumBox" style="padding-top:0mm;">26</div>
											Was the student convicted, before the end of 2020, of a
											felony for possession or distribution of a controlled
											substance?
									</td>
									<td class="styTableCell" style="font-size:7pt;width:50%;border-color:black;text-align:left;border-right-width:0px">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
										</xsl:call-template>
										<div class="styGenericDiv" style="width:5mm;height:100%;padding-top:3.5mm; padding-left:1mm">
											<input type="checkbox"  alt="DrugFelonyConvictionInd Yes" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateYesCheckbox">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="width:45%;padding-top:2mm;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												Yes 
											</label>
											&#150; <b>Stop!</b>
											<br/> Go to line 31 for this student.
										</div>
										<div class="styGenericDiv" style="width:5mm;padding-top:3.5mm; padding-left:1mm;height:100%;">
											<input type="checkbox"  alt="DrugFelonyConvictionInd No" class="styCkbox" name="Checkbox">
												<xsl:call-template name="PopulateNoCheckbox">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
										<div class="styGenericDiv" style="padding-top:1.5mm;width:44%;padding-left:1mm;height:100%;">
											<label>
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="DrugFelonyConvictionInd"/>
													<xsl:with-param name="BackupName">IRS8863DrugFelonyConvictionInd<xsl:number value="position()"/></xsl:with-param>
												</xsl:call-template>
												No 
											</label>
											&#150; Complete lines 27 through 30 for this student.
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
					<!-- Tip -->
					<div style="width:187mm;border-bottom:1px solid black;height:50px;">
						<div class="styGenericDiv" style="width:18mm;">
							<img alt="Caution" src="{$ImagePath}/8863_Caution.gif" width="50" height="50"/>
						</div>
						<div class="styGenericDiv" style="width:169mm;padding-top:2mm;font-size:8pt;">
                           You <i><b>can't</b> take the American opportunity credit and the lifetime learning credit for the <b>same student</b> in the
							same year.</i> If you complete lines 27 through 30 for this student, don't complete line 31.
						</div>
					</div>
						<span style="width:172mm;font-weight:normal;font-size:8pt;height:auto;" class="styPartDesc">
							<span style="font-size:12.5;padding-left:5mm;">
								<b>American Opportunity Credit</b>
							</span>
						</span>
					</div>
					<!-- Line 27 -->
					<div style="width:187mm;clear:all;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">27
                    </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                        <span style="float:left;">Adjusted qualified education expenses (see instructions). <b> Don't enter more than $4,000</b></span>
                    <!--Dotted Line-->                        				
						<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>							
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1.2mm;">27</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">28
                    </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                           <span style="float:left;">Subtract $2,000 from line 27. If zero or less enter -0-</span>
                           <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1.2mm;">28</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppQlfyExpnssLessAllwblAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">29
                    </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                            <span style="float:left;">Multiply line 28 by 25% (0.25)</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>	     
						</div>
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1.2mm;">29</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppAllwblExpnssTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;border-bottom:1px solid black">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 2.25mm">30
                    </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
							If line 28 is zero, enter the amount from line 27. Otherwise, add $2,000 to the amount on line 29 and
enter
                           <span style="float:left;">the result. Skip line 31. Include the total of all amounts from all Parts III, line 30, on Part I, line 1</span>
                           <!--Dotted Line-->
                           <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>	
						</div>
						<div class="styLNRightNumBox" style="height:7mm;width:7.1mm;padding-top:4mm;border-bottom-width:0px;">30</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:7mm;padding-top:4mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AmerOppCreditNetCalcExpnssAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;border-style:solid; border-bottom-width:1px;border-top-width:0px;border-right-width:0px;border-left-width:0px;float:left;">
						<span style="width:172mm;font-weight:normal;font-size:8pt;height:auto;" class="styPartDesc">
							<span style="font-size:12.5;padding-left:4.5mm;">
								<b>Lifetime Learning Credit</b>
							</span>
							<span style="width:9px"/>
						</span>
					</div>
					<!-- Line 31 -->
					<div style="width:187mm;border-bottom:1px solid black;clear:all;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">31
                    </div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                            <span style="float:left;">Adjusted qualified education expenses (see instructions). Include the total of all amounts from all</span>
                            <span style="float:left;white-space:nowrap;"> Parts III, line 31, on Part II, line 10</span>
                            <!--Dotted Line-->
                           <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>	
						</div>
						<div class="styLNRightNumBox" style="height:8mm;width:7.1mm;padding-top:4mm;border-bottom-width:0px">31</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="LifetimeQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;padding-top:0mm;border-top-width:1px;">
						<div style="width:100%;text-align:right">
							Form <span class="styBoldText" style="font-size:8pt;">8863</span> (2020) 
						</div>
					</div>
					</div>
	</xsl:template>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8863Data)"/>
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
				<meta name="Description" content="IRS Form 8863"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				   <!-- Updated 5/22/2014 Per UWR101046 for R9.5 D2-->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8863Style"/>
						<xsl:call-template name="AddOnStyle"/>
				    </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8863">	
				  <div style="width:187mm">

									
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;height:23.5mm;">
						<div class="styFNBox" style="width:31mm;height:100%;">
                           Form 
                            <span class="styFormNumber">8863</span>
							<br/>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service (99)</span>
						</div>
						<div class="styFTBox" style="width:125mm;height:100%;">
							<div class="styMainTitle" style="height:auto;padding-top:2mm;">Education Credits
								<span style="font-weight:bold">(American Opportunity and Lifetime Learning Credits)</span>
							</div>
							<div class="styFBT" stype="font-size:7pt;height:auto;padding-top:0mm;">
							    <img src="{$ImagePath}/8863_Bullet.gif" alt="Right Arrow"/> Attach to Form 1040 or 1040-SR.<br/>
								<img src="{$ImagePath}/8863_Bullet.gif" alt="Right Arrow"/> Go to <i>www.irs.gov/Form8863</i> for instructions and the latest information.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm; height:100%">
							<div style="border-bottom:1px solid black;height:4mm;width:100%;padding-bottom:0.5mm;padding-top:0.5mm;">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="font-size:21pt;padding-top:1.5mm;padding-bottom:1.5mm;">20<span class="styTYColor" style="font-size:21pt">20</span>
							</div>
							<div class="stySequence">Attachment<br/>Sequence No. <b style="font-size:8pt">50</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:9mm;">
                            Name(s) shown on return<br/><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<br/>
						</div>
						<b>Your social security number</b>
						<br/><br/>
						<div style="width:25mm;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div class="styBB" style="width:187mm;">
						<div class="styGenericDiv" style="width:18mm;padding-top:2mm;padding-bottom:2mm">
							<img alt="Caution" src="{$ImagePath}/8863_Caution.gif" width="50" height="50"/>
						</div>
						<div class="styGenericDiv" style="width:169mm;padding-top:4mm;font-size:8pt;font-style:italic">
							Complete a separate Part III on page 2 for each student for whom you're claiming either
							credit before you complete Parts I and II.
		                </div>
					</div>
					<div class="styBB" style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:0px;      border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;height:auto;">Part I</span>
						<span style="width:170mm;font-weight:normal;height:auto;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;vertical-align:bottom;"/>
							<b>Refundable American Opportunity Credit</b>
						</span>
					</div>
					<!--Line 1-->
					<div style="width:187mm;clear:all;">
					  <span style="float:left;">
						<div class="styLNLeftNumBoxSD" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 4.25mm">1
                        </div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:1mm;">
						   <span style="float:left;"> After completing Part III for each student, enter the total of all amounts from all Parts III, line 30</span>
						   <!--Dotted Line-->
						   <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:5mm;width:7.1mm; text-align:center; padding-top:1.2mm;">1</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1.2mm;">
							<xsl:if test="$Form8863Data/RefundableAmerOppCreditGroup">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$PartIData/TentativeAmerOppCreditAmt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						</span>
					</div>
					<!--Line 2-->
					<div style="width:187mm;">
						<span style="float:left">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 4.25mm">2</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
                            Enter: $180,000 if married filing jointly; $90,000 if single, head of 
                            <span style="float:left;">household, or qualifying widow(er)</span>
	                        <!--Dotted Line -->
						    <span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:4.2mm; width:7.1mm; text-align:center; ">2</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4.2mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/EnterSpecifiedAmountForFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--Line 3-->
					<div style="width:187mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 4.25mm">3</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
                            Enter the amount from Form 1040 or 1040-SR, line 11. If you're
		                    filing Form 2555 or 4563, or you're excluding income from Puerto Rico, see Pub. 970 for the amount
		                    <span style="float:left;"> to enter</span>
	                        <!--Dotted Line -->
						     <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:11mm;padding-top:7mm; width:7.1mm; text-align:center; ">3</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:11mm;"/>
						</span>
					</div>
					<!--Line 4-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 4.25mm">4</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
			                 Subtract line 3 from line 2. If zero or less, <b>stop;</b> you can't take any<br/>
			                <span style="float:left;">education credit</span>
	                        <!--Dotted Line -->
						    <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:4.2mm; width:7.1mm; text-align:center; ">4</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4.2mm; font-size:7pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/SubtractAGIFromAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
						<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--Line 5-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 4.25mm">5</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;padding-top:1mm;">
                            Enter: $20,000 if married filing jointly; $10,000 if single, head of household,<br/>
                            <span style="float:left;">or qualifying widow(er)</span>
                            <!--Dotted Line -->
						    <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:4.2mm; width:7.1mm; text-align:center; ">5</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4.2mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/SpecifiedAmtPerFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
						 <div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--LINE 6 -->
					<div class="styGenericDiv " style="width:187mm;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-left: 4.25mm">6</div>
						<div class="styLNDesc" style="width:142mm;"> If line 4 is:</div>
                    </span>
                    <span style="float:right;">
						<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
						<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm"/>
						</span>
						<br/>
						<div class="styGenericDiv " style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:6mm;"/>
							<div class="styLNDesc" style="width:453px;height:8mm;padding-left: 2.25mm;">
							<span style="float:left;"><img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                               Equal to or more than line 5, enter 1.000 on line 6</span>
                               <!--Dotted Line -->
						       <span class="styDotLn" style="float:right;padding-left:.5mm;padding-right:.5mm;">......</span>
							   <br/>
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                                Less than line 5, divide line 4 by line 5. Enter the result as a decimal (rounded to 
                               <span style="float:left;"><span style="width:2mm;"/>at least three places)</span>
                               <!--Dotted Line -->
						       <span class="styDotLn" style="float:right;padding-left:1.5mm;padding-right:.5mm;">...........</span>
							</div>
							<div class="styLNDesc" style="width:10px;height:8mm;">
								<img src="{$ImagePath}/8863_Bracket.gif" height="37mm" alt="bracket image"/>
							</div>
							<div class="styLNDesc" style="width:81px;height:8mm;padding-top:3mm;">
                               <!--Dotted Line -->
						       <span class="styDotLn">.....</span>
							</div>
							</span>
	<!--						<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:6mm;padding-left:0px;">6</div>
								<div class="styLNAmountBox" style="width: 29.8mm;height:6mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$PartIData/CalcTentativeEducationRt"/>
									</xsl:call-template>
								</div>
								<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:6mm;"/>
								<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:6mm;"/>
							</span>-->
							<span style="float:right;width:36.9mm;">
								<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
								<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm;"/>
								<div class="styLNRightNumBox" style="font-size:7pt;height:6mm;padding-top:2.2mm; width:7.1mm; text-align:center; ">6</div>
								<div class="styLNAmountBox" style="width:29.8mm;height:6mm;padding-top:2.2mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$PartIData/CalcTentativeEducationRt"/>
									</xsl:call-template>
								</div>
						</span>
						</div>
					</div>
					<!-- END LINE 6 -->
					<!--Line 7-->
					<div style="width:187mm;clear:all;">
					<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 4.25mm">7</div>
						<div class="styLNDesc" style="font-size:7pt;width:137mm;height:4mm;padding-top:1mm;">
							Multiply line 1 by line 6. 

									<b>Caution:</b> If you were under age 24 at the end of the year <b>and</b> meet<br/>
									the conditions described in the instructions, you <b>can't</b> take the refundable American opportunity<br/>
									<span style="float:left;">credit; skip line 8, enter the amount from line 7 on line 9, and check this box	</span>
									<!--Dotted Line -->
									<span class="styDotLn" style="padding-left:1mm;padding-right:1mm;">........</span>	
									<img src="{$ImagePath}/8863_Bullet.gif" alt="Right Arrow"/>				 						        					

							
						</div>
						<div class="styLNDesc" style="font-size:7pt;width:5mm;height:11mm;padding-top:7mm;">
							<input type="checkbox"  alt="Refundable American Opportunity Credit Indicator" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$PartIData/RefundableAmerOppCrUnder24Ind"/>
									<xsl:with-param name="BackupName">PartIDataRefundableAmerOppCrUnder24Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$PartIData/RefundableAmerOppCrUnder24Ind"/>
									<xsl:with-param name="BackupName">PartIDataRefundableAmerOppCrUnder24Ind</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						</span>
						<span style="width:36.9mm;float:right;">				
							<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm;"/>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm;"/>
							<div class="styLNRightNumBox" style="font-size:7pt;height:6mm;padding-top:2mm; width:7.1mm; text-align:center; ">7</div>
							<div class="styLNAmountBox" style="width:29.8mm;height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$PartIData/CalcTentativeEducationCrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 8-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:0mm;padding-left: 4.25mm">8</div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:4mm;padding-top:0mm;">
							<b>Refundable American opportunity credit.</b> Multiply line 7 by 40% (0.40). Enter the amount here and on
							<span style="float:left;"> Form 1040 or 1040-SR, line 29. Then go to line 9 below</span>
                            <!--Dotted Line -->
						    <span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>	
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:7mm;width:7.1mm;padding-top:3mm;border-bottom-width:0px;">8</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:7mm;padding-top:3mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIData/RefundableAmerOppCreditAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!-- Part lI -->
					<!-- Part lI - Header -->
					<div class="styBB" style="width:187mm;height:auto;border-style:solid; border-bottom-width:1px;border-top-width:1px;           border-right-width:0px;border-left-width:0px;float:left;">
						<span class="styPartName" style="width:15mm;font-size:13;height:auto;">Part II</span>
						<span style="width:170mm;font-weight:normal;height:auto;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;vertical-align:bottom;"/>
							<b>Nonrefundable Education Credits</b>
						</span>
					</div>
					<!--Line 9-->
					<div style="width:187mm;clear:all;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 4.25mm">9</div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                            <span style="float:left;">Subtract line 8 from line 7. Enter here and on line 2 of the Credit Limit Worksheet (see instructions)</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
						</span>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1.2mm;">9</div>
							<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1.2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$PartIIData/TentativeEducCrLessRfdblCrAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 10-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-left: 2.25mm">10</div>
						<div class="styLNDesc" style="font-size:7pt;width:142mm;height:5mm;">
                           After completing Part III for each student, enter the total of all amounts from all Parts III, line 31. If zero, 
                           <span style="float:left;">skip lines 11 through 17, enter -0- on line 18, and go to line 19</span>
                           <!--Dotted Line-->
                           <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:8mm; width:7.1mm;padding-top:4mm;">10</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/TotalQualifiedExpensesAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>					
					<!-- Line 11 -->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">11</div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                            <span style="float:left;"> Enter the smaller of line 10 or $10,000</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">11</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/SmllrOfTotExpnssOrSpcfdAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>					
					<!-- Line 12 -->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">12</div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                            <span style="float:left;">Multiply line 11 by 20% (0.20)</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1mm;">12</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/TentLifetimeLearningCreditAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!--Line13-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">13</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;">
			                Enter: $138,000 if married filing jointly; $69,000 if single, head of 
			                <span style="float:left;">household, or qualifying widow(er)</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:4mm; width:7.1mm; text-align:center; ">13</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/EnterSpecifiedAmountForFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
	                    <div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
					</span>
					</div>
					<!--Line 14-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:11mm;padding-left: 2.25mm">14</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;">
			                Enter the amount from Form 1040 or 1040-SR, line 11. If you're
			                filing Form 2555 or 4563, or you're excluding income from Puerto Rico, see Pub. 970 for the amount
			                <span style="float:left;"> to enter</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:11mm;padding-top:7mm; width:7.1mm; text-align:center; ">14</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:11mm;padding-top:7mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/ModifiedAGIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
	                    <div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:11mm;"/>
						</span>
					</div>
					<!--Line 15-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">15</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;">
			                 Subtract line 14 from line 13. If zero or less, skip lines 16 and 17, enter
			                 <span style="float:left;"> -0- on line 18, and go to line 19</span>
                             <!--Dotted Line-->
                             <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:4mm; width:7.1mm; text-align:center; ">15</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/SubtractAGIFromAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
	                    <div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
						</span>
					</div>
					<!--Line 16-->
					<div style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:8mm;padding-left: 2.25mm">16</div>
						<div class="styLNDesc" style="font-size:7pt;width:104.98mm;height:4mm;">
			                Enter: $20,000 if married filing jointly; $10,000 if single, head of household,
			                <span style="float:left;"> or qualifying widow(er)</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="font-size:7pt;height:8mm;padding-top:4mm; width:7.1mm; text-align:center; ">16</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/SpecifiedAmtPerFSAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
          	            <div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:8mm;"/>
					</span>
					</div>
					<!--LINE 17 -->
					<div class="styGenericDiv " style="width:187mm;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1mm;padding-left: 2.25mm">17</div>
						<div class="styLNDesc" style="width:142mm;padding-top:1mm;"> If line 15 is:
                       </div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style=" width:7.1mm;background-color:lightgrey;border-bottom-width:0px;height:5mm"/>
						<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:0px;height:5mm"/>
						</span>
						<br/>
						<div class="styGenericDiv " style="width:187mm;">
							<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:6mm;"/>
							<div class="styLNDesc" style="width:144mm;height:8mm;padding-left: 2.25mm">
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                                Equal to or more than line 16, enter 1.000 on  line 17 and go to line 18<br/>
								<img src="{$ImagePath}/8863_Bullet_Round.gif" alt="bullet image"/>
                                 Less than line 16, divide line 15 by line 16. Enter the result as a decimal (rounded to at least  <br/>
								<span style="float:left;"><span style="width:2mm;"/> three places)</span>
                                <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
							</div>
							</span>
							<span style="float:right;width:36.9mm;">
							<div class="styLNRightNumBox" style="width:7.1mm;height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:29.8mm;height:6mm;border-bottom-width:0px;">
                            </div>
							<div class="styLNRightNumBox" style=" width:7.1mm;border-bottom-width:1px;height:5mm;padding-top:1.2mm;">17</div>
							<div class="styLNAmountBox" style="width:29.8mm;border-bottom-width:1px;height:5mm;padding-top:1.2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$PartIIData/CalcTentativeEducationRt"/>
								</xsl:call-template>
							</div>
							</span>
						</div>
					</div>
					<!-- END LINE 18 -->
					<!--Line 18-->
					<div style="width:187mm;clear:all;">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">18</div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
                             Multiply line 12 by line 17. Enter here and on line 1 of the Credit Limit Worksheet (see instructions)
 							<span class="styBoldText" style="width:3mm;"></span>
							<img src="{$ImagePath}/8863_Bullet.gif" alt="Right Arrow"/>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:5mm;width:7.1mm;padding-top:1.2mm;">18</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:5mm;padding-top:1.2mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/CalcTentativeEducationCrAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					<!--Line 19-->
					<div style="width:187mm;border-bottom:1px solid black">
						<span style="float:left;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:5mm;padding-top:1mm;padding-left: 2.25mm">19</div>
						<div class="styLNDesc" style="width:142mm;height:5mm;padding-top:1mm;">
							<b>Nonrefundable education credits.</b> Enter the amount from line 7 of the Credit Limit Worksheet 
							<span style="float:left;">(see instructions) here and on Schedule 3 (Form 1040), line 3</span>
                            <!--Dotted Line-->
                            <span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						</span>
						<span style="float:right;">
						<div class="styLNRightNumBox" style="height:8mm;width:7.1mm;padding-top:4.2mm;border-bottom-width:0px">19</div>
						<div class="styLNAmountBox" style="width:29.8mm;height:8mm;padding-top:4.2mm;border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$PartIIData/NonrefundableEducationCrAmt"/>
							</xsl:call-template>
						</div>
						</span>
					</div>
					</div>	
					<!-- Page 1 End -->
                    <!-- Page Break and Footer-->
	                <div class="pageEnd" style="width:187mm;padding-top:0mm;border-top-width:1px;page-break-after:always;display:block;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:4mm;"/>							
							<span style="width:19mm"/>                        
                           Cat. No. 25379M
                        </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
                            Form <span class="styBoldText" style="font-size:8pt;">8863</span> (2020)
                        </div>
                    </div>  
                    <!--Begin Page 2 -->    
					<xsl:for-each select="$PartIIIData">
						<xsl:if test="position() &gt; 1">
							<div class="pageEnd" style="page-break-after:always;display:block;"/>
						</xsl:if>
						<xsl:call-template name="Form8863Page2">
							<xsl:with-param name="NodeData" select="."/>
							<xsl:with-param name="outsidePos" select="position()"/>
						</xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($PartIIIData) = 0">
						<xsl:call-template name="Form8863Page2"/>
					</xsl:if> 					
					<!-- BEGIN Left Over Table -->
					<div class="pageEnd" style="page-break-after:always;display:block;"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">Additional Data</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8863Data"/>
							<xsl:with-param name="DescWidth" select="105"/>
						</xsl:call-template>
						<xsl:for-each select="$Form8863Data/AmericanOpportunityCreditGroup">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 1(a) - American Opportunity Student <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="AmerOppStudentNameControl"/>
								<xsl:with-param name="DescWidth" select="105"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$Form8863Data/LifetimeLearningCreditGroup">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 3(a) - Lifetime Student <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="LifetimeStudentNameControl"/>
								<xsl:with-param name="DescWidth" select="105"/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$Form8863Data/StudentAndEducationalInstnGrp">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part III Line 20  -  Student <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="StudentNameControlTxt"/>
								<xsl:with-param name="DescWidth" select="105"/>
							</xsl:call-template>
						</xsl:for-each>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
